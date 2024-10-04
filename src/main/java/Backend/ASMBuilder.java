package Backend;

import ASM.ASMAddr;
import ASM.Inst.*;
import ASM.Module.ASMBlock;
import ASM.Module.ASMProgram;
import IR.IRVisitor;
import IR.Inst.*;
import IR.Module.*;
import IR.Type.IRPtrType;
import IR.Value.Const.IRBoolConst;
import IR.Value.Const.IRIntConst;
import IR.Value.Const.IRNullConst;
import IR.Value.IRValue;
import IR.Value.Var.IRGlobalVar;
import IR.Value.Var.IRLocalVar;

public class ASMBuilder implements IRVisitor {
    private final ASMProgram prog;
    private IRFuncDef curFunc;
    private ASMBlock curBlock;

    public ASMBuilder() {
        prog = new ASMProgram();
    }

    public ASMProgram getProgram() {
        return prog;
    }

    // registers t0-t7 are temporary and can be changed at will
    // lower level util functions can freely use t0-t7, but now we only use t0
    // other functions (higher level util functions and IRVisitor functions) may not use reg t0
    // other functions use s0-s11 instead

    // begin util functions
    //      begin lower level util functions
    void addAddiInst(String res, String rs1, int imm) {
        if (-(1 << 11) <= imm && imm < (1 << 11)) {
            curBlock.body.add(new ASMBinaryInst("addi", res, rs1, imm));
        } else {
            curBlock.body.add(new ASMLiInst("t0", imm));
            curBlock.body.add(new ASMBinaryInst("add", res, "t0", rs1));
        }
    }

    // will not modify rs2 and rs1
    void addSwInst(String rs2, String rs1, int offset) {
        if (-(1 << 11) <= offset && offset < (1 << 11)) {
            curBlock.body.add(new ASMSwInst(rs2, rs1, offset));
        } else {
            curBlock.body.add(new ASMLiInst("t0", offset));
            curBlock.body.add(new ASMBinaryInst("add", "t0", "t0", rs1));
            curBlock.body.add(new ASMSwInst(rs2, "t0", 0));
        }
    }

    void addLwInst(String rd, String rs1, int offset) {
        if (-(1 << 11) <= offset && offset < (1 << 11)) {
            curBlock.body.add(new ASMLwInst(rd, rs1, offset));
        } else {
            curBlock.body.add(new ASMLiInst("t0", offset));
            curBlock.body.add(new ASMBinaryInst("add", "t0", "t0", rs1));
            curBlock.body.add(new ASMLwInst(rd, "t0", 0));
        }
    }

    void addJumpInst(String label) {
        curBlock.body.add(new ASMLaInst("t0", label));
        curBlock.body.add(new ASMJrInst("t0"));
    }

    void saveARegisters(int limit, int callSaveOffset) {
        for (int i = 0; i < limit; i++) {
            addSwInst("a" + i, "sp", callSaveOffset + i * 4);
        }
    }

    void loadARegisters(int limit, int callSaveOffset) {
        for (int i = 0; i < limit; i++) {
            addLwInst("a" + i, "sp", callSaveOffset + i * 4);
        }
    }
    //      end lower level util functions

    void loadValue(String reg, IRValue val) {
        if (val instanceof IRBoolConst) {
            curBlock.body.add(new ASMLiInst(reg, ((IRBoolConst) val).val ? 1 : 0));
        } else if (val instanceof IRIntConst) {
            curBlock.body.add(new ASMLiInst(reg, ((IRIntConst) val).val));
        } else if (val instanceof IRNullConst) {
            curBlock.body.add(new ASMLiInst(reg, 0));
        } else if (val instanceof IRGlobalVar) {
            curBlock.body.add(new ASMLaInst(reg, ((IRGlobalVar) val).name));
        } else if (val instanceof IRLocalVar localVar) {
            if (localVar.reg != null) { // register value
                curBlock.body.add(new ASMMvInst(reg, localVar.reg));
            } else if (localVar.isStackPointer) {
                addAddiInst(reg, "sp", ((IRLocalVar) val).stackOffset);
            } else { // isHeapPointer
                addLwInst(reg, "sp", ((IRLocalVar) val).stackOffset);
            }
        }
    }

