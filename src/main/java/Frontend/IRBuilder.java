package Frontend;

import AST.ASTVisitor;
import AST.RootNode;
import AST.def.ClassDefNode;
import AST.def.ConstructorDefNode;
import AST.def.FnDefNode;
import AST.def.VarDefNode;
import AST.expr.*;
import AST.expr.atom.*;
import AST.stmt.*;
import IR.Inst.*;
import IR.Module.*;
import IR.Type.*;
import IR.Value.Const.IRBoolConst;
import IR.Value.Const.IRIntConst;
import IR.Value.Const.IRNullConst;
import IR.Value.IRValue;
import IR.Value.Var.IRGlobalVar;
import IR.Value.Var.IRLocalVar;
import Util.scope.FnScope;
import Util.scope.GlobalScope;
import Util.scope.LoopScope;
import Util.scope.SuiteScope;
import Util.type.FnType;
import Util.type.Type;

import java.util.ArrayList;

public class IRBuilder implements ASTVisitor {
    public final GlobalScope globalScope;
    private SuiteScope curScope;
    public IRRootNode root;
    private boolean visitedClassDef;
    private IRBasicBlock currentBlock, initBlock;
    private IRValue curExprValue;
    private IRBasicBlock continueDest, breakDest;
    // continueDest could be update expr (in for stmts) or cond expr (in while stmts)
    // BreadDest can only be loopEnd
    private int allocateArrayForId = 0, arrayLiteralCnt = 0, stringLiteralCnt = 0, FStringCnt = 0, logicBinaryCnt = 0,
            condExprID = 0, namelessVarCnt = 0;

    public IRBuilder(GlobalScope globalScope, IRRootNode root) {
        curScope = this.globalScope = globalScope;
        this.root = root;
    }

    @Override
    public void visit(RootNode it) {
        currentBlock = null;
        curScope = globalScope;
        IRFuncDef initFnDef = new IRFuncDef("global.init", new IRVoidType());
        initBlock = new IRBasicBlock(initFnDef.name, initFnDef);
        visitedClassDef = false;
        for (var varDef : it.defs) {
            if (varDef instanceof VarDefNode) {
                varDef.accept(this);
            }
        }
        for (var classDef : it.defs) {
            if (classDef instanceof ClassDefNode) {
                classDef.accept(this);
            }
        }
        visitedClassDef = true;
        for (var fnDef : it.defs) {
            if (fnDef instanceof FnDefNode) {
                fnDef.accept(this);
            }
        }
        for (var classDef : it.defs) {
            if (classDef instanceof ClassDefNode) {
                classDef.accept(this);
            }
        }
        initBlock.body.add(new IRRetInst(null));
        initFnDef.body.add(initBlock);
        root.funcDefMap.put(initFnDef.name, initFnDef);
    }

    @Override
    public void visit(ClassDefNode it) {
        curScope = it.scope;
        if (!visitedClassDef) {
            IRStructDef irStructDef = new IRStructDef(it.name, it.constructor != null);
            ArrayList<IRType> fields = new ArrayList<>();
            for (var varDef : it.varDefs) {
                IRType irType = varDef.type.toIR();
                for (var pair : varDef.list) {
                    fields.add(irType);
                    irStructDef.struct.varToIdMap.put(pair.first, fields.size() - 1);
                }
            }
            irStructDef.struct.fields = fields;
            if (it.constructor != null) {
                irStructDef.memberFuncSet.add(it.constructor.name);
            }
            for (var fnDef : it.fnDefs) {
                irStructDef.memberFuncSet.add(fnDef.name);
            }
            root.structDefMap.put(it.name, irStructDef);
        } else {
            for (var fnDef : it.fnDefs) {
                fnDef.accept(this);
            }
            if (it.constructor != null) {
                it.constructor.accept(this);
            }
        }
        curScope = curScope.parentScope;
    }

    @Override
    public void visit(FnDefNode it) {
        curScope = new FnScope(curScope, new FnType(it));
        String fullName = "";
        if (curScope.getClassName() != null) {
            fullName += curScope.getClassName() + '.';
        }
        fullName += it.name;

        IRFuncDef irFuncDef = new IRFuncDef(fullName, IRType.fromType(it.retType));
        currentBlock = new IRBasicBlock(irFuncDef.name, irFuncDef);
        if (curScope.getClassName() != null) {
            irFuncDef.args.add(getNamelessVariable(new IRPtrType(new IRStructType(curScope.getClassName()))));
        }

        if (irFuncDef.name.equals("main")) {
            currentBlock.body.add(new IRCallInst(null, "global.init"));
        }

        for (var arg : it.paramList) {
            IRLocalVar IRArg = getNamelessVariable(arg.second.toIR());
            IRLocalVar ptr = (IRLocalVar) curScope.IRAddVar(arg.first, new IRPtrType(arg.second.toIR()));
            currentBlock.body.add(new IRAllocaInst(ptr));
            currentBlock.body.add(new IRStoreInst(IRArg, ptr));
            irFuncDef.args.add(IRArg);
        }
        for (var stmt : it.body) {
            stmt.accept(this);
            if (currentBlock == null) {
                break;
            }
        }
        if (currentBlock != null) {
            if (curScope.parentScope == globalScope && it.name.equals("main")) {
                currentBlock.body.add(new IRRetInst(new IRIntConst(0)));
            } else {
                if (irFuncDef.retType instanceof IRVoidType) {
                    currentBlock.body.add(new IRRetInst(null)); // void functions may have no return stmt
                }
            }
            submitBlock();
        }
        root.funcDefMap.put(fullName, irFuncDef);
        curScope = curScope.parentScope;
    }

