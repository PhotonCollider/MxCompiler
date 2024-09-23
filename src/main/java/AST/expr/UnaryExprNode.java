package AST.expr;

import AST.ASTVisitor;
import Util.Pos;
import Util.type.Type;
import Util.error.InvalidTypeError;
import Util.error.SemanticError;

public class UnaryExprNode extends ExprNode {
    public ExprNode expr;
    public String op;

    public UnaryExprNode(Pos pos, ExprNode expr, String op) {
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
        if (op.equals("!")) {
            if (expr.type.equals(new Type("bool", 0))) {
                type = new Type("bool", 0);
            } else {
                throw new InvalidTypeError(pos, "expecting bool after operator! , found " + expr.type);
            }
        } else if (op.equals("+") || op.equals("-") || op.equals("~")) {
            if (expr.type.equals(new Type("int", 0))) {
                type = new Type("int", 0);
            } else {
                throw new InvalidTypeError(pos, "expecting int after operator" + op + " , found " + expr.type);
            }
        } else {
            throw new SemanticError(pos, "invalid operator " + op);
        }
    }
}
