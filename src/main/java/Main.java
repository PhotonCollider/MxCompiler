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
        String ioStr = args[0], llvmStr = args[1];
        if (ioStr.equals("-h") || ioStr.equals("--help")) {
            System.out.println("usage:\t -use-stdio -emit-llvm");
            return;
        }
        String fileInputPath = "./src/test/test.mx";
        boolean usingStdio = ioStr.equals("-use-stdio");
        InputStream input = usingStdio ? System.in : new FileInputStream(fileInputPath);
        boolean emitLLVM = llvmStr.equals("-emit-llvm");
        FileWriter fileOutput;
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
            if (emitLLVM || !usingStdio) {
                if (usingStdio) {
                    System.out.println(irProgramNode);
                    System.exit(0);
                } else { // debug
                    fileOutput = new FileWriter("./src/test/test.ll");
                    fileOutput.write(irProgramNode.toString());
                    fileOutput.flush();
                    fileOutput.close();
                }
            }
            // ASM
            new StackManager(!usingStdio).visit(irProgramNode);

            ASMBuilder asmBuilder = new ASMBuilder();
            asmBuilder.visit(irProgramNode);
            ASMProgram asmProgramNode = asmBuilder.getProgram();
            if (usingStdio) {
                System.out.println(asmProgramNode);
            } else {
                fileOutput = new FileWriter("./src/test/test.s");
                fileOutput.write(asmProgramNode.toString());
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