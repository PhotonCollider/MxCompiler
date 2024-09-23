package Util.scope;

public class LoopScope extends SuiteScope {
    public LoopScope(SuiteScope parentScope) {
        super(parentScope);
    }

    @Override
    public boolean isInLoop() {
        return true;
    }
}
