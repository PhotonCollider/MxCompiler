package IR.Module;

import IR.IRNode;
import IR.IRVisitor;
import IR.Type.IRType;
import IR.Value.Var.IRLocalVar;

import java.util.ArrayList;
import java.util.List;

public class IRFuncDef extends IRNode {
    public String name;
    public IRType retType;
    public List<IRBasicBlock> body;
    public List<IRLocalVar> args;
//    public Set<IRLocalVar> localVarSet;

    public IRFuncDef(String name, IRType retType) {
        this.name = name;
        this.retType = retType;
        body = new ArrayList<>();
        args = new ArrayList<>();
//        localVarSet = new HashSet<>();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(String.format("define %s @%s (", retType, name));
        for (int i = 0; i < args.size(); i++) {
            sb.append(args.get(i).type).append(" ").append(args.get(i));
            if (i < args.size() - 1) {
                sb.append(", ");
            }
        }
        sb.append(") {\n");
        for (var basicBlock : body) {
            sb.append(basicBlock);
        }
        sb.append("}\n");
        return sb.toString();
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
