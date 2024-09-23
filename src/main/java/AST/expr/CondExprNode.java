package AST.expr;

import AST.ASTVisitor;
import Util.Pos;
import Util.type.Type;
import Util.error.InvalidTypeError;
import Util.error.TypeMismatchError;

public class CondExprNode extends ExprNode {
    public ExprNode cond, left, right;

    public CondExprNode(Pos pos, ExprNode cond, ExprNode left, ExprNode right) {
        super(pos);
        this.cond = cond;
        this.left = left;
        this.right = right;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public void getTypeAndLValue() {
        isLeft = false;
        if (!cond.type.equals(new Type("bool", 0))) {
            throw new InvalidTypeError(pos, "expecting bool as condition expression");
        }
        if (!left.type.equals(right.type)) {
            throw new TypeMismatchError(pos, "types of expr1 and expr2 differ");
        }
        type = left.type;
    }
}
