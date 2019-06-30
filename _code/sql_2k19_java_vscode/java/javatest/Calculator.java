public class Calculator {
  public static short numberOfOutputCols;
  public static int x;
  public static int y;

  static public int[] outputDataCol1;
  static public boolean[][] outputNullMap;

  public static void main(String[] args) {
      x = 21;
      y = 21;
      adder();
  }

  public static void adder() {
    numberOfOutputCols = 1;
    outputDataCol1 = new int[1];
    int res = x + y;
    outputDataCol1[0] = res;
    System.out.printf("The result of adding %d and %d = %d", x, y, res); 
    outputNullMap = new boolean[1][1];
  }
}