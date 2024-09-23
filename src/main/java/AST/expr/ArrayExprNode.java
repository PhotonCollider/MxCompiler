package AST.expr;

import AST.ASTVisitor;
import Util.Pos;
import Util.type.Type;
import Util.error.InvalidTypeError;

public class ArrayExprNode extends ExprNode {
    public ExprNode array, index;

    public ArrayExprNode(Pos pos, ExprNode array, ExprNode index) {
        super(pos);
        this.array = array;
        this.index = index;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public void getTypeAndLValue() {
        isLeft = true;
        if (!index.type.equals(new Type("int", 0))) {
            throw new InvalidTypeError(pos, "expecting int inside '[' ']', found " + index.type);
        }
        if (array.type.dimension <= 0) {
            throw new InvalidTypeError(pos, "expecting array, found " + array.type);
        }
        type = new Type(array.type.name, array.type.dimension - 1);
    }
}
