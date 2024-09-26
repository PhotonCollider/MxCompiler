package AST.stmt;

import Util.Pos;
import AST.ASTVisitor;
import AST.expr.ExprNode;

public class IfStmtNode extends StmtNode {
    public boolean haveReturned;
    public ExprNode cond;
    public SuiteStmtNode thenStmt, elseStmt;

    private static int totalIfNodesCnt = 0;
    public final int id; // used in IRBuilder, starts from 0
    // through forcing these to be suite statements, we can simply do the scope check in suiteStmts

    public IfStmtNode(Pos pos, ExprNode condition, StmtNode thenStmt, StmtNode elseStmt) {
        super(pos);
        cond = condition;
        if (thenStmt == null) {
            this.thenStmt = new SuiteStmtNode(pos);
        } else {
            this.thenStmt = new SuiteStmtNode(thenStmt);
        }
        if (elseStmt == null) {
            this.elseStmt = new SuiteStmtNode(pos);
        } else {
            this.elseStmt = new SuiteStmtNode(elseStmt);
        }
        haveReturned = false;
        id = totalIfNodesCnt++;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
