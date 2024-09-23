package Util.error;

import Util.Pos;

public class SemanticError extends RuntimeException {
    String detail;
    // detail: expected int, found bool
    Pos pos;

    public SemanticError(Pos pos, String detail) {
        this.pos = pos;
        this.detail = detail;
    }

    @Override
    public String toString() {
        return "Semantic error at " + pos + ", " + detail;
    }
}