    @Override
    public void visit(VarDefNode it) {
        IRType type = IRType.fromType(it.type);
        if (curScope instanceof GlobalScope) {
            for (var pair : it.list) {
                IRGlobalVar newVarPtr = (IRGlobalVar) curScope.IRAddVar(pair.first, new IRPtrType(type));
                root.globalVarDefs.add(new IRGlobalVarDef(newVarPtr));
                if (pair.second == null) {
                    continue;
                }
                IRBasicBlock prevBlock = currentBlock;
                currentBlock = initBlock;

                pair.second.accept(this);
                IRValue value = getValueResult(pair.second.isLeft);
                currentBlock.body.add(new IRStoreInst(value, newVarPtr));

                initBlock = currentBlock;
                currentBlock = prevBlock;
            }
        } else {
            for (var pair : it.list) {
                IRLocalVar newVarPtr = (IRLocalVar) curScope.IRAddVar(pair.first, new IRPtrType(type));
                currentBlock.body.add(new IRAllocaInst(newVarPtr));
                if (pair.second == null) {
                    continue;
                }
                pair.second.accept(this);
                IRValue value = getValueResult(pair.second.isLeft);
                currentBlock.body.add(new IRStoreInst(value, newVarPtr));
            }
        }
    }

    private IRValue getValueResult(boolean isLeft) {
        if (isLeft) { // then curExprValue is a ptr
            IRLocalVar ret = getNamelessVariable(((IRPtrType) curExprValue.type).dereference());
            currentBlock.body.add(new IRLoadInst(ret, curExprValue));
            return ret;
        } else {
            return curExprValue;
        }
    }

    private IRLocalVar getNamelessVariable(IRType irType) {
        return new IRLocalVar(String.valueOf(namelessVarCnt++), irType);
    }

    @Override
    public void visit(SuiteStmtNode it) {
        curScope = new SuiteScope(curScope);
        for (var stmt : it.stmtNodes) {
            stmt.accept(this);
            if (currentBlock == null) {
                break;
            }
        }
        curScope = curScope.parentScope;
    }

    @Override
    public void visit(VarDefStmtNode it) {
        it.varDef.accept(this);
    }

    @Override
    public void visit(IfStmtNode it) {
        IRBasicBlock thenBlock = new IRBasicBlock("if.then." + it.id, currentBlock.func);
        IRBasicBlock elseBlock = new IRBasicBlock("if.else." + it.id, currentBlock.func);
        IRBasicBlock nxtBlock = new IRBasicBlock("if.endif." + it.id, currentBlock.func);

        it.cond.accept(this);
        IRValue cond_val = getValueResult(it.cond.isLeft);
        currentBlock.body.add(new IRBrInst(thenBlock, elseBlock, cond_val));
        submitBlock();

        currentBlock = thenBlock;
        it.thenStmt.accept(this);
        if (currentBlock != null) {
            currentBlock.body.add(new IRJumpInst(nxtBlock));
            submitBlock();
        }

        currentBlock = elseBlock;
        it.elseStmt.accept(this);
        if (currentBlock != null) {
            currentBlock.body.add(new IRJumpInst(nxtBlock));
            submitBlock();
        }

        currentBlock = nxtBlock;
    }

    private void submitBlock() {
        if (!currentBlock.body.isEmpty()) { // unreachable block
            /*
            if (cond) {
                return;
            } else {
                return:
             }
             <End Of Function>
             */
            currentBlock.func.body.add(currentBlock);
        }
        currentBlock = null; // useless but appropriate
    }

