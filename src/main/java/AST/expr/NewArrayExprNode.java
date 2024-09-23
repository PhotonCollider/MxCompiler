package AST.expr;

import AST.ASTVisitor;
import AST.expr.atom.ArrayLiteralNode;
import Util.Pos;
import Util.type.Type;
import Util.error.InvalidTypeError;
import Util.error.TypeMismatchError;

import java.util.ArrayList;

public class NewArrayExprNode extends ExprNode {
    public ArrayList<ExprNode> fixedSizeList;
    public ArrayLiteralNode init;

    public NewArrayExprNode(Pos pos, Type type, ArrayLiteralNode init) {
        super(pos);
        this.type = type;
        fixedSizeList = new ArrayList<>();
        this.init = init;
    }

    @Override
    public void getTypeAndLValue() {
        for (var expr : fixedSizeList) {
            if (!expr.type.equals(new Type("int", 0))) {
                throw new InvalidTypeError(pos, "expecting size specifier of type int, found " + expr.type);
            }
        }
        if (init != null && !init.type.equals(type)) {
            throw new TypeMismatchError(pos, "expecting literal of type " + type + ", found type " + init.type);
        }
        isLeft = false;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