    ASMAddr getAddr(IRValue val, String availableReg) {
        if (val instanceof IRGlobalVar) {
            curBlock.body.add(new ASMLaInst(availableReg, ((IRGlobalVar) val).name));
            return new ASMAddr(availableReg, 0);
        } else {
            IRLocalVar localVar = (IRLocalVar) val;
            // this function is used to get the stack addr of a variable
            // so val cannot be a register value
            if (localVar.isStackPointer) {
                return new ASMAddr("sp", localVar.stackOffset);
            } else {
                addLwInst(availableReg, "sp", ((IRLocalVar) val).stackOffset);
                return new ASMAddr(availableReg, 0);
            }
        }
    }
    // end util functions

    // begin IRVisitor functions
    @Override
    public void visit(IRProgramNode irProgramNode) {
        ASMBlock blk = new ASMBlock(null);
        blk.body.add(new ASMGloblInst("main"));
        prog.text.blocks.add(blk);
        for (var funcDef : irProgramNode.funcDefMap.values()) {
            funcDef.accept(this);
        }
        for (var arrLiteral : irProgramNode.arrayLiterals) {
            arrLiteral.accept(this);
        }
        for (var fStringFrag : irProgramNode.fStringFragments) {
            fStringFrag.accept(this);
        }
        for (var globalVar : irProgramNode.globalVarDefs) {
            globalVar.accept(this);
        }
        for (var str : irProgramNode.stringLiterals) {
            str.accept(this);
        }
    }

    @Override
    public void visit(IRStringLiteralDef irStringLiteralDef) {
        ASMBlock def = new ASMBlock(irStringLiteralDef.result.name);
        def.body.add(new ASMAscizInst(irStringLiteralDef.value));
        prog.rodata.blocks.add(def);
    }

    @Override
    public void visit(IRGlobalVarDef irGlobalVarDef) {
        ASMBlock def = new ASMBlock(irGlobalVarDef.variable.name);
        def.body.add(new ASMWordInst());
        prog.data.blocks.add(def);
    }

    @Override
    public void visit(IRFuncDef irFuncDef) {
        curFunc = irFuncDef;
        curBlock = new ASMBlock(irFuncDef.name);
        addAddiInst("sp", "sp", -irFuncDef.stackSize);
        addSwInst("ra", "sp", irFuncDef.stackSize - 4);
        for (var irBlock : irFuncDef.body) {
            irBlock.accept(this);
        }
    }

    @Override
    public void visit(IRRetInst irRetInst) {
        if (irRetInst.retVal != null) {
            loadValue("a0", irRetInst.retVal);
        }
        addLwInst("ra", "sp", curFunc.stackSize - 4);
        addAddiInst("sp", "sp", curFunc.stackSize);
        curBlock.body.add(new ASMRetInst());
        prog.text.blocks.add(curBlock);
        curBlock = null;
    }

    @Override
    public void visit(IRBasicBlock irBasicBlock) {
        if (curBlock == null) { // first block is constructed in visit(IRFuncDef)
            curBlock = new ASMBlock(irBasicBlock.label);
        }
        for (var inst : irBasicBlock.body) {
            inst.accept(this);
        }
    }

    @Override
    public void visit(IRLoadInst irLoadInst) {
        ASMAddr addr = getAddr(irLoadInst.ptr, "s0");
        addLwInst("s1", addr.reg, addr.offset);
        // all variables except 8 function args are on stack
        addSwInst("s1", "sp", irLoadInst.result.stackOffset);
    }

    @Override
    public void visit(IRPhiInst irPhiInst) {
        throw new RuntimeException("PhiInst not implemented yet!");
    }

    @Override
    public void visit(IRSelectInst irSelectInst) {
        throw new RuntimeException("SelectInst not implemented yet!");
    }

    @Override
    public void visit(IRStructDef irStructDef) {

    }

    @Override
    public void visit(IRAllocaInst irAllocaInst) {

    }

    @Override
    public void visit(IRBinaryInst irBinaryInst) {
        loadValue("s0", irBinaryInst.lhs);
        loadValue("s1", irBinaryInst.rhs);
        String op = switch (irBinaryInst.op) {
            case "sdiv" -> "div";
            case "srem" -> "rem";
            case "shl" -> "sll";
            case "ashr" -> "sra";
            default -> irBinaryInst.op;
        };
        curBlock.body.add(new ASMBinaryInst(op, "s2", "s0", "s1"));
        addSwInst("s2", "sp", irBinaryInst.result.stackOffset);
    }

