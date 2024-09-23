package IR.Type;

public class IRPtrType extends IRType {
    public IRType base;
    public int dim;

    public IRPtrType(IRType base, int dim) {
        if (base instanceof IRPtrType) {
            this.base = ((IRPtrType) base).base;
            this.dim = ((IRPtrType) base).dim + dim;
        } else {
            this.base = base;
            this.dim = dim;
        }
    }

    public IRPtrType(IRType base) {
        if (base instanceof IRPtrType) {
            this.base = ((IRPtrType) base).base;
            this.dim = ((IRPtrType) base).dim + 1;
        } else {
            this.base = base;
            this.dim = 1;
        }
    }

    public IRPtrType() {
        base = new IRVoidType();
        dim = 1;
    }

    public IRType dereference() {
        if (dim == 1) {
            return base;
        } else {
            return new IRPtrType(base, dim - 1);
        }
    }

    @Override
    public String toString() {
        return "ptr";
    }
}
