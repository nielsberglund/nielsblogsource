
using System.Threading;
using System.Threading.Tasks;

namespace Sql2k17SqlClr
{
  public class Functions
  {
    public static int fn_clr_Adder(int x, int y)
    {
      return x + y;
    }

    //public static int fn_clr_LongRunningAdder(int x, int y)
    //{

    //  var t = Task.Factory.StartNew(() => LongRunning(x, y));
    //  return t.Result;
    //}

    //static int LongRunning(int x, int y)
    //{
    //  var wait = (x + y) * 100;
    //  Thread.Sleep(wait);
    //  return x + y;

    //}
  }
}