    @Override
    public void visit(WhileStmtNode it) {
        curScope = new LoopScope(curScope);
        IRBasicBlock condBlock = new IRBasicBlock("while.cond." + it.id, currentBlock.func);
        IRBasicBlock bodyBlock = new IRBasicBlock("while.body." + it.id, currentBlock.func);
        IRBasicBlock nxtBlock = new IRBasicBlock("while.end." + it.id, currentBlock.func);

        IRBasicBlock prevContinueDest = continueDest;
        IRBasicBlock prevBreakDest = breakDest;
        continueDest = condBlock;
        breakDest = nxtBlock;

        currentBlock.body.add(new IRJumpInst(condBlock));
        submitBlock();
        currentBlock = condBlock;

        it.cond.accept(this);
        IRValue cond_val = getValueResult(it.cond.isLeft);
        currentBlock.body.add(new IRBrInst(bodyBlock, nxtBlock, cond_val));
        submitBlock();

        currentBlock = bodyBlock;
        it.body.accept(this);
        if (currentBlock != null) { // in case of endBlock
            currentBlock.body.add(new IRJumpInst(condBlock));
            submitBlock();
        }

        currentBlock = nxtBlock;
        continueDest = prevContinueDest;
        breakDest = prevBreakDest;
        curScope = curScope.parentScope;
    }

    @Override
    public void visit(ForStmtNode it) {
        curScope = new LoopScope(curScope);
        IRBasicBlock condBlock = new IRBasicBlock("for.cond." + it.id, currentBlock.func);
        IRBasicBlock bodyBlock = new IRBasicBlock("for.body." + it.id, currentBlock.func);
        IRBasicBlock updateBlock = new IRBasicBlock("for.update." + it.id, currentBlock.func);
        IRBasicBlock nxtBlock = new IRBasicBlock("for.end." + it.id, currentBlock.func);

        IRBasicBlock prevContinueDest = continueDest;
        IRBasicBlock prevBreakDest = breakDest;
        continueDest = updateBlock;
        breakDest = nxtBlock;

        it.init.accept(this);
        if (currentBlock != null) {
            currentBlock.body.add(new IRJumpInst(condBlock));
            submitBlock();
        }

        currentBlock = condBlock;
        it.cond.accept(this);
        IRValue cond_val = getValueResult(it.cond.isLeft);
        currentBlock.body.add(new IRBrInst(bodyBlock, nxtBlock, cond_val));
        submitBlock();

        currentBlock = bodyBlock;
        curScope = new SuiteScope(curScope);
        for (var stmt : it.body) {
            stmt.accept(this);
            if (currentBlock == null) {
                break;
            }
        }
        if (currentBlock != null) {
            currentBlock.body.add(new IRJumpInst(updateBlock));
            submitBlock();
        }
        curScope = curScope.parentScope;

        currentBlock = updateBlock;
        it.update.accept(this);
        currentBlock.body.add(new IRJumpInst(condBlock));
        submitBlock();

        currentBlock = nxtBlock;
        continueDest = prevContinueDest;
        breakDest = prevBreakDest;
        curScope = curScope.parentScope;
    }

    @Override
    public void visit(ReturnStmtNode it) {
        if (it.ret != null) {
            it.ret.accept(this);
            IRValue ret_val = getValueResult(it.ret.isLeft);
            currentBlock.body.add(new IRRetInst(ret_val));
        } else {
            currentBlock.body.add(new IRRetInst(null));
        }
        submitBlock();
    }

    @Override
    public void visit(BreakStmtNode it) {
        currentBlock.body.add(new IRJumpInst(breakDest));
        submitBlock();
    }

    @Override
    public void visit(ContinueStmtNode it) {
        currentBlock.body.add(new IRJumpInst(continueDest));
        submitBlock();
    }

    @Override
    public void visit(ExprStmtNode it) {
        it.expr.accept(this);
    }

    @Override
    public void visit(ParenExprNode it) {
        it.expr.accept(this);
    }

    @Override
    public void visit(NewArrayExprNode it) {
        IRType type = IRType.fromType(it.type);
        if (it.init == null) {
            ArrayList<IRValue> IRFixedSizeList = new ArrayList<>();
            for (var item : it.fixedSizeList) {
                item.accept(this);
                IRFixedSizeList.add(getValueResult(item.isLeft));
            }
            curExprValue = allocateEmptyArray(IRFixedSizeList, 0, (IRPtrType) type);
        } else {
            it.init.accept(this);
            IRLocalVar res = getNamelessVariable(type);
            currentBlock.body
                    .add(new IRCallInst(res, "array.copy", curExprValue, new IRIntConst(((IRPtrType) type).dim)));
            curExprValue = res;
        }
    }

