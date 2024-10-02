package ASM.Inst;

public class ASMLwInst extends ASMInst {
    String rd, rs1;
    int offset;

    public ASMLwInst(String rd, String rs1, int offset) {
        this.rd = rd;
        this.rs1 = rs1;
        this.offset = offset;
    }

    @Override
    public String toString() {
        return String.format("lw %s, %d(%s)", rd, offset, rs1);
    }
}
