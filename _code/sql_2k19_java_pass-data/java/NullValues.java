public class NullValues {
  static public int[] inputDataCol1 = new int[1];
  static public int[] inputDataCol2 = new int[1];
  static public String[] inputDataCol3 = new String[1];
  static public boolean[][] inputNullMap = new boolean[1][1];

  static public int[] outputDataCol1;
  static public int[] outputDataCol2;
  static public String[] outputDataCol3;
  static public boolean[][] outputNullMap;

  static public short numberOfOutputCols;

  public static void bar() {
    
    int numRows = inputDataCol1.length;
    numberOfOutputCols = 3;

    outputDataCol1 = new int[numRows];
    outputDataCol2 = new int[numRows];
    outputDataCol3 = new String[numRows];

    for(int x = 0; x < numRows; x++) {
      outputDataCol1[x] = inputDataCol1[x];
      outputDataCol2[x] = inputDataCol2[x];
      outputDataCol3[x] = inputDataCol3[x];
    }

    outputNullMap = new boolean[numberOfOutputCols][numRows];
    for (int i = 0; i < numberOfOutputCols; i++) {
      for (int j = 0; j < numRows; j++) {
        outputNullMap[i][j] = inputNullMap[i][j];
      }
    }        
  }

 public static void foo() {
    
    for(int x = 0; x < inputDataCol1.length; x++) {
      System.out.printf("Row %d:\t\t%d\t %d\t %s\n", x+1, 
                          inputDataCol1[x], 
                          inputDataCol2[x], 
                          inputDataCol3[x]);
    }
  }
}