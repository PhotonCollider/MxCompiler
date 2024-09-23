package AST.expr.atom;

import AST.expr.ExprNode;
import Util.Pos;

public abstract class AtomExprNode extends ExprNode {
    public AtomExprNode(Pos pos) {
        super(pos);
    }
}