package Backend;

import IR.IRVisitor;
import IR.Inst.*;
import IR.Module.*;
import IR.Type.IRPtrType;
import IR.Value.Var.IRLocalVar;

// initializes stackOffset for all IRLocalVars
public class StackManager implements IRVisitor {
    final boolean debugMode;
    int curSizeSum = 0, curFuncMaxCallArg = 0;
    IRFuncDef curFunc;

    public StackManager(boolean debugMode) {
        this.debugMode = debugMode;
    }

    private void addVariable(IRLocalVar v) {
        if (v.isStackPointer) {
            curSizeSum += ((IRPtrType) v.type).dereference().sizeInBytes();
        } else {
            curSizeSum += v.type.sizeInBytes();
        }
        curFunc.localVarSet.add(v);
    }

    @Override
    public void visit(IRProgramNode irProgramNode) {
        for (var funcDef : irProgramNode.funcDefMap.values()) {
            funcDef.accept(this);
        }
    }

    @Override
    public void visit(IRFuncDef irFuncDef) {
        curFunc = irFuncDef;
        curSizeSum = 4; // return address
        curFuncMaxCallArg = 0;
        for (var block : irFuncDef.body) {
            block.accept(this);
        }
        irFuncDef.stackSize = (curSizeSum + Math.max(curFuncMaxCallArg - 8, 0) * 4 + 15) / 16 * 16;
        int curOffset = Math.max(curFuncMaxCallArg - 8, 0) * 4;
        for (int i = 0; i < irFuncDef.localVarSet.size(); i++) {
            irFuncDef.localVarSet.get(i).stackOffset = curOffset;
            if (debugMode) {
                System.out.println(irFuncDef.localVarSet.get(i).toString() + "\t\t" + curOffset + "(sp)");
            }
            curOffset += irFuncDef.localVarSet.get(i).type.sizeInBytes();
        }
        // NOTE: the arguments in fnDef is very different from the arguments in fnCall !!!
        for (int i = 8; i < irFuncDef.args.size(); i++) {
            irFuncDef.args.get(i).stackOffset = irFuncDef.stackSize + (i - 8) * 4;
        }
        for (int i = 0; i < Math.min(8, irFuncDef.args.size()); i++) {
            irFuncDef.args.get(i).reg = "a" + i;
        }
    }

    @Override
    public void visit(IRBasicBlock irBasicBlock) {
        for (var inst : irBasicBlock.body) {
            inst.accept(this);
        }
    }

    @Override
    public void visit(IRBinaryInst irBinaryInst) {
        addVariable(irBinaryInst.result);
    }

    @Override
    public void visit(IRAllocaInst irAllocaInst) {
        irAllocaInst.ptr.isStackPointer = true;
        addVariable(irAllocaInst.ptr);
    }

    @Override
    public void visit(IRLoadInst irLoadInst) {
        addVariable(irLoadInst.result);
    }

    @Override
    public void visit(IRGetelementptrInst irGetelementptrInst) {
        addVariable(irGetelementptrInst.result);
    }

    @Override
    public void visit(IRIcmpInst irIcmpInst) {
        addVariable(irIcmpInst.result);
    }

    @Override
    public void visit(IRCallInst irCallInst) {
        if (irCallInst.result != null) {
            addVariable(irCallInst.result);
        }
        curFuncMaxCallArg = Math.max(curFuncMaxCallArg, irCallInst.args.size());
    }

    @Override
    public void visit(IRJumpInst irJumpInst) {

    }

    @Override
    public void visit(IRRetInst irRetInst) {

    }

    @Override
    public void visit(IRStoreInst irStoreInst) {

    }

    @Override
    public void visit(IRFuncDecl irFuncDecl) {

    }

    @Override
    public void visit(IRGlobalVarDef irGlobalVarDef) {

    }

    @Override
    public void visit(IRStructDef irStructDef) {

    }

    @Override
    public void visit(IRStringLiteralDef irStringLiteralDef) {

    }

    @Override
    public void visit(IRBrInst irBrInst) {

    }

    @Override
    public void visit(IRPhiInst irPhiInst) {

    }

    @Override
    public void visit(IRSelectInst irSelectInst) {

    }
}
