public class Calculator {
  static public int[] inputDataCol1 = new int[1];
  static public int[] inputDataCol2 = new int[1];
  static public boolean[][] inputNullMap = new boolean[1][1];

  static public int[] outputDataCol1;
  static public boolean[][] outputNullMap;

  static public short numberOfOutputCols;

  public static void adder() {
    
    int x = inputDataCol1[0];
    int y = inputDataCol2[0];

    numberOfOutputCols = 1;

    outputDataCol1 = new int[1];
    outputDataCol1[0] = x + y;

    outputNullMap = new boolean[1][1];

  }

}