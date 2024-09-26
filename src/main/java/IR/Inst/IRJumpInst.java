package IR.Inst;

import IR.IRVisitor;
import IR.Module.IRBasicBlock;

public class IRJumpInst extends IRInst {
    IRBasicBlock dest;

    public IRJumpInst(IRBasicBlock dest) {
        this.dest = dest;
    }

    @Override
    public String toString() {
        return String.format("br label %%%s", dest.label);
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
