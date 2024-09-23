package Util;

import org.antlr.v4.runtime.ParserRuleContext;

public class Pos {
    int line, col;

    public Pos(int _line, int _col) {
        line = _line;
        col = _col;
    }

    public Pos(ParserRuleContext ctx) {
        line = ctx.getStart().getLine();
        col = ctx.getStart().getCharPositionInLine();
    }

    @Override
    public String toString() {
        return "line " + line + ", column " + col;
    }
}