    private IRLocalVar allocateEmptyArray(ArrayList<IRValue> fixedSizeList, int depth, IRPtrType type) {
        IRLocalVar ret = getNamelessVariable(type);
        currentBlock.body.add(new IRCallInst(ret, "builtin.calloc_array", new IRIntConst(type.dereference().sizeInBytes()),
                fixedSizeList.get(depth)));
//        if ((depth == type.dim - 1 && !(type.base instanceof IRStructType))
//                || (depth == type.dim - 2 && type.base instanceof IRStructType)) {
//            return ret;
//        }
        if (type.dim == 1 || depth == fixedSizeList.size() - 1) {
            return ret;
        }

        IRBasicBlock condBlock = new IRBasicBlock("allocateArrayFor.cond" + allocateArrayForId, currentBlock.func);
        IRBasicBlock bodyBlock = new IRBasicBlock("allocateArrayFor.body." + allocateArrayForId, currentBlock.func);
        IRBasicBlock nxtBlock = new IRBasicBlock("allocateArrayFor.end." + allocateArrayForId, currentBlock.func);
        allocateArrayForId++;

        IRLocalVar forCnt = getNamelessVariable(new IRPtrType(new IRIntType(32)));
        currentBlock.body.add(new IRAllocaInst(forCnt));
        currentBlock.body.add(new IRStoreInst(new IRIntConst(0), forCnt));
        currentBlock.body.add(new IRJumpInst(condBlock));
        submitBlock();

        currentBlock = condBlock;
        IRLocalVar readForCnt = getNamelessVariable(new IRIntType(32));
        currentBlock.body.add(new IRLoadInst(readForCnt, forCnt));
        IRLocalVar condVal = getNamelessVariable(new IRIntType(1));
        currentBlock.body.add(new IRIcmpInst(condVal, readForCnt, fixedSizeList.get(depth), "slt"));
        currentBlock.body.add(new IRBrInst(bodyBlock, nxtBlock, condVal));
        submitBlock();

        currentBlock = bodyBlock;
        IRLocalVar nxtPtr = getNamelessVariable(type);
        currentBlock.body.add(new IRGetelementptrInst(nxtPtr, ret, readForCnt, -1));
        if (type.dim == 2 && type.base instanceof IRStructType) {
            String className = ((IRStructType) type.base).name;
            IRStructDef structDef = root.structDefMap.get(className);
            IRLocalVar res = getNamelessVariable(type.dereference());
            currentBlock.body.add(new IRCallInst(res, "builtin.malloc", new IRIntConst(structDef.struct.sizeInBytes())));
            if (structDef.hasConstructor) {
                currentBlock.body.add(new IRCallInst(null, className + "." + className));
            }
            currentBlock.body.add(new IRStoreInst(res, nxtPtr));
        } else {
            IRLocalVar smallerEmptyArray = allocateEmptyArray(fixedSizeList, depth + 1, (IRPtrType) type.dereference());
            currentBlock.body.add(new IRStoreInst(smallerEmptyArray, nxtPtr));
        }
        // update expr begin
        IRLocalVar updateForCnt = getNamelessVariable(new IRIntType(32));
        currentBlock.body.add(new IRLoadInst(updateForCnt, forCnt));
        IRLocalVar forCntAdd1 = getNamelessVariable(new IRIntType(32));
        currentBlock.body.add(new IRBinaryInst(forCntAdd1, updateForCnt, new IRIntConst(1), "add"));
        currentBlock.body.add(new IRStoreInst(forCntAdd1, forCnt));
        currentBlock.body.add(new IRJumpInst(condBlock));
        submitBlock();

        currentBlock = nxtBlock;
        return ret;
    }

    @Override
    public void visit(ArrayLiteralNode it) {
        IRGlobalVar arrayLiteral = new IRGlobalVar(new IRPtrType(it.type.toIR()), "arrayLiteral." + arrayLiteralCnt);
        root.arrayLiterals.add(new IRGlobalVarDef(arrayLiteral));

        IRBasicBlock prevBlock = currentBlock;
        currentBlock = initBlock;

        IRLocalVar initRes = initArrayLiteral(it);
        currentBlock.body.add(new IRStoreInst(initRes, arrayLiteral));
        arrayLiteralCnt++;

        currentBlock = prevBlock;
        IRLocalVar res = getNamelessVariable(it.type.toIR());
        currentBlock.body.add(new IRLoadInst(res, arrayLiteral));
        curExprValue = res;
    }

    private IRLocalVar initArrayLiteral(ArrayLiteralNode it) {
        IRLocalVar ret = getNamelessVariable(it.type.toIR());
        currentBlock.body.add(new IRCallInst(ret, "builtin.malloc_array", new IRIntConst(((IRPtrType) it.type.toIR()).dereference().sizeInBytes()), new IRIntConst(it.literals.size())));
        for (int i = 0; i < it.literals.size(); i++) {
            IRLocalVar ptrToSmallerLiteral = getNamelessVariable(it.type.toIR());
            currentBlock.body.add(new IRGetelementptrInst(ptrToSmallerLiteral, ret, new IRIntConst(i), -1));
            if (it.literals.get(i) instanceof ArrayLiteralNode) {
                IRLocalVar smallerArray = initArrayLiteral(((ArrayLiteralNode) it.literals.get(i)));
                currentBlock.body.add(new IRStoreInst(smallerArray, ptrToSmallerLiteral));
            } else if (it.literals.get(i) instanceof NullLiteralNode) {
                currentBlock.body.add(new IRStoreInst(new IRIntConst(0), ptrToSmallerLiteral));
            } else {
                it.literals.get(i).accept(this);
                currentBlock.body.add(new IRStoreInst(curExprValue, ptrToSmallerLiteral));
            }
        }
        return ret;
    }

