package IR.Inst;

import IR.IRVisitor;
import IR.Value.IRValue;
import IR.Value.Var.IRLocalVar;

import java.util.ArrayList;
import java.util.Arrays;

public class IRCallInst extends IRInst {
    public IRLocalVar result;
    public String funcName;
    public ArrayList<IRValue> args;

    public IRCallInst(IRLocalVar result, String funcName, IRValue... args) {
        this.result = result;
        this.funcName = funcName;
        this.args = new ArrayList<>();
        this.args.addAll(Arrays.asList(args));
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        if (result == null) {
            sb.append("call void");
        }
        else {
            sb.append(result).append(" = call ").append(result.type);
        }
        sb.append(" @").append(funcName).append("(");
        for (int i = 0; i < args.size(); i++) {
            sb.append(args.get(i).type).append(" ").append(args.get(i));
            if (i < args.size() - 1) {
                sb.append(", ");
            }
        }
        sb.append(")");
        return sb.toString();
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
