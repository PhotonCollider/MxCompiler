package AST.expr.atom;

import AST.ASTVisitor;
import AST.expr.ExprNode;
import Util.Pos;
import Util.type.Type;
import Util.error.InvalidTypeError;

import java.util.ArrayList;

public class FStringNode extends AtomExprNode {
    public ArrayList<ExprNode> exprs;
    public ArrayList<String> strings;

    public FStringNode(Pos pos) {
        super(pos);
        exprs = new ArrayList<>();
        strings = new ArrayList<>();
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public void getTypeAndLValue() {
        isLeft = false;
        type = new Type("string", 0);
        for (ExprNode expr : exprs) {
            if (!expr.type.equals(new Type("int", 0)) && !expr.type.equals(new Type("bool", 0)) &&
                    !expr.type.equals(new Type("string", 0))) {
                throw new InvalidTypeError(pos, "expecting one of \"int\", \"bool\", \"string\"");
            }
        }
    }

    public static String getFString(String str, int begin, int end) {
        return str.substring(begin, str.length() + end).replace("\\\\", "\\").
                replace("\\n", "\n").replace("\\\"", "\"").
                replace("$$", "$");
    }
}
