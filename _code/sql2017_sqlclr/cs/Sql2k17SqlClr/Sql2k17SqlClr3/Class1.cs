namespace Sql2k17SqlClr3
{
  public class Functions
  {
    public static int fn_clr_Adder(int x, int y)
    {
      return Sql2k17SqlClr.Functions.fn_clr_LongRunningAdder(x, y);
    }
  }
}
