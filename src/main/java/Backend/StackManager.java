package Backend;

import IR.IRVisitor;
import IR.Inst.*;
import IR.Module.*;
import IR.Type.IRPtrType;
import IR.Value.Var.IRLocalVar;

// initializes stackOffset for all IRLocalVars
public class StackManager implements IRVisitor {
    int curSizeSum = 0, curFuncMaxCallArg = 0;
    IRFuncDef curFunc;
    static int allocaCnt = 0;

    private void addVariable(IRLocalVar v) {
        curFunc.localVarSet.add(v);
        curSizeSum += v.type.sizeInBytes();
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
            curOffset += irFuncDef.localVarSet.get(i).type.sizeInBytes();
        }
        // NOTE: the arguments in fnDef is very different from the arguments in fnCall !!!
        for (int i = 8; i < irFuncDef.args.size(); i++) {
            irFuncDef.args.get(i).stackOffset = irFuncDef.stackSize + (i - 8) * 4;
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
        addVariable(irAllocaInst.ptr);
        addVariable(new IRLocalVar("allocaResult." + allocaCnt, ((IRPtrType) irAllocaInst.ptr.type).dereference()));
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
