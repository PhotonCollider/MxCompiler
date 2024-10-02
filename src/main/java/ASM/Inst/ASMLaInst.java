package ASM.Inst;

public class ASMLaInst extends ASMInst {
    String reg;
    String label;

    public ASMLaInst(String reg, String label) {
        this.reg = reg;
        this.label = label;
    }

    @Override
    public String toString() {
        return String.format("la %s, %s", reg, label);
    }
}
