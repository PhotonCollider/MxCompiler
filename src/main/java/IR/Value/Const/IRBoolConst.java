package IR.Value.Const;

import IR.Type.IRIntType;
import IR.Value.IRValue;

public class IRBoolConst extends IRValue {
    public final boolean val;

    public IRBoolConst(boolean val) {
        super(new IRIntType(1));
        this.val = val;
    }

    @Override
    public String toString() {
        return val ? "true" : "false";
    }
}
