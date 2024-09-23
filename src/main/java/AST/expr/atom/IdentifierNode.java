package AST.expr.atom;

import AST.ASTVisitor;
import Util.Pos;

public class IdentifierNode extends AtomExprNode {
    public String name;

    public IdentifierNode(Pos pos, String name) {
        super(pos);
        this.name = name;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public void getTypeAndLValue() {
        isLeft = true;
        // type cannot be got at this point, must refer to declaration
    }
}
