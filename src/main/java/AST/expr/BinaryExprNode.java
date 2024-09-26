package AST.expr;

import AST.ASTVisitor;
import Util.Pos;
import Util.type.Type;
import Util.error.TypeMismatchError;

public class BinaryExprNode extends ExprNode {
    public ExprNode lhs, rhs;
    public String op;

    public BinaryExprNode(Pos pos, ExprNode lhs, ExprNode rhs, String op) {
        super(pos);
        this.lhs = lhs;
        this.rhs = rhs;
        this.op = op;
    }

    @Override
    public void accept(ASTVisitor visitor) {
//        System.out.println("Visiting the binary expr " + op + " , at " + pos);
        visitor.visit(this);
    }

    @Override
    public void getTypeAndLValue() {
        isLeft = false;
        if (op.equals("+") && lhs.type.equals(new Type("string", 0)) &&
                rhs.type.equals(new Type("string", 0))) {
            type = new Type("string", 0);
            return;
        }
        if (op.equals("+") || op.equals("-") || op.equals("*") || op.equals("/") || op.equals("%") ||
                op.equals("<<") || op.equals(">>") || op.equals("&") || op.equals("|") || op.equals("^")) {
            if (lhs.type.equals(new Type("int", 0)) && rhs.type.equals(new Type("int", 0))) {
                type = new Type("int", 0);
                return;
            }
        }
        if (op.equals("<") || op.equals("<=") || op.equals(">") || op.equals(">=")) {
            if ((lhs.type.equals(new Type("int", 0)) && rhs.type.equals(new Type("int", 0))) ||
                    (lhs.type.equals(new Type("string", 0)) && rhs.type.equals(new Type("string", 0)))) {
                type = new Type("bool", 0);
                return;
            }
        }
        if (op.equals("==") || op.equals("!=")) {
            if (lhs.type.equals(rhs.type)) {
                type = new Type("bool", 0);
                return;
            }
        }
        if (op.equals("&&") || op.equals("||")) {
            if (lhs.type.equals(new Type("bool", 0)) && rhs.type.equals(new Type("bool", 0))) {
                type = new Type("bool", 0);
                return;
            }
        }
        throw new TypeMismatchError(pos, "not a valid binary expression");
    }
}
