package ASM.Inst;

public class ASMCallInst extends ASMInst {
    String fn;

    public ASMCallInst(String fn) {
        this.fn = fn;
    }

    @Override
    public String toString() {
        return "call\t" + fn;
    }
}
