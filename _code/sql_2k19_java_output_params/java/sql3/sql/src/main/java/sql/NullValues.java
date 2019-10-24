package sql;

import java.sql.Types;
import java.util.LinkedHashMap;

import com.microsoft.sqlserver.javalangextension.AbstractSqlServerExtensionExecutor;
import com.microsoft.sqlserver.javalangextension.PrimitiveDataset;

public class NullValues extends AbstractSqlServerExtensionExecutor {

  public NullValues() {
    executorExtensionVersion = SQLSERVER_JAVA_LANG_EXTENSION_V1;
    executorInputDatasetClassName = PrimitiveDataset.class.getName();
    executorOutputDatasetClassName = PrimitiveDataset.class.getName();
  }

  
  public PrimitiveDataset execute(PrimitiveDataset input, LinkedHashMap<String, Object> params) {
    
    PrimitiveDataset output = new PrimitiveDataset();

    int numRows = 5;

    output.addColumnMetadata(0, "RowID", Types.INTEGER, 0, 0);
    output.addColumnMetadata(1, "IntCol", Types.INTEGER, 0, 0);
    output.addColumnMetadata(2, "StringCol", Types.NVARCHAR, 256, 0);

    int[] rowIdRows = new int[numRows];
    int[] intColRows = new int[numRows];
    String[] stringColRows = new String[numRows];

    boolean[] intColNullMap = new boolean[numRows];

    for(int x = 0; x < numRows; x++){
      rowIdRows[x] = x+1;
      if(x % 2 ==0) {
        intColRows[x] = 0;
        intColNullMap[x] = true;
      }
      else {
        intColRows[x] = x + 2;
        intColNullMap[x] = false;
      }
      if(x % 3 ==0) {
        stringColRows[x] = null;
      }
      else {
        stringColRows[x] = "Hello number: " + (x + 1);
      }

    }

    output.addIntColumn(0, rowIdRows, null);
    output.addIntColumn(1, intColRows, intColNullMap);
    output.addStringColumn(2, stringColRows);
   
    return output;
  }
  
  /*
  public PrimitiveDataset execute(PrimitiveDataset input, LinkedHashMap<String, Object> params) {
    
    int[] rowId = input.getIntColumn(0);
    int[] col1 = input.getIntColumn(1);
    String[] col2 = input.getStringColumn(2);
    int[] col3 = input.getIntColumn(3);

    boolean[] col1NullMap = input.getColumnNullMap(1);
    boolean[] col2NullMap = input.getColumnNullMap(2);
    boolean[] col3NullMap = input.getColumnNullMap(3);

    // if(col2NullMap == null) {
    //   System.out.printf("col2NullMap is null");
    // }

    int numRows = rowId.length;
    
    for(int x = 0; x < numRows; x++) {
      //System.out.printf("Column value is: %s", (String)col2[x]);
      //System.out.printf("Nullmap value is %b", col2NullMap[x]);
     // System.out.printf("Column value is: %s. Nullmap value is %b", col2[x], col2NullMap[x]);
      System.out.printf("Column value is: %d. Nullmap value is %b", col3[x], col3NullMap[x]);
    }
   
    return null;
  }
  */

  // public PrimitiveDataset execute(PrimitiveDataset input, LinkedHashMap<String, Object> params) {
    
  //   int[] inputCol3 = input.getIntColumn(2);

  //   int numRows = inputCol3.length;
  //   boolean[] nullMap = input.getColumnNullMap(2);
  //   int nonNull= 0;
  //   int sum = 0;

  //   for(int x = 0; x < numRows; x++) {
  //     if(!nullMap[x]) {
  //       nonNull ++;
  //       sum += inputCol3[x];
  //     }

  //   }

  //   double avg = (double)sum / nonNull;

  //   System.out.printf("Average value of y is: %f", avg);
  
  //   return null;
  // }

  // public PrimitiveDataset execute(PrimitiveDataset input, LinkedHashMap<String, Object> params) {
    
  //   int[] inputCol3 = input.getIntColumn(2);

  //   int numRows = inputCol3.length;
  //   int sum = 0;

  //   for(int x = 0; x < numRows; x++) {
  //     sum += inputCol3[x];

  //   }

  //   double avg = (double)sum / numRows;

  //   System.out.printf("Average value of y is: %f", avg);
  
