package IR.Inst;

import IR.IRVisitor;
import IR.Value.IRValue;
import IR.Value.Var.IRLocalVar;

public class IRBinaryInst extends IRInst {
    public IRLocalVar result;
    public IRValue lhs, rhs;
    public String op;

    public IRBinaryInst(IRLocalVar result, IRValue lhs, IRValue rhs, String op) {
        this.result = result;
        this.lhs = lhs;
        this.rhs = rhs;
        this.op = op;
    }

    @Override
    public String toString() {
        return String.format("%s = %s %s %s, %s", result, op, lhs.type, lhs, rhs);
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
