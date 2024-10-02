package IR.Value.Const;

import IR.Type.IRIntType;
import IR.Value.IRValue;

public class IRIntConst extends IRValue {
    public final int val;

    public IRIntConst(int val) {
        super(new IRIntType(32));
        this.val = val;
    }

    @Override
    public String toString() {
        return String.valueOf(val);
    }
}
