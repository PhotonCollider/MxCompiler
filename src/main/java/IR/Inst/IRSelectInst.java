package IR.Inst;

import IR.IRVisitor;
import IR.Value.IRValue;
import IR.Value.Var.IRLocalVar;

public class IRSelectInst extends IRInst {
    public IRLocalVar result;
    public IRValue cond, lhs, rhs;

    public IRSelectInst(IRLocalVar result, IRValue cond, IRValue lhs, IRValue rhs) {
        this.result = result;
        this.cond = cond;
        this.lhs = lhs;
        this.rhs = rhs;
    }

    @Override
    public String toString() {
        return String.format("%s = select i1 %s, %s %s, %s %s", result, cond, lhs.type, lhs, rhs.type, rhs);
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