    @Override
    public void visit(NullLiteralNode it) {
        curExprValue = new IRNullConst();
    }

    @Override
    public void visit(NewVariableExprNode it) {
        IRStructDef structDef = root.structDefMap.get(it.type.name);
        IRLocalVar res = getNamelessVariable(new IRPtrType(it.type.toIR()));
        currentBlock.body.add(new IRCallInst(res, "builtin.calloc", new IRIntConst(structDef.struct.sizeInBytes())));
        if (structDef.hasConstructor) {
            currentBlock.body.add(new IRCallInst(null, it.type + "." + it.type));
        }
        curExprValue = res;
    }

    @Override
    public void visit(FnCallExprNode it) {
        IRCallInst callInst;
        if (it.fnName instanceof MemberAccessExprNode funcName) {
            funcName.instanceName.accept(this);
            IRValue instance = getValueResult(funcName.instanceName.isLeft);
            IRType derefType = ((IRPtrType) instance.type).dereference();
            if (derefType instanceof IRIntType && ((IRIntType) derefType).bitlen == 8) { //string
                callInst = new IRCallInst(null, "string." + funcName.member, instance);
            } else if (derefType instanceof IRStructType) { // class
                String className = ((IRStructType) ((IRPtrType) instance.type).dereference()).name;
                callInst = new IRCallInst(null, className + "." + funcName.member, instance);
            } else { // array
                // derefType is i32 or ptr
                callInst = new IRCallInst(null, "array." + funcName.member, instance);
            }
        } else {
            if (!(it.fnName instanceof IdentifierNode)) {
                throw new RuntimeException("unexpected case!");
            }
            String functionName = ((IdentifierNode) it.fnName).name;
            if (curScope.getClassName() != null &&
                    root.structDefMap.get(curScope.getClassName()).memberFuncSet.contains(functionName)) {
                callInst = new IRCallInst(null, curScope.getClassName() + "." + functionName);
                callInst.args.add(currentBlock.func.args.get(0));
            } else {
                callInst = new IRCallInst(null, functionName);
            }
        }
        for (var arg1 : it.arg) {
            arg1.accept(this);
            IRValue IRArg = getValueResult(arg1.isLeft);
            callInst.args.add(IRArg);
        }
        if (it.type.name.equals("void")) {
            curExprValue = null;
        } else {
            IRLocalVar funcRet = getNamelessVariable(it.type.toIR());
            curExprValue = funcRet;
            callInst.result = funcRet;
        }
        currentBlock.body.add(callInst);
    }

    @Override
    public void visit(ArrayExprNode it) {
        it.array.accept(this);
        IRValue array = getValueResult(it.array.isLeft);
        it.index.accept(this);
        IRValue index = getValueResult(it.index.isLeft);
        IRLocalVar res = getNamelessVariable(new IRPtrType(it.type.toIR()));
        currentBlock.body.add(new IRGetelementptrInst(res, array, index, -1));
        curExprValue = res;
    }

    @Override
    public void visit(MemberAccessExprNode it) {
        it.instanceName.accept(this);
        IRValue instance = getValueResult(it.instanceName.isLeft);
        int id = root.structDefMap.get(((IRStructType) ((IRPtrType) instance.type).base).name).struct.varToIdMap
                .get(it.member);
        IRLocalVar res = getNamelessVariable(new IRPtrType(it.type.toIR()));
        currentBlock.body.add(new IRGetelementptrInst(res, instance, null, id));
        curExprValue = res;
    }

    @Override
    public void visit(PostfixUpdateExprNode it) {
        it.expr.accept(this);
        IRLocalVar tmp = (IRLocalVar) getValueResult(true); // must be left value
        IRLocalVar add1 = getNamelessVariable(new IRIntType(32));
        currentBlock.body.add(new IRBinaryInst(add1, tmp, new IRIntConst(it.op.equals("++") ? 1 : -1), "add"));
        currentBlock.body.add(new IRStoreInst(add1, curExprValue)); // curExprValue is the ptr
        curExprValue = tmp;
    }

    @Override
    public void visit(PrefixUpdateExprNode it) {
        it.expr.accept(this);
        IRLocalVar tmp = (IRLocalVar) getValueResult(true); // must be left value
        IRLocalVar add1 = getNamelessVariable(new IRIntType(32));
        currentBlock.body.add(new IRBinaryInst(add1, tmp, new IRIntConst(it.op.equals("++") ? 1 : -1), "add"));
        currentBlock.body.add(new IRStoreInst(add1, curExprValue)); // curExprValue is the ptr
    }

