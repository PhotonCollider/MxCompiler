package IR.Type;

public class IRIntType extends IRType {
    int bitlen;

    public IRIntType(int bitlen) {
        this.bitlen = bitlen;
    }

    @Override
    public String toString() {
        return "i" + bitlen;
    }
}
