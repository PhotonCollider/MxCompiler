package AST.expr.atom;

import AST.ASTVisitor;
import Util.Pos;
import Util.type.Type;

public class IntLiteralNode extends AtomExprNode {
    public int val;

    public IntLiteralNode(Pos pos, int val) {
        super(pos);
        this.val = val;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public void getTypeAndLValue() {
        type = new Type("int", 0);
        isLeft = false;
    }
}
