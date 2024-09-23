package AST.stmt;

import AST.ASTVisitor;
import Util.Pos;

public class ContinueStmtNode extends StmtNode {
    public ContinueStmtNode(Pos pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
