package IR.Module;

import IR.IRNode;
import IR.IRVisitor;
import IR.Value.Var.IRGlobalVar;

public class IRStringLiteralDef extends IRNode {
    public IRGlobalVar result;
    public String value;

    private final String printValue;

    public IRStringLiteralDef(IRGlobalVar result, String value) {
        this.result = result;
        this.value = value;
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < value.length(); i++) {
            char ch = value.charAt(i);
            switch (ch) {
                case '\\' -> sb.append("\\\\");
                case '\n' -> sb.append("\\0A");
                case '\"' -> sb.append("\\22");
                default -> sb.append(ch);
            }
        }
        printValue = sb.toString();
    }

    @Override
    public String toString() {
        return String.format("%s = private unnamed_addr constant [%d x i8] c\"%s\\00\"\n", result, value.length() + 1, printValue);
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}