    @Override
    public void visit(UnaryExprNode it) {
        it.expr.accept(this);
        IRValue val = getValueResult(it.expr.isLeft);
        IRLocalVar res = getNamelessVariable(val.type);
        switch (it.op) {
            case "!" -> currentBlock.body.add(new IRBinaryInst(res, val, new IRBoolConst(true), "xor"));
            case "+" -> currentBlock.body.add(new IRBinaryInst(res, new IRIntConst(0), val, "add"));
            case "-" -> currentBlock.body.add(new IRBinaryInst(res, new IRIntConst(0), val, "sub"));
            case "~" -> currentBlock.body.add(new IRBinaryInst(res, new IRIntConst(-1), val, "xor"));
            default -> throw new RuntimeException("unexpected unary op");
        }
        curExprValue = res;
    }

    @Override
    public void visit(BinaryExprNode it) {
        if (it.op.equals("&&") || it.op.equals("||")) {
            visitLogicBinaryExprNode(it);
            return;
        }
        it.lhs.accept(this);
        IRValue lhsValue = getValueResult(it.lhs.isLeft);
        it.rhs.accept(this);
        IRValue rhsValue = getValueResult(it.rhs.isLeft);
        IRLocalVar res;
        switch (it.op) {
            // standard operators
            case "+":
                if (it.lhs.type.name.equals("int")) {
                    res = getNamelessVariable(new IRIntType(32));
                    currentBlock.body.add(new IRBinaryInst(res, lhsValue, rhsValue, "add"));
                } else { // string addition
                    res = getNamelessVariable(new IRPtrType(new IRIntType(8)));
                    currentBlock.body.add(new IRCallInst(res, "builtin.string_add", lhsValue, rhsValue));
                }
                break;
            case "-":
                res = getNamelessVariable(new IRIntType(32));
                currentBlock.body.add(new IRBinaryInst(res, lhsValue, rhsValue, "sub"));
                break;
            case "*":
                res = getNamelessVariable(new IRIntType(32));
                currentBlock.body.add(new IRBinaryInst(res, lhsValue, rhsValue, "mul"));
                break;
            case "/":
                res = getNamelessVariable(new IRIntType(32));
                currentBlock.body.add(new IRBinaryInst(res, lhsValue, rhsValue, "sdiv"));
                break;
            case "%":
                res = getNamelessVariable(new IRIntType(32));
                currentBlock.body.add(new IRBinaryInst(res, lhsValue, rhsValue, "srem"));
                break;
            // cmp operators
            case "<":
                res = getNamelessVariable(new IRIntType(1));
                if (it.lhs.type.name.equals("int")) {
                    currentBlock.body.add(new IRIcmpInst(res, lhsValue, rhsValue, "slt"));
                } else {
                    currentBlock.body.add(new IRCallInst(res, "builtin.string_le", lhsValue, rhsValue));
                }
                break;
            case "<=":
                res = getNamelessVariable(new IRIntType(1));
                if (it.lhs.type.name.equals("int")) {
                    currentBlock.body.add(new IRIcmpInst(res, lhsValue, rhsValue, "sle"));
                } else {
                    currentBlock.body.add(new IRCallInst(res, "builtin.string_leq", lhsValue, rhsValue));
                }
                break;
            case ">":
                res = getNamelessVariable(new IRIntType(1));
                if (it.lhs.type.name.equals("int")) {
                    currentBlock.body.add(new IRIcmpInst(res, lhsValue, rhsValue, "sgt"));
                } else {
                    currentBlock.body.add(new IRCallInst(res, "builtin.string_ge", lhsValue, rhsValue));
                }
                break;
            case ">=":
                res = getNamelessVariable(new IRIntType(1));
                if (it.lhs.type.name.equals("int")) {
                    currentBlock.body.add(new IRIcmpInst(res, lhsValue, rhsValue, "sge"));
                } else {
                    currentBlock.body.add(new IRCallInst(res, "builtin.string_geq", lhsValue, rhsValue));
                }
                break;
            case "==":
                res = getNamelessVariable(new IRIntType(1));
                if (it.lhs.type.name.equals("string")) {
                    currentBlock.body.add(new IRCallInst(res, "builtin.string_eq", lhsValue, rhsValue));
                } else { // bool or int or array or class
                    currentBlock.body.add(new IRIcmpInst(res, lhsValue, rhsValue, "eq"));
                }
                break;
            case "!=":
                res = getNamelessVariable(new IRIntType(1));
                if (it.lhs.type.name.equals("string")) {
                    currentBlock.body.add(new IRCallInst(res, "builtin.string_ne", lhsValue, rhsValue));
                } else { // bool or int or array or class
                    currentBlock.body.add(new IRIcmpInst(res, lhsValue, rhsValue, "ne"));
                }
                break;
            // bit operators
            case "<<":
                res = getNamelessVariable(new IRIntType(32));
                currentBlock.body.add(new IRBinaryInst(res, lhsValue, rhsValue, "shl"));
                break;
            case ">>":
                res = getNamelessVariable(new IRIntType(32));
                currentBlock.body.add(new IRBinaryInst(res, lhsValue, rhsValue, "ashr"));
                break;
            case "&":
                res = getNamelessVariable(new IRIntType(32));
                currentBlock.body.add(new IRBinaryInst(res, lhsValue, rhsValue, "and"));
                break;
            case "|":
                res = getNamelessVariable(new IRIntType(32));
                currentBlock.body.add(new IRBinaryInst(res, lhsValue, rhsValue, "or"));
                break;
            case "^":
                res = getNamelessVariable(new IRIntType(32));
                currentBlock.body.add(new IRBinaryInst(res, lhsValue, rhsValue, "xor"));
                break;
            default:
                throw new IllegalStateException("Unexpected binary operator: " + it.op);
        }
        curExprValue = res;
    }

