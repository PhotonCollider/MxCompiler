package ASM.Inst;

public class ASMBinaryInst extends ASMInst {
    public boolean isImmediate;
    public String res, rs1, rs2;
    public int imm;
    public String op; // with the i

    public ASMBinaryInst(String op, String res, String rs1, int imm) {
        isImmediate = true;
        this.res = res;
        this.rs1 = rs1;
        this.rs2 = null;
        this.imm = imm;
        this.op = op;
    }

    public ASMBinaryInst(String op, String res, String rs1, String rs2) {
        isImmediate = false;
        this.res = res;
        this.rs1 = rs1;
        this.rs2 = rs2;
        this.op = op;
    }

    @Override
    public String toString() {
        return String.format("%s\t%s, %s, ", op, res, rs1) + (isImmediate ? imm : rs2);
    }
}
