package ASM.Inst;

public class ASMLiInst extends ASMInst {
    String reg;
    int val;

    public ASMLiInst(String reg, int val) {
        this.reg = reg;
        this.val = val;
    }

    @Override
    public String toString() {
        return String.format("li\t%s, %d", reg, val);
    }
}
