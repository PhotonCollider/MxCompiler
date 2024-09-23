package AST.def;

import AST.ASTNode;
import AST.ASTVisitor;
import Util.Pos;
import Util.scope.ClassScope;

import java.util.ArrayList;

public class ClassDefNode extends ASTNode {
    public final String name;
    public ConstructorDefNode constructor;
    public ArrayList<VarDefNode> varDefs;
    public ArrayList<FnDefNode> fnDefs;
    public ClassScope scope;

    public ClassDefNode(Pos pos, String name, ConstructorDefNode constructor) {
        super(pos);
        this.name = name;
        this.constructor = constructor;
        this.varDefs = new ArrayList<>();
        this.fnDefs = new ArrayList<>();
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
