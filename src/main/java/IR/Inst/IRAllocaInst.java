package IR.Inst;

import IR.IRVisitor;
import IR.Type.IRPtrType;
import IR.Value.IRValue;

public class IRAllocaInst extends IRInst {
    IRValue ptr;

    public IRAllocaInst(IRValue ptr) {
        this.ptr = ptr;
    }

    @Override
    public String toString() {
        return String.format("%s = alloca %s", ptr, ((IRPtrType) ptr.type).dereference());
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
