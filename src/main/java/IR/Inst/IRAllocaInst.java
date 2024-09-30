package IR.Inst;

import IR.IRVisitor;
import IR.Type.IRPtrType;
import IR.Value.IRValue;
import IR.Value.Var.IRLocalVar;

public class IRAllocaInst extends IRInst {
    public IRLocalVar ptr;

    public IRAllocaInst(IRLocalVar ptr) {
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
