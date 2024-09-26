package Util.scope;

import java.util.HashMap;

import IR.Type.IRType;
import IR.Value.IRValue;
import IR.Value.Var.IRLocalVar;
import Util.Pos;
import Util.error.SyntaxError;
import Util.type.FnType;
import Util.type.Type;

public class SuiteScope {
    public SuiteScope parentScope;
    public HashMap<String, Type> varDeclare;
    private static final HashMap<String, Integer> IRVarCnt = new HashMap<>();
    public HashMap<String, IRValue> IRVarMap;

    public SuiteScope(SuiteScope parentScope) {
        this.parentScope = parentScope;
        varDeclare = new HashMap<>();
        IRVarMap = new HashMap<>();
    }

    public void addVar(String varName, Type Type, Pos pos) {
        if (varDeclare.containsKey(varName)) {
            throw new SyntaxError(pos, "Variable Redefinition Error: " + varName);
        }
        varDeclare.put(varName, Type);
    }

    public IRValue IRAddVar(String varName, IRType type) {
        int id = 1;
        if (IRVarCnt.containsKey(varName)) {
            id = IRVarCnt.get(varName);
            id++;
        }
        IRVarCnt.put(varName, id);

        IRLocalVar localVar = new IRLocalVar(String.format("%s.%d", varName, id), type);
        IRVarMap.put(varName, localVar);
        return localVar;
    }

    public boolean isInLoop() {
        return parentScope.isInLoop();
    }

    public String getClassName() {
        return parentScope.getClassName();
    }

    public void checkReturnType(Type Type, Pos pos) {
        parentScope.checkReturnType(Type, pos);
    }

    public Type getVarType(String varName, Pos pos) {
        if (varDeclare.containsKey(varName)) {
            return varDeclare.get(varName);
        }
        return parentScope.getVarType(varName, pos);
    }

    public FnType getFnType(String funcName, Pos pos) {
        return parentScope.getFnType(funcName, pos);
    }

    public IRValue getIRVar(String varName) {
        if (IRVarMap.containsKey(varName)) {
            return IRVarMap.get(varName);
        }
        return parentScope.getIRVar(varName);
    }
}