package IR.Inst;

import IR.IRVisitor;
import IR.Type.IRPtrType;
import IR.Value.IRValue;
import IR.Value.Var.IRLocalVar;

public class IRGetelementptrInst extends IRInst {
    public IRLocalVar result;
    public IRValue ptr;
    public IRValue id1; // simple ptr move
    public int id2; // get ptr to member #id2

    public IRGetelementptrInst(IRLocalVar result, IRValue ptr, IRValue id1, int id2) {
        this.result = result;
        this.ptr = ptr;
        this.id1 = id1;
        this.id2 = id2;
    }

    @Override
    public String toString() {
        if (id2 == -1) {
            return String.format("%s = getelementptr %s, ptr %s, i32 %s", result, ((IRPtrType) ptr.type).dereference(), ptr, id1);
        } else {
            return String.format("%s = getelementptr %s, ptr %s, i32 0, i32 %d", result, ((IRPtrType) ptr.type).dereference(), ptr, id2);
        }
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
