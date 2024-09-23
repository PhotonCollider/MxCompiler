package AST.expr.atom;

import AST.ASTVisitor;
import Util.Pos;
import Util.type.Type;

public class BoolLiteralNode extends AtomExprNode {
    public boolean value;

    public BoolLiteralNode(Pos pos, boolean value) {
        super(pos);
        this.value = value;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public void getTypeAndLValue() {
        isLeft = false;
        type = new Type("bool", 0);
    }
}
