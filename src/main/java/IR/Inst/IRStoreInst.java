package IR.Inst;

import IR.IRVisitor;
import IR.Value.IRValue;

public class IRStoreInst extends IRInst {
    IRValue value, ptr;

    public IRStoreInst(IRValue value, IRValue ptr) {
        this.value = value;
        this.ptr = ptr;
    }

    @Override
    public String toString() {
        return String.format("store %s %s, ptr %s", value.type, value, ptr);
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
