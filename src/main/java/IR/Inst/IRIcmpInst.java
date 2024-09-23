package IR.Inst;

import IR.IRVisitor;
import IR.Value.IRValue;
import IR.Value.Var.IRLocalVar;

public class IRIcmpInst extends IRInst {
    public IRLocalVar result;
    public IRValue lhs, rhs;
    public String cond;

    public IRIcmpInst(IRLocalVar result, IRValue lhs, IRValue rhs, String cond) {
        this.result = result;
        this.lhs = lhs;
        this.rhs = rhs;
        this.cond = cond;
    }

    @Override
    public String toString() {
        return String.format("%s = icmp %s %s %s, %s", result, cond, lhs.type, lhs, rhs);
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
