package Util.error;

import Util.Pos;

public class InvalidTypeError extends SemanticError {
    public InvalidTypeError(Pos pos, String detail) {
        super(pos, detail);
    }

    @Override
    public String toString() {
        return "Type mismatch error at " + pos + ", " + detail;
    }
}