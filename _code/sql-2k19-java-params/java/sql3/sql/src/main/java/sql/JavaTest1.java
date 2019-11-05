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

    boolean isNull = false;

    Integer x = (Integer)params.get("x");
    Integer y = (Integer)params.get("y");
    Integer retVal = (Integer)params.get("retVal");

    if(x == null || y == null) {
      isNull = true;
    }

    if(isNull) {
      params.put("retVal", null);
    }
    else {
      params.put("retVal", x + y);
    }

    return null;
  }

  // public PrimitiveDataset execute(PrimitiveDataset input, LinkedHashMap<String, Object> params) {

  //   boolean isNull = false;

  //   Integer x = (Integer)params.get("x");
  //   Integer y = (Integer)params.get("y");

  //   if(x == null || y == null) {
  //     isNull = true;
  //   }

  //   if(isNull) {
  //     String xStr = x != null ? x.toString() : "null";
  //     String yStr = y != null ? y.toString() : "null";
  //     System.out.printf("The result of adding %s and %s = %s", xStr, yStr, "null");
  //   }
  //   else {
  //     System.out.printf("The result of adding %d and %d = %d", x, y, x + y);
  //   }

  //   return null;
  // }

  // public PrimitiveDataset execute(PrimitiveDataset input, LinkedHashMap<String, Object> params) {

  //   int x = (int)params.get("x");
  //   int y = (int)params.get("y");
  //   System.out.printf("The result of adding %d and %d = %d", x, y, x + y);
  //   return null;
  // }

  // public PrimitiveDataset execute(PrimitiveDataset input, LinkedHashMap<String, Object> params) {

  //   // int x = (int)params.get("x");
  //   // int y = (int)params.get("y");

  //   Object x = params.get("x");
  //   Object y = params.get("y").toString();

  //   if (x == null) {
  //     x = "null";
  //   }

  //   System.out.printf("Value of x = %s and y = %s", x, y);

  //   params.put("x", 42);

  //   // System.out.printf("The result of adding %d and %d = %d", x, y, x + y);
  //   return null;

  // }
}

