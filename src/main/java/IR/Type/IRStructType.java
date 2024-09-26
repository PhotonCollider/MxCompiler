package IR.Type;

import java.util.ArrayList;
import java.util.HashMap;

public class IRStructType extends IRType {
    public String name;
    public ArrayList<IRType> fields;
    public HashMap<String, Integer> varToIdMap;

    public IRStructType(String name) {
        this.name = name;
        fields = new ArrayList<>();
        varToIdMap = new HashMap<>();
    }

    @Override
    public String toString() {
        return "%struct." + name;
    }

    public String getStructInfo() {
        StringBuilder sb = new StringBuilder("{");
        for (int i = 0; i < fields.size(); i++) {
            sb.append(fields.get(i));
            if (i < fields.size() - 1) {
                sb.append(", ");
            }
        }
        sb.append("}");
        return sb.toString();
    }

    @Override
    public boolean equals(Object obj) {
        return obj instanceof IRStructType && name.equals(((IRStructType)obj).name);
    }

//    @Override
//    public int getSize() {
//        if (fields.isEmpty()) {
//            return 4;
//        }
//        return 4 * fields.size();
//    }
}