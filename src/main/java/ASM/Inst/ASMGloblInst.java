package ASM.Inst;

public class ASMGloblInst extends ASMInst {
    String label;

    public ASMGloblInst(String label) {
        this.label = label;
    }

    @Override
    public String toString() {
        return ".globl " + label;
    }
}
