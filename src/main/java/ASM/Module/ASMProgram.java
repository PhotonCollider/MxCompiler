package ASM.Module;

import ASM.ASMNode;

public class ASMProgram extends ASMNode {
    public ASMSection text, data, rodata;

    public ASMProgram() {
        text = new ASMSection("text");
        data = new ASMSection("data");
        rodata = new ASMSection("rodata");
    }

    @Override
    public String toString() {
        return text.toString() + '\n' +
                data + '\n' +
                rodata + '\n';
    }
}
