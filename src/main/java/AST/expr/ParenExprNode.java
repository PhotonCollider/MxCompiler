package AST.expr;

import AST.ASTVisitor;
import Util.Pos;

public class ParenExprNode extends ExprNode {
    public ExprNode expr;

    public ParenExprNode(Pos pos, ExprNode expr) {
        super(pos);
        this.expr = expr;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public void getTypeAndLValue() {
        type = expr.type;
        isLeft = expr.isLeft;
    }
}
