import java.io.*;

import AST.RootNode;
import Frontend.ASTBuilder;
import Frontend.IRBuilder;
import Frontend.SemanticChecker;
import Frontend.SymbolCollector;
import IR.Module.IRRootNode;
import Util.scope.GlobalScope;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import Parser.*;
import Util.*;

public class Main {
    public static void main(String[] args) throws Exception {
        String inputPath = "./src/test/test.mx";
        boolean usingStdio = args.length > 0;
        InputStream input = usingStdio ? System.in : new FileInputStream(inputPath);
        FileWriter fileOutput = usingStdio ? null : new FileWriter("./src/test/test.ll");
        try {
            MxLexer lexer = new MxLexer(CharStreams.fromStream(input));
            lexer.removeErrorListeners();
            lexer.addErrorListener(new MxErrorListener());
            MxParser parser = new MxParser(new CommonTokenStream(lexer));
            parser.removeErrorListeners();
            parser.addErrorListener(new MxErrorListener());
            ParseTree parseTreeRoot = parser.program();

            GlobalScope gScope = new GlobalScope();
            ASTBuilder astBuilder = new ASTBuilder();
            RootNode ast = (RootNode) astBuilder.visit(parseTreeRoot);

            new SymbolCollector(gScope).visit(ast);
            new SemanticChecker(gScope).visit(ast);

            IRRootNode IRRoot = new IRRootNode();
            new IRBuilder(gScope, IRRoot).visit(ast);

            if (usingStdio) {
                System.out.println(IRRoot);
            } else {
                fileOutput.write(IRRoot.toString());
                fileOutput.flush();
                fileOutput.close();
            }
        } catch (Error er) {
            System.err.println(er);
            System.exit(1);
        }
        System.exit(0);
    }
}