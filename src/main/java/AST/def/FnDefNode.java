package AST.def;

import AST.ASTNode;
import AST.ASTVisitor;
import AST.stmt.StmtNode;
import Util.Pair;
import Util.type.Type;
import Util.Pos;

import java.util.ArrayList;

public class FnDefNode extends ASTNode {
    public Type retType;
    public String name;
    public ArrayList<Pair<String, Type>> paramList;
    public ArrayList<StmtNode> body;

    public FnDefNode(Pos pos, Type retType, String name) {
        super(pos);
        this.retType = retType;
        this.name = name;
        paramList = new ArrayList<>();
        body = new ArrayList<>();
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
