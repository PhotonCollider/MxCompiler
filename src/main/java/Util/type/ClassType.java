package Util.type;

import AST.def.ClassDefNode;
import Util.Pos;
import Util.error.SemanticError;
import Util.scope.ClassScope;

import java.util.HashMap;

public class ClassType {
    public String name;
    public HashMap<String, FnType> fnDeclare;
    public HashMap<String, Type> varDeclare;

    public ClassType(String name, HashMap<String, FnType> fnDeclare, HashMap<String, Type> varDeclare) {
        this.name = name;
        this.fnDeclare = fnDeclare;
        this.varDeclare = varDeclare;
    }

    public ClassType(ClassScope scope) {
        name = scope.name;
        fnDeclare = scope.fnDeclare;
        varDeclare = scope.varDeclare;
    }

    public FnType getFnType(String name, Pos pos) {
        var result = fnDeclare.get(name);
        if (result == null) {
            throw new SemanticError(pos, "Undefined class member function " + name);
        }
        return result;
    }

    public Type getVarType(String name, Pos pos) {
        var result = varDeclare.get(name);
        if (result == null) {
            throw new SemanticError(pos, "Undefined class member variable " + name);
        }
        return varDeclare.get(name);
    }
}
