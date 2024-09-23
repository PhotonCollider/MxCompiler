package AST.stmt;

import AST.ASTVisitor;
import Util.Pos;

public class BreakStmtNode extends StmtNode {
    public BreakStmtNode(Pos pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
