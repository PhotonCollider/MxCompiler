package AST.expr;

import AST.ASTNode;
import Util.Pos;
import Util.type.Type;

public abstract class ExprNode extends ASTNode {
    public Type type;
    public boolean isLeft;

    public ExprNode(Pos pos) {
        super(pos);
    }

    public abstract void getTypeAndLValue();
}
