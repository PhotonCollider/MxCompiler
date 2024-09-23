package IR.Inst;

import IR.IRVisitor;
import IR.Module.IRBasicBlock;
import IR.Value.IRValue;
import IR.Value.Var.IRLocalVar;
import Util.Pair;

import java.util.ArrayList;
import java.util.List;

public class IRPhiInst extends IRInst {
    public IRLocalVar result;
    public List<Pair<IRValue, IRBasicBlock>> list;

    public IRPhiInst(IRLocalVar result) {
        this.result = result;
        list = new ArrayList<>();
    }

    @Override
    public String toString() {
        StringBuilder str = new StringBuilder();
        str.append(result).append(" = phi ").append(result.type).append(' ');
        for (int i = 0; i < list.size(); i++) {
            str.append("[ ").append(list.get(i).first).append(", ").append(list.get(i).second.label).append(']');
            if (i < list.size() - 1) {
                str.append(", ");
            }
        }
        return str.toString();
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
