package ASM.Inst;

public class ASMWordInst extends ASMInst {
    @Override
    public String toString() {
        return ".word 0"; // the 0 here is the init value of the word
    }
}
