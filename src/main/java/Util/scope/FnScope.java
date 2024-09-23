package Util.scope;

import Util.Pos;
import Util.error.TypeMismatchError;
import Util.type.FnType;
import Util.type.Type;

public class FnScope extends SuiteScope {
    public FnType type;

    public FnScope(SuiteScope parentScope, FnType type) {
        super(parentScope);
        this.type = type;
    }

    @Override
    public void checkReturnType(Type ret, Pos pos) {
        if (ret == null && type.retType.equals(new Type("void"))) {
            return;
        }
        if (!(this.type.retType.equals(ret))) {
            throw new TypeMismatchError(pos, "expecting " + this.type.retType + " return type");
        }
    }
}
