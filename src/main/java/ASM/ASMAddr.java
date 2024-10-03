package ASM;

public class ASMAddr {
    public String reg;
    public int offset;

    public ASMAddr(String reg, int offset) {
        this.reg = reg;
        this.offset = offset;
    }

    @Override
    public String toString() {
        return offset + '(' + reg + ')';
    }
}
