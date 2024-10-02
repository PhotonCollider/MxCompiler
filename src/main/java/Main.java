import java.io.*;

import ASM.Module.ASMProgram;
import AST.RootNode;
import Backend.ASMBuilder;
import Backend.StackManager;
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
        boolean emitLLVM = args[1].equals("-emit-llvm");
        FileWriter fileOutput = usingStdio ? null : (emitLLVM ? new FileWriter("./src/test/test.ll") : new FileWriter("./src/test/test.s"));
        try {
            // parse
            MxLexer lexer = new MxLexer(CharStreams.fromStream(input));
            lexer.removeErrorListeners();
            lexer.addErrorListener(new MxErrorListener());
            MxParser parser = new MxParser(new CommonTokenStream(lexer));
            parser.removeErrorListeners();
            parser.addErrorListener(new MxErrorListener());
            ParseTree parseTreeRoot = parser.program();

            // AST
            GlobalScope gScope = new GlobalScope();
            ASTBuilder astBuilder = new ASTBuilder();
            RootNode ast = (RootNode) astBuilder.visit(parseTreeRoot);

            new SymbolCollector(gScope).visit(ast);
            new SemanticChecker(gScope).visit(ast);

            // IR
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
                // ASM
                new StackManager().visit(irProgramNode);

                ASMBuilder asmBuilder = new ASMBuilder();
                asmBuilder.visit(irProgramNode);
                ASMProgram asmProgramNode = asmBuilder.getProgram();
                if (usingStdio) {
                    System.out.println(asmProgramNode);
                } else {
                    fileOutput.write(asmProgramNode.toString());
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