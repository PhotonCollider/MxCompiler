package AST.stmt;

import AST.ASTVisitor;
import Util.Pos;

import java.util.ArrayList;
import java.util.List;

public class SuiteStmtNode extends StmtNode {
    public boolean haveReturned;
    public ArrayList<StmtNode> stmtNodes;

    public SuiteStmtNode(Pos pos) {
        super(pos);
        haveReturned = false;
        stmtNodes = new ArrayList<>();
    }

    public SuiteStmtNode(StmtNode node) {
        super(node.pos);
        if (node instanceof SuiteStmtNode) {
            stmtNodes = ((SuiteStmtNode) node).stmtNodes;
        } else {
            stmtNodes = new ArrayList<>(List.of(node));
        }
        haveReturned = false;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
