package IR.Inst;

import IR.IRVisitor;
import IR.Value.IRValue;

public class IRRetInst extends IRInst {
    IRValue retVal;

    public IRRetInst(IRValue retVal) {
        this.retVal = retVal;
    }

    @Override
    public String toString() {
        if (retVal == null) {
            return "ret void";
        } else {
            return String.format("ret %s %s", retVal.type.toString(), retVal.toString());
        }
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
