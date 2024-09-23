package AST.stmt;

import AST.ASTNode;
import Util.Pos;

public abstract class StmtNode extends ASTNode {
    public StmtNode(Pos pos) {
        super(pos);
    }
}
