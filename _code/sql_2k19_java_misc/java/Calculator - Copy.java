public class Calculator {
  public static short numberOfOutputCols;
  public static int x;
  public static int y;

  public static void main(String[] args) {
    x = 21;
    y = 21;

    adder();
  }

  public static void adder() {
    System.out.printf("The result of adding %d and %d = %d", 
                        x, y, x + y);

  }
}