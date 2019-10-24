package sql;

import com.microsoft.sqlserver.javalangextension.PrimitiveDataset;
import java.util.LinkedHashMap;
import com.microsoft.sqlserver.javalangextension.AbstractSqlServerExtensionExecutor;
public class JavaTest1 extends AbstractSqlServerExtensionExecutor {
    

    public JavaTest1() {
        executorExtensionVersion = SQLSERVER_JAVA_LANG_EXTENSION_V1;
        executorInputDatasetClassName = PrimitiveDataset.class.getName();
        executorOutputDatasetClassName = PrimitiveDataset.class.getName();
    }

    public PrimitiveDataset execute(PrimitiveDataset input, LinkedHashMap<String, Object> params) {

        // int x = (int)params.get("x");
        // int y = (int)params.get("y");

        Object x = params.get("x");
        Object y = params.get("y").toString();

        if(x == null) {
            x = "null";
        }

        
     
        System.out.printf("Value of x = %s and y = %s", x, y);   

        params.put("x", 42);

        //System.out.printf("The result of adding %d and %d = %d", x, y, x + y);   
        return null;

    }
}

