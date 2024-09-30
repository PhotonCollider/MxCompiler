package Backend;

import ASM.Module.ASMRootNode;
import IR.IRVisitor;
import IR.Inst.*;
import IR.Module.*;

public class ASMBuilder implements IRVisitor {
    ASMRootNode prog;

    public ASMBuilder() {
        prog = new ASMRootNode();
    }

    @Override
    public void visit(IRBinaryInst IRBinaryInst) {

    }

    @Override
    public void visit(IRBasicBlock irBasicBlock) {

    }

    @Override
    public void visit(IRJumpInst irJumpInst) {

    }

    @Override
    public void visit(IRRetInst irRetInst) {

    }

    @Override
    public void visit(IRAllocaInst irAllocaInst) {

    }

    @Override
    public void visit(IRLoadInst irLoadInst) {

    }

    @Override
    public void visit(IRStoreInst irStoreInst) {

    }

    @Override
    public void visit(IRGetelementptrInst irGetelementptrInst) {

    }

    @Override
    public void visit(IRIcmpInst irIcmpInst) {

    }

    @Override
    public void visit(IRCallInst irCallInst) {

    }

    @Override
    public void visit(IRPhiInst irPhiInst) {

    }

    @Override
    public void visit(IRSelectInst irSelectInst) {

    }

    @Override
    public void visit(IRFuncDef irFuncDef) {

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
    public void visit(IRProgramNode irProgramNode) {

    }

    @Override
    public void visit(IRBrInst irBrInst) {

    }

    public ASMRootNode getProgram() {
        return prog;
    }
}
