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
import Util.error.InvalidTypeError;
import Util.error.SemanticError;
import Util.error.TypeMismatchError;
import Util.scope.*;
import Util.type.ClassType;
import Util.type.FnType;
import Util.type.Type;

public class SemanticChecker implements ASTVisitor {
    GlobalScope globalScope;
    SuiteScope curScope;

    public SemanticChecker(GlobalScope globalScope) {
        this.globalScope = globalScope;
    }

    @Override
    public void visit(RootNode it) {
        curScope = globalScope;
        FnType mainType = globalScope.getFnType("main", it.pos);
        if (mainType == null) {
            throw new SemanticError(it.pos, "main function not found");
        }
        if (!mainType.retType.equals(new Type("int"))) {
            throw new InvalidTypeError(it.pos, "main function return type is not int");
        }
        if (!mainType.arg.isEmpty()) {
            throw new SemanticError(it.pos, "main function should have no parameters");
        }
        for (var def : it.defs) {
            def.accept(this);
        }
        curScope = curScope.parentScope;
    }

    @Override
    public void visit(ClassDefNode it) {
        curScope = it.scope;
        // no need to visit varDef, already did so in SymbolCollector
        for (var def : it.fnDefs) {
            def.accept(this);
        }
        if (it.constructor != null) {
            if (!it.constructor.name.equals(it.name)) {
                throw new SemanticError(it.constructor.pos, "constructor name does not match class name");
            }
            it.constructor.accept(this);
        }
        curScope = curScope.parentScope;
    }

    @Override
    public void visit(ConstructorDefNode it) {
        curScope = new FnScope(curScope, new FnType(new Type("void")));
        for (var stmt : it.stmts) {
            stmt.accept(this);
        }
        curScope = curScope.parentScope;
    }

    @Override
    public void visit(FnDefNode it) {
        curScope = new FnScope(curScope, new FnType(it));
        for (var def : it.paramList) {
            curScope.addVar(def.first, def.second, it.pos);
        }
        boolean haveReturned = false;
        for (var stmt : it.body) {
            stmt.accept(this);
            if (stmt instanceof ReturnStmtNode) {
                haveReturned = true;
            }
            if (stmt instanceof IfStmtNode && ((IfStmtNode) stmt).haveReturned) {
                haveReturned = true;
            }
            if (stmt instanceof SuiteStmtNode && ((SuiteStmtNode) stmt).haveReturned) {
                haveReturned = true;
            }
        }
        if (!it.retType.equals(new Type("void")) && !haveReturned && !it.name.equals("main")) {
            throw new SemanticError(it.pos, "no return statement found in non-void function");
        }
        curScope = curScope.parentScope;
    }

    @Override
    public void visit(VarDefNode it) {
        ClassType unused = globalScope.getClassType(it.type.name, it.pos);
        for (var pair : it.list) {
            if (pair.second != null) {
                pair.second.accept(this);
                if (!pair.second.type.equals(it.type)) {
                    throw new InvalidTypeError(it.pos, "Invalid init expression");
                }
            }
        }
        for (var pair : it.list) {
            curScope.addVar(pair.first, it.type, it.pos);
        }
    }

