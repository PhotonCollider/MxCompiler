package ASM.Inst;

public class ASMWordInst extends ASMInst {
    int wordLen;

    public ASMWordInst(int wordLen) {
        this.wordLen = wordLen;
    }

    @Override
    public String toString() {
        return ".word " + wordLen;
    }
}
