package ASM.Inst;

public class ASMSwInst extends ASMInst {
    String rs2, rs1;
    int offset;

    public ASMSwInst(String rs2, String rs1, int offset) {
        this.rs2 = rs2;
        this.rs1 = rs1;
        this.offset = offset;
    }

    @Override
    public String toString() {
        return String.format("sw %s, %d(%s)", rs2, offset, rs1);
    }
}
