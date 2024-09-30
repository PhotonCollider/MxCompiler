package Backend;

import ASM.Module.ASMProgramNode;
import IR.IRVisitor;
import IR.Module.*;

public abstract class ASMBuilder implements IRVisitor {
    private ASMProgramNode prog;

    public ASMBuilder() {
        prog = new ASMProgramNode();
    }

    public ASMProgramNode getProgram() {
        return prog;
    }

    @Override
    public void visit(IRProgramNode irProgramNode) {

    }
}