    @Override
    public void visit(SuiteStmtNode it) {
        curScope = new SuiteScope(curScope);
        for (var stmt : it.stmtNodes) {
            stmt.accept(this);
            if (stmt instanceof ReturnStmtNode) {
                it.haveReturned = true;
            }
            if (stmt instanceof IfStmtNode && ((IfStmtNode) stmt).haveReturned) {
                it.haveReturned = true;
            }
            if (stmt instanceof SuiteStmtNode && ((SuiteStmtNode) stmt).haveReturned) {
                it.haveReturned = true;
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
        it.cond.accept(this);
        if (!it.cond.type.equals(new Type("bool"))) {
            throw new InvalidTypeError(it.pos, "expecting bool in condition of if statement");
        }
        if (it.thenStmt != null) {
            it.thenStmt.accept(this);
        }
        if (it.elseStmt != null) {
            it.elseStmt.accept(this);
        }
        if (!(it.thenStmt != null && !it.thenStmt.haveReturned)
                && !(it.elseStmt != null && !it.elseStmt.haveReturned)) {
            it.haveReturned = true;
        }
    }

    @Override
    public void visit(WhileStmtNode it) {
        curScope = new LoopScope(curScope);
        it.cond.accept(this);
        if (!it.cond.type.equals(new Type("bool"))) {
            throw new InvalidTypeError(it.pos, "expecting bool in condition of while statement");
        }
        if (it.body != null) {
            it.body.accept(this);
        }
        curScope = curScope.parentScope;
    }

    @Override
    public void visit(ForStmtNode it) {
        curScope = new LoopScope(curScope);
        if (it.init != null) {
            it.init.accept(this);
        }
        if (it.cond != null) {
            it.cond.accept(this);
            if (!it.cond.type.equals(new Type("bool"))) {
                throw new InvalidTypeError(it.pos, "expecting bool in condition of for statement");
            }
        }
        if (it.update != null) {
            it.update.accept(this);
        }
        for (var stmt : it.body) {
            stmt.accept(this);
        }
        curScope = curScope.parentScope;
    }

    @Override
    public void visit(ReturnStmtNode it) {
        if (it.ret == null) {
            curScope.checkReturnType(null, it.pos);
        } else {
            it.ret.accept(this);
            curScope.checkReturnType(it.ret.type, it.pos);
        }
    }

    @Override
    public void visit(BreakStmtNode it) {
        if (!curScope.isInLoop()) {
            throw new SemanticError(it.pos, "Invalid break statement outside loop");
        }
    }

    @Override
    public void visit(ContinueStmtNode it) {
        if (!curScope.isInLoop()) {
            throw new SemanticError(it.pos, "Invalid continue statement outside loop");
        }
    }

    @Override
    public void visit(ExprStmtNode it) {
        it.expr.accept(this);
    }

    @Override
    public void visit(ParenExprNode it) {
        it.expr.accept(this);

        it.getTypeAndLValue();
    }

    @Override
    public void visit(NewArrayExprNode it) {
        for (var expr : it.fixedSizeList) {
            expr.accept(this);
        }
        if (it.init != null) {
            it.init.accept(this);
        }
        it.getTypeAndLValue();
    }

    @Override
    public void visit(ArrayLiteralNode it) {
        it.getTypeAndLValue();
    }

    @Override
    public void visit(NullLiteralNode it) {
        it.getTypeAndLValue();
    }

    @Override
    public void visit(NewVariableExprNode it) {
        it.getTypeAndLValue();
    }

    @Override
    public void visit(FnCallExprNode it) {
        it.fnName.accept(this);
        if (it.fnName instanceof IdentifierNode) {
            FnType fnType = curScope.getFnType(((IdentifierNode) it.fnName).name, it.pos);
            if (fnType.arg.size() != it.arg.size()) {
                throw new SemanticError(it.pos, "argument count does not match");
            }
            for (var expr : it.arg) {
                expr.accept(this);
            }
            for (int i = 0; i < fnType.arg.size(); i++) {
                if (!fnType.arg.get(i).equals(it.arg.get(i).type)) {
                    throw new TypeMismatchError(it.pos, "type mismatch at argument #" + (i + 1) + " , expecting " + fnType.arg.get(i) + " , found " + it.arg.get(i).type);
                }
            }
            it.type = new Type(fnType.retType);
        } else if (it.fnName instanceof MemberAccessExprNode) {
            it.fnName.accept(this);
            if (((MemberAccessExprNode) it.fnName).member.equals("size")) {
                // calling the size() method on an array instance
                if (!it.arg.isEmpty()) {
                    throw new SemanticError(it.pos, "expecting no arguments in method size");
                }
                it.type = new Type("int");
            } else {
                ClassType classType = globalScope.getClassType(((MemberAccessExprNode) it.fnName).instanceName.type.name, it.pos);
                FnType fnType = classType.getFnType(((MemberAccessExprNode) it.fnName).member, it.pos);

                if (fnType.arg.size() != it.arg.size()) {
                    throw new SemanticError(it.pos, "argument count does not match");
                }
                for (var expr : it.arg) {
                    expr.accept(this);
                }
                for (int i = 0; i < fnType.arg.size(); i++) {
                    if (!fnType.arg.get(i).equals(it.arg.get(i).type)) {
                        throw new TypeMismatchError(it.pos, "type mismatch at argument #" + (i + 1));
                    }
                }
                it.type = new Type(fnType.retType);
            }
        } else {
            throw new SemanticError(it.pos, "Invalid function name");
        }
        it.getTypeAndLValue();
    }

    @Override
    public void visit(ArrayExprNode it) {
        it.array.accept(this);
        if (it.array.type.dimension <= 0) {
            throw new SemanticError(it.pos, "not a array");
        }
        it.index.accept(this);
        it.getTypeAndLValue();
    }

    @Override
    public void visit(MemberAccessExprNode it) {
        it.instanceName.accept(this);
        ClassType classType = globalScope.getClassType(it.instanceName.type.name, it.pos);
        if (classType.varDeclare.containsKey(it.member)) {
            it.type = classType.getVarType(it.member, it.pos);
            it.isFunction = false;
            it.isLeft = true;
        } else if (classType.fnDeclare.containsKey(it.member)) {
            // it.type will be found in FnCallExprNode
            it.isFunction = true;
            it.isLeft = false;
        } else {
            if (it.member.equals("size") && it.instanceName.type.dimension > 0) {
                // size() method on array instance, is ok
            } else {
                throw new SemanticError(it.pos, "undefined class member " + it.member);
            }
        }
    }

    @Override
    public void visit(PostfixUpdateExprNode it) {
        it.expr.accept(this);
        it.getTypeAndLValue();
    }

    @Override
    public void visit(PrefixUpdateExprNode it) {
        it.expr.accept(this);
        it.getTypeAndLValue();
    }

    @Override
    public void visit(UnaryExprNode it) {
        it.expr.accept(this);
        it.getTypeAndLValue();
    }

    @Override
    public void visit(BinaryExprNode it) {
        it.lhs.accept(this);
        it.rhs.accept(this);
        it.getTypeAndLValue();
    }

    @Override
    public void visit(CondExprNode it) {
        it.cond.accept(this);
        it.left.accept(this);
        it.right.accept(this);
        it.getTypeAndLValue();
    }

    @Override
    public void visit(AssignExprNode it) {
        it.lhs.accept(this);
//        if (!it.lhs.isLeft) {
//            throw new SemanticError(it.pos, "lhs is not a left value");
//        }
        it.rhs.accept(this);
//        if ((it.lhs.type.name.equals("int") || it.lhs.type.name.equals("bool") || it.lhs.type.name.equals("string"))
//                && it.rhs.type.name.equals("null")) {
//            throw new SemanticError(it.pos, "null cannot be assigned to a built-in type");
//        }
        it.getTypeAndLValue();
    }

    @Override
    public void visit(FStringNode it) {
        for (var expr : it.exprs) {
            expr.accept(this);
        }
        it.getTypeAndLValue();
    }

    @Override
    public void visit(IdentifierNode it) {
        it.getTypeAndLValue();
        try {
            it.type = curScope.getVarType(it.name, it.pos);
        } catch (RuntimeException e) {
            try {
                curScope.getFnType(it.name, it.pos);
                it.type = null;
                // if it is name of a function,
                // the type will be get in visit(FnCallExprNode)
            } catch (RuntimeException ee) {
                throw new SemanticError(it.pos, "Undefined identifier " + it.name);
            }
        }
    }

    @Override
    public void visit(BoolLiteralNode it) {
        it.getTypeAndLValue();
    }

    @Override
    public void visit(StringLiteralNode it) {
        it.getTypeAndLValue();
    }

    @Override
    public void visit(IntLiteralNode it) {
        it.getTypeAndLValue();
    }

    @Override
    public void visit(ThisNode it) {
        it.type = new Type(curScope.getClassName(), 0);
        it.getTypeAndLValue();
    }
}
