package ASM.Inst;

public class ASMJInst extends ASMInst {
    String dest;

    public ASMJInst(String dest) {
        this.dest = dest;
    }

    @Override
    public String toString() {
        return "j " + dest;
    }
}
