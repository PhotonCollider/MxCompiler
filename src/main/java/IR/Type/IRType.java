package IR.Type;

import Util.type.Type;

public abstract class IRType {
    public static IRType fromType(Type type) {
        if (type.dimension != 0) {
            return new IRPtrType((new Type(type.name, 0)).toIR(), type.dimension);
        }
        return switch (type.name) {
            case "void" -> new IRVoidType();
            case "bool" -> new IRIntType(1);
            case "int" -> new IRIntType(32);
            case "string" -> new IRPtrType(new IRIntType(8));
            default -> new IRPtrType(new IRStructType(type.name));
        };
    }

    @Override
    public abstract String toString();

    public int size() { // in bytes, we simply let everything be 4 bytes
        if (this instanceof IRVoidType) {
            return 0;
        } else if (this instanceof IRStructType) {
            return 4 * ((IRStructType) this).fields.size();
        } else {
            return 4;
        }
    }
}
