package IR.Value.Const;

import IR.Type.IRPtrType;
import IR.Type.IRVoidType;
import IR.Value.IRValue;

public class IRNullConst extends IRValue {
    public IRNullConst() {
        super(new IRPtrType(new IRVoidType(), 1));
    }

    @Override
    public String toString() {
        return "null";
    }
}
