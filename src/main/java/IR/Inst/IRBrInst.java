package IR.Inst;

import IR.IRVisitor;
import IR.Module.IRBasicBlock;
import IR.Value.IRValue;

public class IRBrInst extends IRInst{
    public IRBasicBlock trueBlock, falseBlock;
    public IRValue cond;

    public IRBrInst(IRBasicBlock trueBlock, IRBasicBlock falseBlock, IRValue cond) {
        this.trueBlock = trueBlock;
        this.falseBlock = falseBlock;
        this.cond = cond;
    }

    @Override
    public String toString() {
        return String.format("br i1 %s, label %%%s, label %%%s", cond, trueBlock.label, falseBlock.label);
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
