package AST.expr;

import AST.ASTVisitor;
import Util.Pos;
import Util.type.Type;
import Util.error.InvalidTypeError;
import Util.error.SemanticError;
import Util.error.TypeMismatchError;

public class PostfixUpdateExprNode extends ExprNode {
    public ExprNode expr;
    public String op;

    public PostfixUpdateExprNode(Pos pos, ExprNode expr, String op) {
        super(pos);
        this.expr = expr;
        this.op = op;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public void getTypeAndLValue() {
        isLeft = false;
        if (!op.equals("++") && !op.equals("--")) {
            throw new SemanticError(pos, "expecting \"++\" or \"--\"");
        }
        if (expr.type.equals(new Type("int", 0))) {
            if (expr.isLeft) {
                type = new Type("int", 0);
            } else {
                throw new TypeMismatchError(pos, "expecting a left value");
            }
        } else {
            throw new InvalidTypeError(pos, "expecting int, found " + expr.type);
        }
    }
}
