package Util.scope;

import Util.Pos;
import Util.error.SyntaxError;
import Util.type.FnType;
import Util.type.Type;

import java.util.HashMap;

public class ClassScope extends SuiteScope {
    public final String name;
    public HashMap<String, FnType> fnDeclare;

    public ClassScope(SuiteScope parentScope, String name) {
        super(parentScope);
        this.name = name;
        fnDeclare = new HashMap<>();
    }

    @Override
    public String getClassName() {
        return name;
    }

    @Override
    public void addVar(String varName, Type Type, Pos pos) {
        if (varDeclare.containsKey(varName)) {
            throw new SyntaxError(pos, "Variable Redefinition Error: " + varName);
        }
        if (fnDeclare.containsKey(varName)) {
            throw new SyntaxError(pos, "Function and Variable should not have the same name " + varName);
        }
        varDeclare.put(varName, Type);
    }

    public void addFn(String fnName, FnType type, Pos pos) {
        if (fnName.equals(name)) {
            throw new SyntaxError(pos, "Non-constructor function should not have the same name with Class" + fnName);
        }
        if (fnDeclare.containsKey(fnName)) {
            throw new SyntaxError(pos, "Function Redefinition Error: " + fnName);
        }
        if (varDeclare.containsKey(fnName)) {
            throw new SyntaxError(pos, "Function and Variable should not have the same name " + fnName);
        }
        fnDeclare.put(fnName, type);
    }

    @Override
    public FnType getFnType(String funcName, Pos pos) {
        if (fnDeclare.containsKey(funcName)) {
            return fnDeclare.get(funcName);
        } else {
            return super.getFnType(funcName, pos);
        }
    }
}
