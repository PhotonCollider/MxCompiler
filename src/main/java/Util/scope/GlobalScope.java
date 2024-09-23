package Util.scope;

import IR.Type.IRType;
import IR.Value.IRValue;
import IR.Value.Var.IRGlobalVar;
import IR.Value.Var.IRLocalVar;
import Util.Pos;
import Util.error.SemanticError;
import Util.error.SyntaxError;
import Util.type.ClassType;
import Util.type.FnType;
import Util.type.Type;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class GlobalScope extends ClassScope {
    public HashMap<String, ClassType> classDefList;

    public GlobalScope() {
        super(null, null);
        fnDeclare.put("print", new FnType(new Type("void"),
                new ArrayList<>(List.of(new Type("string")))));
        fnDeclare.put("println", new FnType(new Type("void"),
                new ArrayList<>(List.of(new Type("string")))));
        fnDeclare.put("printInt", new FnType(new Type("void"),
                new ArrayList<>(List.of(new Type("int")))));
        fnDeclare.put("printlnInt", new FnType(new Type("void"),
                new ArrayList<>(List.of(new Type("int")))));
        fnDeclare.put("getString", new FnType(new Type("string")));
        fnDeclare.put("getInt", new FnType(new Type("int")));
        fnDeclare.put("toString", new FnType(new Type("string"),
                new ArrayList<>(List.of(new Type("int")))));

        classDefList = new HashMap<>();
        classDefList.put("int", new ClassType("int", new HashMap<>(), new HashMap<>()));
        classDefList.put("bool", new ClassType("bool", new HashMap<>(), new HashMap<>()));

        HashMap<String, FnType> stringFuncMap = new HashMap<>();
        stringFuncMap.put("length", new FnType(new Type("int")));
        stringFuncMap.put("substring", new FnType(new Type("string"),
                new ArrayList<>(List.of(new Type("int"),
                        new Type("int")))));
        stringFuncMap.put("parseInt", new FnType(new Type("int")));
        stringFuncMap.put("ord", new FnType(new Type("int"), new ArrayList<>(List.of(new Type("int")))));

        classDefList.put("string", new ClassType("string", stringFuncMap, new HashMap<>()));
    }

    @Override
    public String getClassName() {
        return null;
    }

    @Override
    public FnType getFnType(String fnName, Pos pos) {
        if (fnDeclare.containsKey(fnName)) {
            return fnDeclare.get(fnName);
        } else {
            throw new SemanticError(pos, "Undefined function");
        }
    }

    @Override
    public boolean isInLoop() {
        return false;
    }

    @Override
    public void addFn(String fnName, FnType type, Pos pos) {
        if (classDefList.containsKey(fnName)) {
            throw new SemanticError(pos, "function name " + fnName + " collides with class name");
        }
        super.addFn(fnName, type, pos);
    }

    public void addClass(String className, Pos pos, ClassType type) {
        if (classDefList.containsKey(className)) {
            throw new SemanticError(pos, "redefined class " + className);
        }
        classDefList.put(className, type);
    }

    @Override
    public void checkReturnType(Type Type, Pos pos) {
        throw new SyntaxError(pos, "unexpected return in global scope");
    }

    @Override
    public Type getVarType(String varName, Pos pos) {
        if (varDeclare.containsKey(varName)) {
            return varDeclare.get(varName);
        }
        throw new SemanticError(pos, "Undefined variable");
    }

    public ClassType getClassType(String name, Pos pos) {
        if (classDefList.containsKey(name)) {
            return classDefList.get(name);
        }
        throw new SemanticError(pos, "Undefined class");
    }

    @Override
    public IRValue IRAddVar(String varName, IRType type) {
        int id = 1;
        if (varCnt.containsKey(varName)) {
            id = varCnt.get(varName);
            id++;
        }
        varCnt.put(varName, id);

        IRGlobalVar globalVar = new IRGlobalVar(type, String.format("%s.%d", varName, id));
        IRVarMap.put(varName, globalVar);
        return globalVar;
    }

    @Override
    public IRValue getIRVar(String varName) {
        if (IRVarMap.containsKey(varName)) {
            return IRVarMap.get(varName);
        }
        return null;
    }
}
