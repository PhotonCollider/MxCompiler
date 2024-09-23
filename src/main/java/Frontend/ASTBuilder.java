package Frontend;

import AST.*;
import AST.def.ClassDefNode;
import AST.def.ConstructorDefNode;
import AST.def.FnDefNode;
import AST.def.VarDefNode;
import AST.expr.*;
import AST.expr.atom.*;
import AST.stmt.*;
import Parser.MxBaseVisitor;
import Parser.MxParser;
import Util.Pair;
import Util.Pos;
import Util.type.Type;
import Util.error.SyntaxError;

public class ASTBuilder extends MxBaseVisitor<ASTNode> {
    @Override
    public ASTNode visitProgram(MxParser.ProgramContext ctx) {
        RootNode program = new RootNode(new Pos(ctx));
        for (var child : ctx.children) {
            var result = visit(child);
            if (result == null) continue;
            program.defs.add(result);
        }
        return program;
    }

    @Override
    public ASTNode visitClassDef(MxParser.ClassDefContext ctx) {
        if (ctx.constructorDef().size() >= 2) {
            System.out.println("Multiple Definitions");
            throw new SyntaxError(new Pos(ctx), "Constructor Redefinition Error: " + ctx.Identifier().getText());
        }
        ConstructorDefNode constructor =
                (ctx.constructorDef().isEmpty() ? null : (ConstructorDefNode) visit(ctx.constructorDef(0)));
        ClassDefNode classDef = new ClassDefNode(new Pos(ctx), ctx.Identifier().getText(), constructor);

        ctx.varDef().forEach(vd -> classDef.varDefs.add((VarDefNode) visit(vd)));
        ctx.functionDef().forEach(fd -> classDef.fnDefs.add((FnDefNode) visit(fd)));
        return classDef;
    }

    @Override
    public ASTNode visitConstructorDef(MxParser.ConstructorDefContext ctx) {
        ConstructorDefNode constructor = new ConstructorDefNode(new Pos(ctx), ctx.Identifier().getText());
        for (var stmt : ctx.suite().statement()) {
            if (stmt instanceof MxParser.EmptyStmtContext) {
                continue;
            }
            constructor.stmts.add((StmtNode) visit(stmt));
        }
        return constructor;
    }

    @Override
    public ASTNode visitFunctionDef(MxParser.FunctionDefContext ctx) {
        FnDefNode fnDefNode = new FnDefNode(new Pos(ctx), new Type(ctx.returnType()), ctx.Identifier(0).getText());
        for (int i = 0; i < ctx.type().size(); i++) {
            fnDefNode.paramList.add(new Pair<>(ctx.Identifier(i + 1).getText(), new Type(ctx.type(i))));
        }
        for (var stmt : ctx.suite().statement()) {
            if (stmt instanceof MxParser.EmptyStmtContext) {
                continue;
            }
            fnDefNode.body.add((StmtNode) visit(stmt));
        }
        return fnDefNode;
    }

    @Override
    public ASTNode visitVarDef(MxParser.VarDefContext ctx) {
        VarDefNode varDef = new VarDefNode(new Pos(ctx), new Type(ctx.type()));
        int idIndex = 0;
        for (var expr : ctx.expression()) {
            while (idIndex + 1 < ctx.Identifier().size() &&
                    ctx.Identifier(idIndex + 1).getSymbol().getTokenIndex() < expr.getStart().getTokenIndex()) {
                varDef.list.add(new Pair<>(ctx.Identifier(idIndex++).getText(), null));
            }
            ExprNode exprNode = (ExprNode) visit(expr);
            varDef.list.add(new Pair<>(ctx.Identifier(idIndex++).getText(), exprNode));
        }
        while (idIndex < ctx.Identifier().size()) {
            varDef.list.add(new Pair<>(ctx.Identifier(idIndex++).getText(), null));
        }
        return varDef;
    }

    @Override
    public ASTNode visitBreakStmt(MxParser.BreakStmtContext ctx) {
        return new BreakStmtNode(new Pos(ctx));
    }

    @Override
    public ASTNode visitContinueStmt(MxParser.ContinueStmtContext ctx) {
        return new ContinueStmtNode(new Pos(ctx));
    }

    @Override
    public ASTNode visitExprStmt(MxParser.ExprStmtContext ctx) {
        return new ExprStmtNode(new Pos(ctx), (ExprNode) visit(ctx.expression()));
    }

    @Override
    public ASTNode visitEmptyStmt(MxParser.EmptyStmtContext ctx) {
        return null;
    }

