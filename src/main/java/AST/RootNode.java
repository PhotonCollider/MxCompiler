package AST;

import Util.Pos;

import java.util.ArrayList;

public class RootNode extends ASTNode {
    public ArrayList<ASTNode> defs; // can only be classDef, fnDef, varDef

    public RootNode(Pos pos) {
        super(pos);
        this.defs = new ArrayList<>();
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
