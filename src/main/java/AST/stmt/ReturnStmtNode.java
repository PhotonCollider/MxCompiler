package AST.stmt;

import AST.ASTVisitor;
import AST.expr.ExprNode;
import Util.Pos;

public class ReturnStmtNode extends StmtNode {
    public ExprNode ret;
    
    public ReturnStmtNode(Pos pos, ExprNode ret) {
        super(pos);
        this.ret = ret;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
