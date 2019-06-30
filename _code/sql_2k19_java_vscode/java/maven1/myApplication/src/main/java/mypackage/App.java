package mypackage;

/**
 * Hello world!
 *
 */
public class App 
{
    public static short numberOfOutputCols;
    public static int x;
    public static int y;
  
    static public int[] outputDataCol1;
    static public boolean[][] outputNullMap;
    public static void main( String[] args )
    {
        x = 21;
        y = 21;
        myadder();
    }

    public static void myadder() {
        Calculator calc = new Calculator();
        int res = calc.adder(x, y);
        numberOfOutputCols = 1;
        outputDataCol1 = new int[1];
        outputDataCol1[0] = res;
        System.out.printf("The result of adding %d and %d = %d", x, y, res); 
        outputNullMap = new boolean[1][1];
    }
}
