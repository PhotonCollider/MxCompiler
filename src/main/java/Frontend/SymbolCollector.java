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
import Util.scope.ClassScope;
import Util.scope.GlobalScope;
import Util.type.ClassType;
import Util.type.FnType;
import Util.type.Type;

public class SymbolCollector implements ASTVisitor {
    GlobalScope globalScope;

    public SymbolCollector(GlobalScope globalScope) {
        this.globalScope = globalScope;
    }

    @Override
    public void visit(RootNode it) {
        for (var def : it.defs) {
            def.accept(this);
        }
    }

    @Override
    public void visit(ClassDefNode it) {
        it.scope = new ClassScope(globalScope, it.name);
        for (var funcDef : it.fnDefs) {
            it.scope.addFn(funcDef.name, new FnType(funcDef), it.pos);
        }
        for (var varDef : it.varDefs) {
            for (var varDefUnit : varDef.list) {
                it.scope.addVar(varDefUnit.first, new Type(varDef.type), it.pos);
            }
        }
        globalScope.addClass(it.name, it.pos, new ClassType(it.scope));
    }

    @Override
    public void visit(FnDefNode it) {
        globalScope.addFn(it.name, new FnType(it), it.pos);
    }

    @Override
    public void visit(VarDefNode it) {

    }

    @Override
    public void visit(SuiteStmtNode it) {

    }

    @Override
    public void visit(VarDefStmtNode it) {

    }

    @Override
    public void visit(IfStmtNode it) {

    }

    @Override
    public void visit(WhileStmtNode it) {

    }

    @Override
    public void visit(ForStmtNode it) {

    }

    @Override
    public void visit(ReturnStmtNode it) {

    }

    @Override
    public void visit(BreakStmtNode it) {

    }

    @Override
    public void visit(ContinueStmtNode it) {

    }

    @Override
    public void visit(ExprStmtNode it) {

    }

    @Override
    public void visit(ParenExprNode it) {

    }

    @Override
    public void visit(NewArrayExprNode it) {

    }

    @Override
    public void visit(ArrayLiteralNode it) {

    }

    @Override
    public void visit(NullLiteralNode it) {

    }

    @Override
    public void visit(NewVariableExprNode it) {

    }

    @Override
    public void visit(FnCallExprNode it) {

    }

    @Override
    public void visit(ArrayExprNode it) {

    }

    @Override
    public void visit(MemberAccessExprNode it) {

    }

    @Override
    public void visit(PostfixUpdateExprNode it) {

    }

    @Override
    public void visit(PrefixUpdateExprNode it) {

    }

    @Override
    public void visit(UnaryExprNode it) {

    }

    @Override
    public void visit(BinaryExprNode it) {

    }

    @Override
    public void visit(CondExprNode it) {

    }

    @Override
    public void visit(AssignExprNode it) {

    }

    @Override
    public void visit(FStringNode it) {

    }

    @Override
    public void visit(IdentifierNode it) {

    }

    @Override
    public void visit(BoolLiteralNode it) {

    }

    @Override
    public void visit(StringLiteralNode it) {

    }

    @Override
    public void visit(IntLiteralNode it) {

    }

    @Override
    public void visit(ConstructorDefNode it) {

    }

    @Override
    public void visit(ThisNode it) {

    }
}
