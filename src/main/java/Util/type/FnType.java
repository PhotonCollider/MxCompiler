package Util.type;

import AST.def.FnDefNode;

import java.util.ArrayList;

public class FnType {
    public Type retType;
    public ArrayList<Type> arg;

    public FnType(Type retType) {
        this.retType = retType;
        arg = new ArrayList<>();
    }

    public FnType(Type retType, ArrayList<Type> arg) {
        this.retType = retType;
        this.arg = arg;
    }

    public FnType(FnDefNode funcDef) {
        retType = funcDef.retType;
        arg = new ArrayList<>();
        for (var param : funcDef.paramList) {
            arg.add(new Type(param.second));
        }
    }
}
