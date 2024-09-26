package IR.Value.Var;

import IR.Type.IRType;
import IR.Value.IRValue;

public class IRLocalVar extends IRValue {
    final String name;

    public IRLocalVar(String name, IRType type) {
        super(type);
        this.name = name;
    }

    @Override
    public String toString() {
        return "%" + name;
    }
}
