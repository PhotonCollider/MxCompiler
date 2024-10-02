package ASM.Inst;

public class ASMAscizInst extends ASMInst {
    String content;
    private final String contentPrint;

    public ASMAscizInst(String content) {
        this.content = content;

        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < content.length(); i++) {
            char ch = content.charAt(i);
            switch (ch) {
                case '\\' -> sb.append("\\\\");
                case '\n' -> sb.append("\\n");
                case '\"' -> sb.append("\\\"");
                default -> sb.append(ch);
            }
        }
        contentPrint = sb.toString();
    }

    @Override
    public String toString() {
        return ".asciz \"" + contentPrint + '"';
    }
}
