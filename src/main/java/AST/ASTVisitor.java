package AST;

import AST.def.*;
import AST.expr.*;
import AST.expr.atom.*;
import AST.stmt.*;

public interface ASTVisitor {
    void visit(RootNode it);

    void visit(ClassDefNode it);

    void visit(FnDefNode it);

    void visit(VarDefNode it);

    void visit(SuiteStmtNode it);

    void visit(VarDefStmtNode it);

    void visit(IfStmtNode it);

    void visit(WhileStmtNode it);

    void visit(ForStmtNode it);

    void visit(ReturnStmtNode it);

    void visit(BreakStmtNode it);

    void visit(ContinueStmtNode it);

    void visit(ExprStmtNode it);

    void visit(ParenExprNode it);

    void visit(NewArrayExprNode it);

    void visit(ArrayLiteralNode it);

    void visit(NullLiteralNode it);

    void visit(NewVariableExprNode it);

    void visit(FnCallExprNode it);

    void visit(ArrayExprNode it);

    void visit(MemberAccessExprNode it);

    void visit(PostfixUpdateExprNode it);

    void visit(PrefixUpdateExprNode it);

    void visit(UnaryExprNode it);

    void visit(BinaryExprNode it);

    void visit(CondExprNode it);

    void visit(AssignExprNode it);

    void visit(FStringNode it);

    void visit(IdentifierNode it);

    void visit(BoolLiteralNode it);

    void visit(StringLiteralNode it);

    void visit(IntLiteralNode it);

    void visit(ConstructorDefNode it);

    void visit(ThisNode it);
}
