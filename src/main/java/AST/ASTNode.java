package AST;

import Util.Pos;

abstract public class ASTNode {
    public Pos pos;

    public ASTNode(Pos pos) {
        this.pos = pos;
    }

    abstract public void accept(ASTVisitor visitor);
}