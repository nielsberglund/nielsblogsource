public class NullStringValues {
  static public int[] inputDataCol1 = new int[1];
  static public String[] inputDataCol2 = new String[1];
  static public boolean[][] inputNullMap = new boolean[1][1];

  static public int[] outputDataCol1;
  static public String[] outputDataCol2;
  static public boolean[][] outputNullMap;
  
  static public short numberOfOutputCols;

  public static void bar() {
      
    int numRows = inputDataCol1.length;
    int numCols = inputNullMap.length;
    for(int x = 0; x < numRows; x++) {
      System.out.printf("RowID: %d\t, StringValue: %s\t, NullMapValueStringCol: %b\n", 
                        inputDataCol1[x],
                        inputDataCol2[x], 
                        inputNullMap[1][x]);

    }
  }

  public static void foo() {
  
    int numOutRows = 3;
    outputDataCol1 = new int[numOutRows];
    outputDataCol2 = new String[numOutRows];

    numberOfOutputCols = 2;
    
    outputNullMap = new boolean[numberOfOutputCols][numOutRows];

    for(int n = 0; n < numOutRows; n++) {
      outputDataCol1[n] = n+1;
      outputNullMap[0][n] = false;
      if(n == 1) {
        outputDataCol2[n] = "xxx";
        outputNullMap[1][n] = true;
      }
      else {
        outputDataCol2[n] = "Hello";
        outputNullMap[1][n] = false;
      }
      
    }
  }
}
