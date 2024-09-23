package IR;

import IR.Inst.*;
import IR.Module.*;
import IR.Value.Var.IRGlobalVar;
import IR.Value.Var.IRLocalVar;

public interface IRVisitor {
    void visit(IRBinaryInst IRBinaryInst);

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

    void visit(IRRootNode irRootNode);

    void visit(IRBrInst irBrInst);
}
