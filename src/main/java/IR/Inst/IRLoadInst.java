package IR.Inst;

import IR.IRVisitor;
import IR.Value.IRValue;
import IR.Value.Var.IRLocalVar;

public class IRLoadInst extends IRInst {
    public IRLocalVar result;
    public IRValue ptr;

    public IRLoadInst(IRLocalVar result, IRValue ptr) {
        this.result = result;
        this.ptr = ptr;
    }

    @Override
    public String toString() {
        return String.format("%s = load %s, ptr %s", result, result.type, ptr);
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