  //   return null;
  // }

  /*
  public PrimitiveDataset execute(PrimitiveDataset input, LinkedHashMap<String, Object> params) {
    
    int[] inputCol1 = input.getIntColumn(0);
    int[] inputCol2 = input.getIntColumn(1);
    int[] inputCol3 = input.getIntColumn(2);

    PrimitiveDataset output = new PrimitiveDataset();

    output.addColumnMetadata(0, "RowID", Types.INTEGER, 0, 0);
    output.addColumnMetadata(1, "x", Types.INTEGER, 0, 0);
    output.addColumnMetadata(2, "y", Types.INTEGER, 0, 0);

    output.addIntColumn(0, inputCol1, null);
    output.addIntColumn(1, inputCol2, null);
    output.addIntColumn(2, inputCol3, null);
   
    return output;
  }
  */


  // public static void multiplier3() {
    
  //   int numRows = inputDataCol1.length;
  //   int numCols = inputNullMap.length;

  //   outputDataCol1 = new int[numRows];
  //   outputDataCol2 = new int[numRows];
    
  //   Boolean colIsNull;

  //   numberOfOutputCols = 2;
  //   outputNullMap = new boolean[numberOfOutputCols][numRows];

  //   for(int i = 0; i < numRows; i++) {
  //     colIsNull = false;
  //     for(int y = 0; y < numCols; y++) {
  //       if(inputNullMap[y][i] == true) {
  //         colIsNull = true;
  //         break;
  //       }
  //     }
  //     outputDataCol1[i] = inputDataCol1[i];
  //     outputDataCol2[i] = inputDataCol2[i] * inputDataCol3[i];
  //     outputNullMap[0][i] = false;
  //     outputNullMap[1][i] = colIsNull;
  //   }
  // }

  // public static void multiplier() {
    
  //   int numRows = inputDataCol1.length;
  //   int numCols = inputNullMap.length;

  //   outputDataCol1 = new int[numRows];
  //   outputDataCol2 = new int[numRows];
    
  //   for(int i = 0; i < numRows; i++) {
  //      outputDataCol1[i] = inputDataCol1[i];
  //      outputDataCol2[i] = inputDataCol2[i] * inputDataCol3[i];

  //   }
    
  //   numberOfOutputCols = 2;
  //   outputNullMap = new boolean[numberOfOutputCols][numRows];

  // }


  // public static void multiplier2() {
    
  //   int numRows = inputDataCol1.length;
  //   int numCols = inputNullMap.length;

  //   List<Integer> rowId = new ArrayList<Integer>();
  //   List<Integer> result = new ArrayList<Integer>();

  //   Boolean colIsNull;
    
  //   for(int i = 0; i < numRows; i++) {
  //     colIsNull = false;
  //     for(int y = 0; y < numCols; y++) {
  //       if(inputNullMap[y][i] == true) {
  //         colIsNull = true;
  //         break;
  //       }
  //     }
  //     if(!colIsNull) {
  //       rowId.add(inputDataCol1[i]);
  //       result.add(inputDataCol2[i] * inputDataCol3[i]);
  //     }

  //   }


  //   int numOutRows = rowId.size();
  //   outputDataCol1 = new int[numOutRows];
  //   outputDataCol2 = new int[numOutRows];
    
  //   for(int i = 0; i < numOutRows; i++) {
  //     outputDataCol1[i] = rowId.get(i);
  //     outputDataCol2[i] = result.get(i);
  //   }


  //   numberOfOutputCols = 2;
  //   outputNullMap = new boolean[numberOfOutputCols][numOutRows];

  // }




  // public static void foo() {
    
  //   for(int x = 0; x < inputDataCol1.length; x++) {
  //   System.out.printf("%d\t\t%d\t\t%d\n", 
  //                       inputDataCol1[x],
  //                       inputDataCol2[x], 
  //                       inputDataCol3[x]);
  //   }
  // }

  // public static void bar() {
    
  //   int numRows = inputDataCol1.length;
  //   int numCols = inputNullMap.length;
  //   for(int x = 0; x < numRows; x++) {
  //     for(int y = 0; y < numCols; y++) {
  //       System.out.printf("Null map value at row: %d, column: %d, value: %b\n", 
  //                       x, y, inputNullMap[y][x]);  
  //     }
    
  //   }

}