package IR.Module;

import IR.IRNode;
import IR.IRVisitor;
import IR.Type.IRType;
import IR.Value.Var.IRLocalVar;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class IRFuncDef extends IRNode {
    public String name;
    public IRType retType;
    public List<IRBasicBlock> body;
    public List<IRLocalVar> args;
    public List<IRLocalVar> localVarSet; // for ASMBuilder
    public int stackSize;

    public IRFuncDef(String name, IRType retType) {
        this.name = name;
        this.retType = retType;
        body = new ArrayList<>();
        args = new ArrayList<>();
        localVarSet = new ArrayList<>();
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