    @Override
    public void visit(IRJumpInst irJumpInst) {
        addJumpInst(irJumpInst.dest.label);
        prog.text.blocks.add(curBlock);
        curBlock = null;
    }

    @Override
    public void visit(IRIcmpInst irIcmpInst) {
        loadValue("s0", irIcmpInst.lhs);
        loadValue("s1", irIcmpInst.rhs);
        switch (irIcmpInst.cond) {
            case "eq" -> {
                curBlock.body.add(new ASMBinaryInst("xor", "s2", "s0", "s1"));
                curBlock.body.add(new ASMBinaryInst("sltiu", "s3", "s2", 1));
            }
            case "ne" -> {
                curBlock.body.add(new ASMBinaryInst("xor", "s2", "s0", "s1"));
                curBlock.body.add(new ASMBinaryInst("sltu", "s3", "x0", "s2"));
            }
            case "slt" -> curBlock.body.add(new ASMBinaryInst("slt", "s3", "s0", "s1"));
            case "sle" -> {
                curBlock.body.add(new ASMBinaryInst("slt", "s2", "s1", "s0"));
                curBlock.body.add(new ASMBinaryInst("sltiu", "s3", "s2", 1));
            }
            case "sgt" -> curBlock.body.add(new ASMBinaryInst("slt", "s3", "s1", "s0"));
            case "sge" -> {
                curBlock.body.add(new ASMBinaryInst("slt", "s2", "s0", "s1"));
                curBlock.body.add(new ASMBinaryInst("sltiu", "s3", "s2", 1));
            }
        }
        addSwInst("s3", "sp", irIcmpInst.result.stackOffset);
    }

    @Override
    public void visit(IRStoreInst irStoreInst) {
        ASMAddr addr = getAddr(irStoreInst.ptr, "s0");
        loadValue("s1", irStoreInst.value);
        // all variables except 8 function args are on stack
        addSwInst("s1", addr.reg, addr.offset);
    }

    @Override
    public void visit(IRFuncDecl irFuncDecl) {

    }

    @Override
    public void visit(IRGetelementptrInst irGetelementptrInst) {
        loadValue("s2", irGetelementptrInst.ptr);
        if (irGetelementptrInst.id2 == -1) { // simple move
            loadValue("s1", irGetelementptrInst.id1);
            curBlock.body.add(new ASMLiInst("s3", ((IRPtrType) irGetelementptrInst.ptr.type).dereference().sizeInBytes()));
            curBlock.body.add(new ASMBinaryInst("mul", "s4", "s3", "s1"));
            curBlock.body.add(new ASMBinaryInst("add", "s2", "s2", "s4"));
        } else {
            addAddiInst("s2", "s2", 4 * irGetelementptrInst.id2);
        }
        addSwInst("s2", "sp", irGetelementptrInst.result.stackOffset);
    }

    @Override
    public void visit(IRBrInst irBrInst) {
        loadValue("s0", irBrInst.cond);
        // just for fun XDD
        // hyperDash is a celeste tech to jump further
        ASMBlock hyperDash = new ASMBlock(null, true);
        curBlock.body.add(new ASMBgtzInst("s0", hyperDash.label));
        addJumpInst(irBrInst.falseBlock.label);
        prog.text.blocks.add(curBlock);
        curBlock = hyperDash;
        addJumpInst(irBrInst.trueBlock.label);
        prog.text.blocks.add(curBlock);
        curBlock = null;
    }

    @Override
    public void visit(IRCallInst irCallInst) {
        saveARegisters(Math.min(8, curFunc.args.size()), curFunc.callSaveOffset);

        for (int i = 0; i < Math.min(8, irCallInst.args.size()); i++) {
            loadValue("a" + i, irCallInst.args.get(i));
        }
        for (int i = 8; i < irCallInst.args.size(); i++) {
            loadValue("s0", irCallInst.args.get(i));
            addSwInst("s0", "sp", 4 * (i - 8));
        }
        curBlock.body.add(new ASMCallInst(irCallInst.funcName));
        if (irCallInst.result != null) {
            addSwInst("a0", "sp", irCallInst.result.stackOffset);
        }

        loadARegisters(Math.min(8, curFunc.args.size()), curFunc.callSaveOffset);
    }
}