    private void visitLogicBinaryExprNode(BinaryExprNode it) {
        IRBasicBlock secondBlock = new IRBasicBlock("LogicBinary.second." + logicBinaryCnt, currentBlock.func);
        IRBasicBlock endBlock = new IRBasicBlock("LogicBinary.end." + logicBinaryCnt, currentBlock.func);
        logicBinaryCnt++;
        it.lhs.accept(this);
        IRValue lhsValue = getValueResult(it.lhs.isLeft);
        IRLocalVar resultPtr = getNamelessVariable(new IRPtrType(new IRIntType(1)));
        currentBlock.body.add(new IRAllocaInst(resultPtr));
        if (it.op.equals("&&")) {
            currentBlock.body.add(new IRStoreInst(new IRBoolConst(false), resultPtr));
            currentBlock.body.add(new IRBrInst(secondBlock, endBlock, lhsValue));
            submitBlock();

            currentBlock = secondBlock;
            it.rhs.accept(this);
            IRValue rhsValue = getValueResult(it.rhs.isLeft);
            currentBlock.body.add(new IRStoreInst(rhsValue, resultPtr));
        } else { // case ||
            currentBlock.body.add(new IRStoreInst(new IRBoolConst(true), resultPtr));
            currentBlock.body.add(new IRBrInst(endBlock, secondBlock, lhsValue));
            submitBlock();

            currentBlock = secondBlock;
            it.rhs.accept(this);
            IRValue rhsValue = getValueResult(it.rhs.isLeft);
            currentBlock.body.add(new IRStoreInst(rhsValue, resultPtr));
        }
        currentBlock.body.add(new IRJumpInst(endBlock));
        submitBlock();
        currentBlock = endBlock;
        IRLocalVar res = getNamelessVariable(new IRIntType(1));
        currentBlock.body.add(new IRLoadInst(res, resultPtr));
        curExprValue = res;
        logicBinaryCnt++;
    }

    @Override
    public void visit(CondExprNode it) {
        IRBasicBlock thenBlock = new IRBasicBlock("cond.then." + condExprID, currentBlock.func);
        IRBasicBlock elseBlock = new IRBasicBlock("cond.else." + condExprID, currentBlock.func);
        IRBasicBlock endBlock = new IRBasicBlock("cond.end." + condExprID, currentBlock.func);
        condExprID++;

        boolean noValue = it.type.name.equals("void");
        IRLocalVar resPtr = null;
        if (!noValue) {
            resPtr = getNamelessVariable(new IRPtrType(it.type.toIR()));
            currentBlock.body.add(new IRAllocaInst(resPtr));
        }
        it.cond.accept(this);
        IRValue condVal = getValueResult(it.cond.isLeft);
        currentBlock.body.add(new IRBrInst(thenBlock, elseBlock, condVal));
        submitBlock();

        currentBlock = thenBlock;
        it.left.accept(this);
        IRValue leftVal = getValueResult(it.left.isLeft);
        if (!noValue) {
            currentBlock.body.add(new IRStoreInst(leftVal, resPtr));
        }
        currentBlock.body.add(new IRJumpInst(endBlock));
        submitBlock();

        currentBlock = elseBlock;
        it.right.accept(this);
        IRValue rightVal = getValueResult(it.right.isLeft);
        if (!noValue) {
            currentBlock.body.add(new IRStoreInst(rightVal, resPtr));
        }
        currentBlock.body.add(new IRJumpInst(endBlock));
        submitBlock();

        currentBlock = endBlock;
        if (!noValue) {
            IRLocalVar res = getNamelessVariable(it.type.toIR());
            currentBlock.body.add(new IRLoadInst(res, resPtr));
            curExprValue = res;
        } else {
            curExprValue = null;
        }
    }

