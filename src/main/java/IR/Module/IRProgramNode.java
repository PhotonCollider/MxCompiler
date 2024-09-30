package IR.Module;

import java.util.ArrayList;
import java.util.HashMap;

import IR.IRNode;
import IR.IRVisitor;
import IR.Type.IRIntType;
import IR.Type.IRPtrType;
import IR.Type.IRVoidType;

public class IRProgramNode extends IRNode {
    public HashMap<String, IRStructDef> structDefMap;
    public ArrayList<IRGlobalVarDef> globalVarDefs;
    public ArrayList<IRStringLiteralDef> stringLiterals;
    public ArrayList<IRStringLiteralDef> fStringFragments;
    public ArrayList<IRGlobalVarDef> arrayLiterals;
    public ArrayList<IRFuncDecl> funcDecls;
    public HashMap<String, IRFuncDef> funcDefMap;

    public IRProgramNode() {
        structDefMap = new HashMap<>();
        globalVarDefs = new ArrayList<>();
        stringLiterals = new ArrayList<>();
        fStringFragments = new ArrayList<>();
        arrayLiterals = new ArrayList<>();
        funcDecls = new ArrayList<>();
        funcDefMap = new HashMap<>();
        funcDecls.add(new IRFuncDecl("print", new IRVoidType(), new IRPtrType(new IRIntType(8))));
        funcDecls.add(new IRFuncDecl("println", new IRVoidType(), new IRPtrType(new IRIntType(8))));
        funcDecls.add(new IRFuncDecl("printInt", new IRVoidType(), new IRIntType(32)));
        funcDecls.add(new IRFuncDecl("printlnInt", new IRVoidType(), new IRIntType(32)));
        funcDecls.add(new IRFuncDecl("getString", new IRPtrType(new IRIntType(8))));
        funcDecls.add(new IRFuncDecl("getInt", new IRIntType(32)));
        funcDecls.add(new IRFuncDecl("toString", new IRPtrType(new IRIntType(8)), new IRIntType(32)));
        funcDecls.add(
                new IRFuncDecl("array.copy", new IRPtrType(), new IRPtrType(), new IRIntType(32)));
        funcDecls.add(new IRFuncDecl("array.size", new IRIntType(32), new IRPtrType()));
        funcDecls.add(new IRFuncDecl("string.length", new IRIntType(32), new IRPtrType(new IRIntType(8))));
        funcDecls.add(
                new IRFuncDecl("string.ord", new IRIntType(32), new IRPtrType(new IRIntType(8)), new IRIntType(32)));
        funcDecls.add(new IRFuncDecl("string.parseInt", new IRIntType(32), new IRPtrType(new IRIntType(8))));
        funcDecls.add(
                new IRFuncDecl("string.substring", new IRPtrType(new IRIntType(8)), new IRPtrType(new IRIntType(8)),
                        new IRIntType(32), new IRIntType(32)));
        funcDecls.add(new IRFuncDecl("builtin.bool_to_string", new IRPtrType(new IRIntType(8)), new IRIntType(1)));
        funcDecls.add(new IRFuncDecl("builtin.calloc", new IRPtrType(), new IRIntType(32)));
        funcDecls.add(
                new IRFuncDecl("builtin.calloc_array", new IRPtrType(), new IRIntType(32), new IRIntType(32)));
        funcDecls.add(new IRFuncDecl("builtin.malloc", new IRPtrType(), new IRIntType(32)));
        funcDecls.add(
                new IRFuncDecl("builtin.malloc_array", new IRPtrType(), new IRIntType(32), new IRIntType(32)));
        funcDecls.add(
                new IRFuncDecl("builtin.string_add", new IRPtrType(new IRIntType(8)), new IRPtrType(new IRIntType(8)),
                        new IRPtrType(new IRIntType(8))));
        funcDecls.add(new IRFuncDecl("builtin.string_eq", new IRIntType(1), new IRPtrType(new IRIntType(8)),
                new IRPtrType(new IRIntType(8))));
        funcDecls.add(new IRFuncDecl("builtin.string_ge", new IRIntType(1), new IRPtrType(new IRIntType(8)),
                new IRPtrType(new IRIntType(8))));
        funcDecls.add(new IRFuncDecl("builtin.string_geq", new IRIntType(1), new IRPtrType(new IRIntType(8)),
                new IRPtrType(new IRIntType(8))));
        funcDecls.add(new IRFuncDecl("builtin.string_le", new IRIntType(1), new IRPtrType(new IRIntType(8)),
                new IRPtrType(new IRIntType(8))));
        funcDecls.add(new IRFuncDecl("builtin.string_leq", new IRIntType(1), new IRPtrType(new IRIntType(8)),
                new IRPtrType(new IRIntType(8))));
        funcDecls.add(new IRFuncDecl("builtin.string_ne", new IRIntType(1), new IRPtrType(new IRIntType(8)),
                new IRPtrType(new IRIntType(8))));
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(";Definition Of Structs\n");
        for (var struct : structDefMap.values()) {
            sb.append(struct);
        }
        sb.append("\n;Definition Of Global Variables\n");
        for (var globalVar : globalVarDefs) {
            sb.append(globalVar);
        }
        sb.append("\n;Definition Of String Literals\n");
        for (var stringLiteral : stringLiterals) {
            sb.append(stringLiteral);
        }
        sb.append("\n;Definition Of Formatted String Fragments\n");
        for (var fragment : fStringFragments) {
            sb.append(fragment);
        }
        sb.append("\n;Definition Of Array Literals\n");
        for (var arrayLiteral : arrayLiterals) {
            sb.append(arrayLiteral);
        }
        sb.append("\n;Declarations Of Functions\n");
        for (var funcDecl : funcDecls) {
            sb.append(funcDecl);
        }
        sb.append("\n;Definition Of Functions\n");
        for (var funcDef : funcDefMap.values()) {
            sb.append(funcDef).append("\n");
        }
        return sb.toString();
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}