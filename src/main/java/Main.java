import java.io.*;

import ASM.Module.ASMRootNode;
import AST.RootNode;
import Backend.ASMBuilder;
import Frontend.ASTBuilder;
import Frontend.IRBuilder;
import Frontend.SemanticChecker;
import Frontend.SymbolCollector;
import IR.Module.IRProgramNode;
import Util.scope.GlobalScope;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import Parser.*;
import Util.*;

public class Main {
    public static void main(String[] args) throws Exception {
        String ioStr = args[0];
        String fileInputPath = "./src/test/test.mx";
        boolean usingStdio = ioStr.equals("-use-stdio");
        InputStream input = usingStdio ? System.in : new FileInputStream(fileInputPath);
        FileWriter fileOutput = usingStdio ? null : new FileWriter("./src/test/test.ll");
        boolean emitLLVM = args[1].equals("-emit-llvm");
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

            IRBuilder irBuilder = new IRBuilder(gScope);
            irBuilder.visit(ast);
            IRProgramNode irProgramNode = irBuilder.getProgram();

            if (emitLLVM) {
                if (usingStdio) {
                    System.out.println(irProgramNode);
                } else {
                    fileOutput.write(irProgramNode.toString());
                    fileOutput.flush();
                    fileOutput.close();
                }
            } else {
                ASMBuilder asmBuilder = new ASMBuilder();
                asmBuilder.visit(irProgramNode);
                ASMRootNode ASMRoot = asmBuilder.getProgram();
                if (usingStdio) {
                    System.out.println(ASMRoot);
                } else {
                    fileOutput.write(ASMRoot.toString());
                    fileOutput.flush();
                    fileOutput.close();
                }
            }
        } catch (Error er) {
            System.err.println(er);
            System.exit(1);
        }
        System.exit(0);
    }
}