    @Override
    public ASTNode visitForStmt(MxParser.ForStmtContext ctx) {
        ForStmtNode forStmt = new ForStmtNode(new Pos(ctx), (StmtNode) visit(ctx.initStmt),
                ctx.condExpr == null ? null : (ExprNode) visit(ctx.condExpr),
                ctx.stepExpr == null ? null : (ExprNode) visit(ctx.stepExpr));
        StmtNode body = (StmtNode) visit(ctx.statement(1));
        if (body != null) {
            if (body instanceof SuiteStmtNode) {
                forStmt.body.addAll(((SuiteStmtNode) body).stmtNodes);
            } else {
                forStmt.body.add(body);
            }
        }
        return forStmt;
    }

    @Override
    public ASTNode visitIfStmt(MxParser.IfStmtContext ctx) {
        StmtNode elseStmt = ctx.elseStmt == null ? null : (StmtNode) visit(ctx.elseStmt);
        return new IfStmtNode(new Pos(ctx), (ExprNode) visit(ctx.expression()),
                (StmtNode) visit(ctx.thenStmt), elseStmt);
    }

    @Override
    public ASTNode visitReturnStmt(MxParser.ReturnStmtContext ctx) {
        ExprNode expr = ctx.expression() == null ? null : (ExprNode) visit(ctx.expression());
        return new ReturnStmtNode(new Pos(ctx), expr);
    }

    @Override
    public ASTNode visitSuiteStmt(MxParser.SuiteStmtContext ctx) {
        SuiteStmtNode suite = new SuiteStmtNode(new Pos(ctx));
        for (var stmt : ctx.suite().statement()) {
            if (stmt instanceof MxParser.EmptyStmtContext) {
                continue;
            }
            suite.stmtNodes.add((StmtNode) visit(stmt));
        }
        return suite;
    }

    @Override
    public ASTNode visitVarDefStmt(MxParser.VarDefStmtContext ctx) {
        return new VarDefStmtNode(new Pos(ctx), (VarDefNode) visit(ctx.varDef()));
    }

    @Override
    public ASTNode visitWhileStmt(MxParser.WhileStmtContext ctx) {
        return new WhileStmtNode(new Pos(ctx), (ExprNode) visit(ctx.expression()),
                (StmtNode) visit(ctx.statement()));
    }

    @Override
    public ASTNode visitArrayExpr(MxParser.ArrayExprContext ctx) {
        return new ArrayExprNode(new Pos(ctx), (ExprNode) visit(ctx.expression(0)),
                (ExprNode) visit(ctx.expression(1)));
    }

    @Override
    public ASTNode visitAssignExpr(MxParser.AssignExprContext ctx) {
        return new AssignExprNode(new Pos(ctx), (ExprNode) visit(ctx.expression(0)),
                (ExprNode) visit(ctx.expression(1)));
    }

    @Override
    public ASTNode visitBinaryExpr(MxParser.BinaryExprContext ctx) {
        return new BinaryExprNode(new Pos(ctx), (ExprNode) visit(ctx.expression(0)),
                (ExprNode) visit(ctx.expression(1)), ctx.op.getText());
    }

    @Override
    public ASTNode visitConditionalExpr(MxParser.ConditionalExprContext ctx) {
        return new CondExprNode(new Pos(ctx), (ExprNode) visit(ctx.expression(0)),
                (ExprNode) visit(ctx.expression(1)), (ExprNode) visit(ctx.expression(2)));
    }

    @Override
    public ASTNode visitFuncCallExpr(MxParser.FuncCallExprContext ctx) {
        FnCallExprNode fnCall = new FnCallExprNode(new Pos(ctx), (ExprNode) visit(ctx.function_name));
        for (int i = 1; i < ctx.expression().size(); i++) {
            fnCall.arg.add((ExprNode) visit(ctx.expression(i)));
        }
        return fnCall;
    }

    @Override
    public ASTNode visitMemberAccessExpr(MxParser.MemberAccessExprContext ctx) {
        return new MemberAccessExprNode(new Pos(ctx), (ExprNode) visit(ctx.expression()), ctx.Identifier().getText());
    }

