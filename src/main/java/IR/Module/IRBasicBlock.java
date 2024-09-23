package IR.Module;

import IR.IRNode;
import IR.IRVisitor;
import IR.Inst.IRInst;

import java.util.ArrayList;
import java.util.List;

public class IRBasicBlock extends IRNode {
    public String label;
    public List<IRInst> body;
    public IRFuncDef func;

    public IRBasicBlock(String label, IRFuncDef func) {
        this.label = label;
        this.func = func;
        body = new ArrayList<>();
    }

    @Override
    public String toString() {
        StringBuilder ret = new StringBuilder();
        ret.append(label).append(":\n");
        for (var inst : body) {
            ret.append('\t').append(inst).append("\n");
        }
        return ret.toString();
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
