package AST.expr.atom;

import AST.ASTVisitor;
import Util.Pos;
import Util.type.Type;

public class NullLiteralNode extends AtomExprNode {
    public NullLiteralNode(Pos pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public void getTypeAndLValue() {
        type = new Type("null", 0);
        isLeft = false;
    }
}
