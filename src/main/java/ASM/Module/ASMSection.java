package ASM.Module;

import ASM.ASMNode;

import java.util.ArrayList;
import java.util.List;

public class ASMSection extends ASMNode {
    public String name;
    public List<ASMBlock> blocks;

    public ASMSection(String name) {
        this.name = name;
        blocks = new ArrayList<>();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append('.').append(name).append('\n');
        for (var block : blocks) {
            sb.append(block);
        }
        return sb.toString();
    }
}