    @Override
    public void visit(AssignExprNode it) {
        it.rhs.accept(this);
        IRValue right = getValueResult(it.rhs.isLeft);
        it.lhs.accept(this);
        currentBlock.body.add(new IRStoreInst(right, curExprValue));
    }

    @Override
    public void visit(FStringNode it) {
        ArrayList<IRValue> exprList = new ArrayList<>();
        ArrayList<IRGlobalVar> strList = new ArrayList<>();

        for (int i = 0; i < it.strings.size(); i++) {
            String str = it.strings.get(i);
            IRGlobalVar globalVar = (IRGlobalVar) globalScope.IRAddVar(
                    "FString." + FStringCnt + ".Literal." + i,
                    new IRPtrType(new IRIntType(8))); // a char, actually
            root.fStrings.add(new IRStringLiteralDef(globalVar, str));
            strList.add(globalVar);
        }

        IRValue res = strList.get(0); // global var by now
        for (int i = 0; i < it.exprs.size(); i++) {
            ExprNode expr = it.exprs.get(0);
            expr.accept(this);
            IRValue value = getValueResult(expr.isLeft);
            if (expr.type.name.equals("bool")) {
                IRLocalVar IRExpr = getNamelessVariable(new IRPtrType(new IRIntType(8)));
                currentBlock.body.add(new IRCallInst(IRExpr, "builtin.bool_to_string", value));
                exprList.add(IRExpr);
            } else if (expr.type.name.equals("int")) {
                IRLocalVar IRExpr = getNamelessVariable(new IRPtrType(new IRIntType(8)));
                currentBlock.body.add(new IRCallInst(IRExpr, "toString", value));
                exprList.add(IRExpr);
            } else { // expr.type.name.equals("string")
                exprList.add(value);
            }
        }
        for (int i = 0; i < exprList.size(); i++) {
            IRLocalVar tmp = getNamelessVariable(new IRPtrType(new IRIntType(8)));
            currentBlock.body.add(new IRCallInst(tmp, "builtin.string_add", res, exprList.get(i)));
            res = getNamelessVariable(new IRPtrType(new IRIntType(8)));
            currentBlock.body.add(new IRCallInst((IRLocalVar) res, "builtin.string_add", tmp, strList.get(i + 1)));
        }
        FStringCnt++;
        curExprValue = res;
    }

    @Override
    public void visit(IdentifierNode it) {
        if (curScope.getClassName() != null) { // class member var
            if (root.structDefMap.get(curScope.getClassName()).struct.varToIdMap.containsKey(it.name)) { // this.member
                Integer id = root.structDefMap.get(curScope.getClassName()).struct.varToIdMap.get(it.name);
                IRValue thiss = currentBlock.func.args.get(0);
                IRLocalVar ptr = getNamelessVariable(new IRPtrType(it.type.toIR()));
                currentBlock.body.add(new IRGetelementptrInst(ptr, thiss, null, id));
                curExprValue = ptr;
                return;
            }
        }
        // global or local var
        curExprValue = curScope.getIRVar(it.name);
    }

    @Override
    public void visit(BoolLiteralNode it) {
        curExprValue = new IRBoolConst(it.value);
    }

    @Override
    public void visit(StringLiteralNode it) {
        IRGlobalVar globalVar = (IRGlobalVar) globalScope.IRAddVar("stringLiteral." + stringLiteralCnt,
                new IRPtrType(new IRIntType(8))); // a char, actually
        stringLiteralCnt++;
        root.stringLiterals.add(new IRStringLiteralDef(globalVar, it.str));
        curExprValue = globalVar;
    }

    @Override
    public void visit(IntLiteralNode it) {
        curExprValue = new IRIntConst(it.val);
    }

    @Override
    public void visit(ConstructorDefNode it) {
        curScope = new FnScope(curScope, new FnType(new Type("void")));
        String fullName = curScope.getClassName() + '.' + curScope.getClassName();

        IRFuncDef irFuncDef = new IRFuncDef(fullName, new IRVoidType());
        currentBlock = new IRBasicBlock(fullName + ".entry", irFuncDef);

        IRType type = new IRPtrType(new IRStructType(curScope.getClassName()));
        IRLocalVar localVar = new IRLocalVar("this", type);
        irFuncDef.args.add(localVar);
        for (var stmt : it.stmts) {
            stmt.accept(this);
            if (currentBlock == null) {
                break;
            }
        }
        if (currentBlock != null) {
            currentBlock.body.add(new IRRetInst(null));
            submitBlock();
        }
        root.funcDefMap.put(fullName, irFuncDef);
        curScope = curScope.parentScope;
    }

    @Override
    public void visit(ThisNode it) {
        curExprValue = currentBlock.func.args.get(0);
    }
}
