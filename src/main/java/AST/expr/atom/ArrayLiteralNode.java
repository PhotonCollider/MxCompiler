package AST.expr.atom;

import AST.ASTVisitor;
import Util.Pos;
import Util.type.Type;
import Util.error.TypeMismatchError;

import java.util.ArrayList;

public class ArrayLiteralNode extends AtomExprNode {
    public ArrayList<AtomExprNode> literals;

    public ArrayLiteralNode(Pos pos) {
        super(pos);
        isLeft = false;
        literals = new ArrayList<>();
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public void getTypeAndLValue() {
        isLeft = false;
        type = getPossibleType();
        // check type
        for (AtomExprNode expr : literals) {
            expr.getTypeAndLValue();
            if (!expr.type.equals(new Type(type.name, type.dimension - 1))) {
                throw new TypeMismatchError(pos, "type mismatch inside array literal");
            }
        }
    }

    private Type getPossibleType() {
        for (AtomExprNode expr : literals) {
            if (expr instanceof ArrayLiteralNode) {
                Type ret = ((ArrayLiteralNode) expr).getPossibleType();
                if (!ret.name.equals("null")) {
                    return new Type(ret.name, ret.dimension + 1);
                }
            } else {
                if (!(expr instanceof NullLiteralNode)) {
                    expr.getTypeAndLValue();
                    return new Type(expr.type.name, 1);
                }
            }
        }
        return new Type("null", 0);
    }
}
