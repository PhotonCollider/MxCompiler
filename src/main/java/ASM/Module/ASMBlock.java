package ASM.Module;

import ASM.ASMNode;
import ASM.Inst.ASMInst;

import java.util.ArrayList;

public class ASMBlock extends ASMNode {
    public String label;
    public ArrayList<ASMInst> body;
    private static int branchBlockCnt = 0;

    public ASMBlock(String label) {
        this.label = label;
        body = new ArrayList<>();
    }

    public ASMBlock(String label, boolean isBranchBlock) {
        if (isBranchBlock) {
            this.label = "asm.branchBlock." + branchBlockCnt++;
        } else {
            this.label = label;
        }
        body = new ArrayList<>();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        if (label != null) {
            sb.append(label).append(":\n");
        }
        for (var inst : body) {
            sb.append('\t').append(inst).append('\n');
        }
        return sb.toString();
    }
}
