package AST.expr.atom;

import AST.ASTVisitor;
import Util.Pos;

public class ThisNode extends AtomExprNode {
    public ThisNode(Pos pos) {
        super(pos);
    }

    @Override
    public void getTypeAndLValue() {
        isLeft = false;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}