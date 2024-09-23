package AST.expr;

import AST.ASTVisitor;
import Util.Pos;

import java.util.ArrayList;

public class FnCallExprNode extends ExprNode {
    public ExprNode fnName;
    public ArrayList<ExprNode> arg;

    public FnCallExprNode(Pos pos, ExprNode fnName) {
        super(pos);
        this.fnName = fnName;
        arg = new ArrayList<>();
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public void getTypeAndLValue() {
        // FnCallExprNode cannot infer its type by its own
        // we must refer to the function's definition
        isLeft = false;
    }
}
