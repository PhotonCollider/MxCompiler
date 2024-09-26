package AST.stmt;

import AST.ASTVisitor;
import AST.def.VarDefNode;
import Util.Pos;

public class VarDefStmtNode extends StmtNode {
    public VarDefNode varDef;

    public VarDefStmtNode(Pos pos, VarDefNode varDef) {
        super(pos);
        this.varDef = varDef;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
