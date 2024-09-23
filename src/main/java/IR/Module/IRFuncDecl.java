package IR.Module;

import java.util.ArrayList;
import java.util.Arrays;

import IR.IRNode;
import IR.IRVisitor;
import IR.Type.IRType;

public class IRFuncDecl extends IRNode {
    public String name;
    public IRType retType;
    public ArrayList<IRType> argTypeList;

    public IRFuncDecl(String name, IRType returnType, IRType... argTypes) {
        this.name = name;
        retType = returnType;
        argTypeList = new ArrayList<>();
        argTypeList.addAll(Arrays.asList(argTypes));
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(String.format("declare %s @%s(", retType, name));
        for (int i = 0; i < argTypeList.size(); i++) {
            sb.append(argTypeList.get(i));
            if (i < argTypeList.size() - 1) {
                sb.append(", ");
            }
        }
        sb.append(")\n");
        return sb.toString();
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}