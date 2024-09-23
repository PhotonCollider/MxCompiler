package AST.stmt;

import AST.ASTVisitor;
import AST.expr.ExprNode;
import Util.Pos;

public class ExprStmtNode extends StmtNode {
    public ExprNode expr;
    public ExprStmtNode(Pos pos, ExprNode expr) {
        super(pos);
        this.expr = expr;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
