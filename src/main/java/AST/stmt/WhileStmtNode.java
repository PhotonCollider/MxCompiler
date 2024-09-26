package AST.stmt;

import AST.ASTVisitor;
import AST.expr.ExprNode;
import Util.Pos;

public class WhileStmtNode extends StmtNode {
    public ExprNode cond;
    public boolean haveReturned = false;
    public SuiteStmtNode body;

    private static int totalWhileNodesCnt = 0;
    public final int id; // used in IRBuilder, starts from 0

    public WhileStmtNode(Pos pos, ExprNode cond, StmtNode thenStmt) {
        super(pos);
        this.cond = cond;
        if (thenStmt == null) {
            this.body = new SuiteStmtNode(pos);
        } else {
            this.body = new SuiteStmtNode(thenStmt);
        }
        id = totalWhileNodesCnt++;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
