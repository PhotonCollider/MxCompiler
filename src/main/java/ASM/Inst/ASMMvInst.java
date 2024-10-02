package ASM.Inst;

public class ASMMvInst extends ASMInst {
    String rd, rs1;

    public ASMMvInst(String rd, String rs1) {
        this.rd = rd;
        this.rs1 = rs1;
    }

    @Override
    public String toString() {
        return String.format("mv\t%s, %s", rd, rs1);
    }
}
