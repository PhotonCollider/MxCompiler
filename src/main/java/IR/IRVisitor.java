package IR;

import IR.Inst.*;
import IR.Module.*;

public interface IRVisitor {
    void visit(IRBinaryInst irBinaryInst);

    void visit(IRBasicBlock irBasicBlock);

    void visit(IRJumpInst irJumpInst);

    void visit(IRRetInst irRetInst);

    void visit(IRAllocaInst irAllocaInst);

    void visit(IRLoadInst irLoadInst);

    void visit(IRStoreInst irStoreInst);

    void visit(IRGetelementptrInst irGetelementptrInst);

    void visit(IRIcmpInst irIcmpInst);

    void visit(IRCallInst irCallInst);

    void visit(IRPhiInst irPhiInst);

    void visit(IRSelectInst irSelectInst);

    void visit(IRFuncDef irFuncDef);

    void visit(IRFuncDecl irFuncDecl);

    void visit(IRGlobalVarDef irGlobalVarDef);

    void visit(IRStructDef irStructDef);

    void visit(IRStringLiteralDef irStringLiteralDef);

    void visit(IRProgramNode irProgramNode);

    void visit(IRBrInst irBrInst);
}
