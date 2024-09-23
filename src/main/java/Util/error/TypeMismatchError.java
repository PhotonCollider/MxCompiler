package Util.error;

import Util.Pos;

public class TypeMismatchError extends SemanticError {
    public TypeMismatchError(Pos pos, String detail) {
        super(pos, detail);
    }

    @Override
    public String toString() {
        return "Type mismatch error at " + pos + ", " + detail;
    }
}
