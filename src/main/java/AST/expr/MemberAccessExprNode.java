package AST.expr;

import AST.ASTVisitor;
import Util.Pos;

public class MemberAccessExprNode extends ExprNode {
    public ExprNode instanceName;
    public String member;
    public Boolean isFunction;

    public MemberAccessExprNode(Pos pos, ExprNode instanceName, String member) {
        super(pos);
        this.instanceName = instanceName;
        this.member = member;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public void getTypeAndLValue() {

    }
}
