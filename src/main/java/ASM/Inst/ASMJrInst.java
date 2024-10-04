package ASM.Inst;

public class ASMJrInst extends ASMInst {
    String reg;

    public ASMJrInst(String reg) {
        this.reg = reg;
    }

    @Override
    public String toString() {
        return "jr " + reg;
    }
}
