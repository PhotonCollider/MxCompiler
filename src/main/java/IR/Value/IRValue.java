package IR.Value;

import IR.IRNode;
import IR.Type.IRType;

public abstract class IRValue {
    public IRType type;

    public IRValue(IRType type) {
        this.type = type;
    }
}
