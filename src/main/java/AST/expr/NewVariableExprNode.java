package AST.expr;

import AST.ASTVisitor;
import Util.Pos;
import Util.type.Type;

public class NewVariableExprNode extends ExprNode {
    public NewVariableExprNode(Pos pos, Type type) {
        super(pos);
        this.type = type;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public void getTypeAndLValue() {
        // type is already initialized
        isLeft = false;
    }
}
