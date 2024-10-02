package ASM.Inst;

public class ASMBgtzInst extends ASMInst {
    String rs1, offset;

    public ASMBgtzInst(String rs1, String offset) {
        this.rs1 = rs1;
        this.offset = offset;
    }

    @Override
    public String toString() {
        return String.format("bgtz\t%s, %s", rs1, offset);
    }
}
