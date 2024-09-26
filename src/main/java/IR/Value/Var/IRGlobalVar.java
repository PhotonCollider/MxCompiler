package IR.Value.Var;

import IR.Type.IRType;
import IR.Value.IRValue;

public class IRGlobalVar extends IRValue {
    public final String name;

    public IRGlobalVar(IRType type, String name) {
        super(type);
        this.name = name;
    }

    @Override
    public String toString() {
        return "@" + name;
    }
}
