package IR.Module;

import java.util.HashSet;

import IR.IRNode;
import IR.IRVisitor;
import IR.Type.IRStructType;

public class IRStructDef extends IRNode {
    public IRStructType struct;
    public HashSet<String> memberFuncSet;
    public boolean hasConstructor;

    public IRStructDef(String name, boolean hasConstructor) {
        struct = new IRStructType(name);
        memberFuncSet = new HashSet<>();
        this.hasConstructor = hasConstructor;
    }

    @Override
    public String toString() {
        return String.format("%s = type %s\n", struct, struct.getStructInfo());
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}