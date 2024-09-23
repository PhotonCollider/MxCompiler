package AST.expr.atom;

import AST.ASTVisitor;
import Util.Pos;
import Util.type.Type;

public class StringLiteralNode extends AtomExprNode {
    public String str;

    public StringLiteralNode(Pos pos, String str) {
        super(pos);
        this.str = str;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public void getTypeAndLValue() {
        type = new Type("string", 0);
        isLeft = false;
    }

    public static String getString(String str) {
        return str.substring(1, str.length() - 1).replace("\\\\", "\\").
                replace("\\n", "\n").replace("\\\"", "\"");
    }
}
