package AST.stmt;

import AST.ASTVisitor;
import AST.expr.ExprNode;
import AST.expr.ParenExprNode;
import AST.expr.atom.BoolLiteralNode;
import Util.Pos;

import java.util.ArrayList;

public class ForStmtNode extends StmtNode {
    public StmtNode init;
    public ExprNode cond, update;
    public ArrayList<StmtNode> body;

    private static int totalForNodesCnt = 0;
    public final int id; // used in IRBuilder, starts from 0

    public ForStmtNode(Pos pos, StmtNode init, ExprNode cond, ExprNode update) {
        super(pos);
        if (init == null) {
            this.init = new SuiteStmtNode(pos);
        } else {
            this.init = init;
        }
        if (cond == null) {
            this.cond = new BoolLiteralNode(pos, true);
        } else {
            this.cond = cond;
        }
        if (update == null) {
            this.update = new BoolLiteralNode(pos, true); // does nothing
        } else {
            this.update = update;
        }
        body = new ArrayList<>();
        id = totalForNodesCnt++;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
