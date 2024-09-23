package IR;

abstract public class IRNode {
    @Override
    public abstract String toString();

    public abstract void accept(IRVisitor visitor);
}