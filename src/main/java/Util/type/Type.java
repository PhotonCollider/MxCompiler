package Util.type;

import IR.Type.IRType;
import Parser.MxParser;

public class Type {
    public final String name;
    public final int dimension;

    public Type(String name, int dimension) {
        this.name = name;
        this.dimension = dimension;
    }

    public Type(String name) {
        this.name = name;
        dimension = 0;
    }

    public Type(MxParser.ReturnTypeContext ctx) {
        if (ctx.Void() != null) {
            name = "void";
            dimension = 0;
        } else {
            name = ctx.type().typeName().getText();
            dimension = ctx.type().LeftBracket().size();
        }
    }

    public Type(MxParser.TypeContext ctx) {
        name = ctx.typeName().getText();
        dimension = ctx.LeftBracket().size();
    }

    public Type(MxParser.TypeNameContext typeName) {
        name = typeName.getText();
        dimension = 0;
    }

    public Type(Type type) {
        name = type.name;
        dimension = type.dimension;
    }

    @Override
    public String toString() {
        return name + "[]".repeat(dimension);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Type type = (Type) o;
        if (name.equals("null") && type.name.equals("null")) {
            return true;
        }
        if (name.equals("null") && !type.isBuiltinNonArrayType()) {
            return true;
        }
        if (type.name.equals("null") && !isBuiltinNonArrayType()) {
            return true;
        }
        return dimension == type.dimension && name.equals(type.name);
    }

    private boolean isBuiltinNonArrayType() {
        return dimension == 0 &&
                (name.equals("int") || name.equals("bool") || name.equals("string") || name.equals("void") || name.equals("null"));
    }

    public IRType toIR() {
        return IRType.fromType(this);
    }
}
