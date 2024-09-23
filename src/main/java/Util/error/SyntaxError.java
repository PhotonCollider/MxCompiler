package Util.error;

import Util.Pos;

public class SyntaxError extends RuntimeException {
    String detail = "default error";
    Pos pos;

    public SyntaxError(Pos pos, String detail) {
        this.detail = detail;
        this.pos = pos;
    }

    @Override
    public String toString() {
        return "Syntax error at " + pos + ", " + detail;
    }
}