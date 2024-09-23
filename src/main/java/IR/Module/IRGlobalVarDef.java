package IR.Module;

import IR.IRNode;
import IR.IRVisitor;
import IR.Type.IRIntType;
import IR.Type.IRPtrType;
import IR.Type.IRType;
import IR.Value.Var.IRGlobalVar;

public class IRGlobalVarDef extends IRNode {
    IRGlobalVar variable;

    public IRGlobalVarDef(IRGlobalVar variable) {
        this.variable = variable;
    }

    @Override
    public String toString() {
        IRType baseType = ((IRPtrType) variable.type).dereference();
        if (baseType instanceof IRIntType) {
            return String.format("@%s = global %s 0\n", variable.name, baseType);
        } else {
            return String.format("@%s = global ptr null\n", variable.name, variable.type);
        }
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