    @Override
    public ASTNode visitNewArrayExpr(MxParser.NewArrayExprContext ctx) {
        if (!ctx.expression().isEmpty() && ctx.arrayLiteral() != null) {
            System.out.println("Invalid Identifier");
            throw new SyntaxError(new Pos(ctx), "should not specify array size when initializing from literal");
        }
        var literal = ctx.arrayLiteral() == null ? null : (ArrayLiteralNode) visitArrayLiteral(ctx.arrayLiteral());
        NewArrayExprNode newArrayExpr = new NewArrayExprNode(new Pos(ctx), new Type(ctx.typeName().getText(), ctx.LeftBracket().size()), literal);
        for (int i = 0; i < ctx.expression().size(); i++) {
            if (ctx.expression(i).getStart().getTokenIndex() > ctx.RightBracket(i).getSymbol().getTokenIndex()) {
                System.out.println("Invalid Identifier");
                throw new SyntaxError(new Pos(ctx), "Invalid New Expression Error");
            }
            newArrayExpr.fixedSizeList.add((ExprNode) visit(ctx.expression(i)));
        }
        return newArrayExpr;
    }

    @Override
    public ASTNode visitNewVariableExpr(MxParser.NewVariableExprContext ctx) {
        return new NewVariableExprNode(new Pos(ctx), new Type(ctx.typeName()));
    }

    @Override
    public ASTNode visitParenthesesExpr(MxParser.ParenthesesExprContext ctx) {
        return new ParenExprNode(new Pos(ctx), (ExprNode) visit(ctx.expression()));
    }

    @Override
    public ASTNode visitPrefixUpdateExpr(MxParser.PrefixUpdateExprContext ctx) {
        return new PrefixUpdateExprNode(new Pos(ctx), (ExprNode) visit(ctx.expression()), ctx.op.getText());
    }

    @Override
    public ASTNode visitPostfixUpdateExpr(MxParser.PostfixUpdateExprContext ctx) {
        return new PostfixUpdateExprNode(new Pos(ctx), (ExprNode) visit(ctx.expression()), ctx.op.getText());
    }

    @Override
    public ASTNode visitUnaryExpr(MxParser.UnaryExprContext ctx) {
        return new UnaryExprNode(new Pos(ctx), (ExprNode) visit(ctx.expression()), ctx.op.getText());
    }

    @Override
    public ASTNode visitPrimary(MxParser.PrimaryContext ctx) {
        if (ctx.fstring() != null) {
            return visit(ctx.fstring());
        }
        if (ctx.Identifier() != null) {
            return new IdentifierNode(new Pos(ctx), ctx.Identifier().getText());
        }
        if (ctx.literal() != null) {
            return visit(ctx.literal());
        }
        if (ctx.This() != null) {
            return new ThisNode(new Pos(ctx));
        }
        throw new SyntaxError(new Pos(ctx), "SHOULD NEVER HAPPEN");
    }

    @Override
    public ASTNode visitFstring(MxParser.FstringContext ctx) {
        FStringNode fString = new FStringNode(new Pos(ctx));
        if (ctx.Fstring() != null) {
            fString.strings.add(FStringNode.getFString(ctx.Fstring().getText(), 2, -1));
        } else {
            for (var expr : ctx.expression()) {
                fString.exprs.add((ExprNode) visit(expr));
            }
            fString.strings.add(FStringNode.getFString(ctx.FStringFront().getText(), 2, -1));
            for (var mid : ctx.FStringMid()) {
                fString.strings.add(FStringNode.getFString(mid.getText(), 1, -1));
            }
            fString.strings.add(FStringNode.getFString(ctx.FStringBack().getText(), 1, -1));
        }
        return fString;
    }

    @Override
    public ASTNode visitLiteral(MxParser.LiteralContext ctx) {
        if (ctx.True() != null) {
            return new BoolLiteralNode(new Pos(ctx), true);
        }
        if (ctx.False() != null) {
            return new BoolLiteralNode(new Pos(ctx), false);
        }
        if (ctx.IntegerLiteral() != null) {
            return new IntLiteralNode(new Pos(ctx), Integer.parseInt(ctx.IntegerLiteral().getText()));
        }
        if (ctx.StringLiteral() != null) {
            return new StringLiteralNode(new Pos(ctx), StringLiteralNode.getString(ctx.StringLiteral().getText()));
        }
        if (ctx.Null() != null) {
            return new NullLiteralNode(new Pos(ctx));
        }
        return visitArrayLiteral(ctx.arrayLiteral());
    }

    @Override
    public ASTNode visitArrayLiteral(MxParser.ArrayLiteralContext ctx) {
        ArrayLiteralNode array = new ArrayLiteralNode(new Pos(ctx));
        for (var literal : ctx.literal()) {
            array.literals.add((AtomExprNode) visit(literal));
        }
        return array;
    }


}
