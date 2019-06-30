public class Calculator {
    public static short numberOfOutputCols;
    public static int x;
    public static int y;

    static public int[] outputDataCol1;
    static public boolean[][] outputNullMap;

    public static void adder() {
        numberOfOutputCols = 1;
        outputDataCol1 = new int[1];
        outputDataCol1[0] = x + y;
        outputNullMap = new boolean[1][1];
    }

}