package AST.def;

import java.util.ArrayList;

import AST.ASTNode;
import AST.ASTVisitor;
import AST.stmt.StmtNode;
import Util.Pos;

public class ConstructorDefNode extends ASTNode {
    public String name;
    public ArrayList<StmtNode> stmts;

    public ConstructorDefNode(Pos pos, String className) {
        super(pos);
        name = className;
        stmts = new ArrayList<>();
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}