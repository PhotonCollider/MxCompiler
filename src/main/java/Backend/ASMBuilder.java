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
    //    private final ASMBlock funcLabels;
    private ASMBlock curBlock;

    public ASMBuilder() {
        prog = new ASMProgram();
//        funcLabels = new ASMBlock(".functionLabels");
    }

    public ASMProgram getProgram() {
        return prog;
    }

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
//        prog.text.blocks.add(funcLabels);
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
        def.body.add(new ASMWordInst(1));
        prog.data.blocks.add(def);
    }

    @Override
    public void visit(IRFuncDef irFuncDef) {
        curFunc = irFuncDef;
        ASMBlock firstBlock = new ASMBlock(irFuncDef.name); // the entry IRBlock can be combined with the ASM init block
        curBlock = firstBlock;
        firstBlock.body.add(new ASMBinaryInst("addi", "sp", "sp", -irFuncDef.stackSize));
        firstBlock.body.add(new ASMSwInst("ra", "sp", irFuncDef.stackSize - 4));
        for (var irBlock : irFuncDef.body) {
            irBlock.accept(this);
        }
    }

    @Override
    public void visit(IRRetInst irRetInst) {
        if (irRetInst.retVal != null) {
            loadValue("a0", irRetInst.retVal);
        }
        curBlock.body.add(new ASMLwInst("ra", "sp", curFunc.stackSize - 4));
        curBlock.body.add(new ASMBinaryInst("addi", "sp", "sp", curFunc.stackSize));
        curBlock.body.add(new ASMRetInst());
        prog.text.blocks.add(curBlock);
        curBlock = null;
    }

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
            } else if (localVar.isAllocaResult){
                curBlock.body.add(new ASMBinaryInst("addi", reg, "sp", ((IRLocalVar) val).stackOffset));
            } else {
                curBlock.body.add(new ASMLwInst(reg, "sp", ((IRLocalVar) val).stackOffset));
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
            if (localVar.isAllocaResult){
                return new ASMAddr("sp", localVar.stackOffset);
            } else {
                curBlock.body.add(new ASMLwInst(availableReg, "sp", ((IRLocalVar) val).stackOffset));
                return new ASMAddr(availableReg, 0);
            }
        }
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
        ASMAddr addr = getAddr(irLoadInst.ptr, "t0");
        curBlock.body.add(new ASMLwInst("t1", addr.reg, addr.offset));
        // all variables except 8 function args are on stack
        curBlock.body.add(new ASMSwInst("t1", "sp", irLoadInst.result.stackOffset));
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
        loadValue("t0", irBinaryInst.lhs);
        loadValue("t1", irBinaryInst.rhs);
        String op = switch (irBinaryInst.op) {
            case "sdiv" -> "div";
            case "srem" -> "rem";
            case "shl" -> "sll";
            case "ashr" -> "sra";
            default -> irBinaryInst.op;
        };
        curBlock.body.add(new ASMBinaryInst(op, "t2", "t0", "t1"));
        curBlock.body.add(new ASMSwInst("t2", "sp", irBinaryInst.result.stackOffset));
    }

    @Override
    public void visit(IRJumpInst irJumpInst) {
        curBlock.body.add(new ASMJInst(irJumpInst.dest.label));
        prog.text.blocks.add(curBlock);
        curBlock = null;
    }

    @Override
    public void visit(IRIcmpInst irIcmpInst) {
        loadValue("t0", irIcmpInst.lhs);
        loadValue("t1", irIcmpInst.rhs);
        switch (irIcmpInst.cond) {
            case "eq" -> {
                curBlock.body.add(new ASMBinaryInst("xor", "t2", "t0", "t1"));
                curBlock.body.add(new ASMBinaryInst("sltiu", "t3", "t2", 1));
            }
            case "ne" -> {
                curBlock.body.add(new ASMBinaryInst("xor", "t2", "t0", "t1"));
                curBlock.body.add(new ASMBinaryInst("sltu", "t3", "x0", "t2"));
            }
            case "slt" -> curBlock.body.add(new ASMBinaryInst("slt", "t3", "t0", "t1"));
            case "sle" -> {
                curBlock.body.add(new ASMBinaryInst("slt", "t2", "t1", "t0"));
                curBlock.body.add(new ASMBinaryInst("sltiu", "t3", "t2", 1));
            }
            case "sgt" -> curBlock.body.add(new ASMBinaryInst("slt", "t3", "t1", "t0"));
            case "sge" -> {
                curBlock.body.add(new ASMBinaryInst("slt", "t2", "t0", "t1"));
                curBlock.body.add(new ASMBinaryInst("sltiu", "t3", "t2", 1));
            }
        }
        curBlock.body.add(new ASMSwInst("t3", "sp", irIcmpInst.result.stackOffset));
    }

    @Override
    public void visit(IRStoreInst irStoreInst) {
        ASMAddr addr = getAddr(irStoreInst.ptr, "t0");
        loadValue("t1", irStoreInst.value);
        // all variables except 8 function args are on stack
        curBlock.body.add(new ASMSwInst("t1", addr.reg, addr.offset));
    }

    @Override
    public void visit(IRFuncDecl irFuncDecl) {

    }

    @Override
    public void visit(IRGetelementptrInst irGetelementptrInst) {
        loadValue("t0", irGetelementptrInst.ptr);
        loadValue("t1", irGetelementptrInst.id1);
        loadValue("t2", irGetelementptrInst.result);
        if (irGetelementptrInst.id2 == -1) { // simple move
            curBlock.body.add(new ASMLiInst("t3", ((IRPtrType) irGetelementptrInst.ptr.type).dereference().sizeInBytes()));
            curBlock.body.add(new ASMBinaryInst("mul", "t4", "t3", "t1"));
            curBlock.body.add(new ASMBinaryInst("add", "t0", "t0", "t4"));
        } else {
            curBlock.body.add(new ASMBinaryInst("addi", "t0", "t0", 4 * irGetelementptrInst.id2));
        }
        curBlock.body.add(new ASMSwInst("t0", "t2", 0));
    }

    @Override
    public void visit(IRBrInst irBrInst) {
        loadValue("t0", irBrInst.cond);
        curBlock.body.add(new ASMBgtzInst("t0", irBrInst.trueBlock.label));
        curBlock.body.add(new ASMJInst(irBrInst.falseBlock.label));
        prog.text.blocks.add(curBlock);
        curBlock = null;
    }

    @Override
    public void visit(IRCallInst irCallInst) {
        // no need to save cur func args when calling, they are right values in ir and are temporary
        for (int i = 0; i < Math.min(8, irCallInst.args.size()); i++) {
            loadValue("a" + i, irCallInst.args.get(i));
        }
        for (int i = 8; i < irCallInst.args.size(); i++) {
            loadValue("t0", irCallInst.args.get(i));
            curBlock.body.add(new ASMSwInst("t0", "sp", 4 * (i - 8)));
        }
        curBlock.body.add(new ASMCallInst(irCallInst.funcName));
        if (irCallInst.result != null) {
            curBlock.body.add(new ASMSwInst("a0", "sp", irCallInst.result.stackOffset));
        }
    }
}
