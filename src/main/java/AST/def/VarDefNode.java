package AST.def;

import AST.ASTNode;
import AST.ASTVisitor;
import AST.expr.ExprNode;
import Util.Pair;
import Util.Pos;
import Util.type.Type;

import java.util.ArrayList;

public class VarDefNode extends ASTNode {
    public Type type;
    public ArrayList<Pair<String, ExprNode>> list;
    public VarDefNode(Pos pos, Type type) {
        super(pos);
        this.type = type;
        list = new ArrayList<>();
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
