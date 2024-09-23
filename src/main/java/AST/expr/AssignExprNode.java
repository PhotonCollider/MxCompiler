package AST.expr;

import AST.ASTVisitor;
import Util.Pos;
import Util.error.SemanticError;
import Util.error.TypeMismatchError;

public class AssignExprNode extends ExprNode {
    public ExprNode lhs, rhs;

    public AssignExprNode(Pos pos, ExprNode lhs, ExprNode rhs) {
        super(pos);
        this.lhs = lhs;
        this.rhs = rhs;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public void getTypeAndLValue() {
        if (!lhs.type.equals(rhs.type)) {
            throw new TypeMismatchError(pos, "type mismatch");
        }
        if (!lhs.isLeft) {
            throw new SemanticError(pos, "not a left value");
        }
        isLeft = false;
        type = lhs.type;
    }
}
