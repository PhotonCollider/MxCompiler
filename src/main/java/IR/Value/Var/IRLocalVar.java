package IR.Value.Var;

import IR.Type.IRType;
import IR.Value.IRValue;

public class IRLocalVar extends IRValue {
    public final String name;
    public int stackOffset;
    public String reg;
    public boolean isAllocaResult;

    public IRLocalVar(String name, IRType type) {
        super(type);
        this.name = name;
        isAllocaResult = false;
    }

    @Override
    public String toString() {
        return "%" + name;
    }
}
