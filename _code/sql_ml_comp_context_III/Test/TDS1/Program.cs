using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TDS1
{
  class Program
  {
    private static string _connString = "Server=.;database=testParallel;uid=sa;pwd=sapwd";
    private static string _odbcConnStr = "Driver={SQL Server}; Server=.;Database=testParallel;Uid=sa; Pwd=sapwd;";

    static void Main(string[] args)
    {
      GetDataOdbc();
      Console.ReadLine();
    }
    static void GetDataOdbc()
    {
      int rows = 0;
      using (var conn = new OdbcConnection(_odbcConnStr))
      {
        var cmd = new OdbcCommand("SELECT TOP(1) y, rand1, rand2, rand3, rand4, rand5 FROM dbo.tb_Rand_50M'");
        cmd.Connection = conn;
        cmd.CommandType = CommandType.Text;

        conn.Open();

        var dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
          while (dr.Read())
          {
            rows += 1;
          }

          Console.WriteLine($"Rows read = {rows}");
        }
      }
    }

    static void GetData()
    {
      int rows = 0;
      using (var conn = new SqlConnection(_connString))
      {
        var cmd = new SqlCommand("SELECT TOP(1000) y, rand1, rand2, rand3, rand4, rand5 FROM dbo.tb_Rand_50M");
        cmd.Connection = conn;
        cmd.CommandType = CommandType.Text;

        conn.Open();

        var dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
          while (dr.Read())
          {
            rows += 1;
          }

          Console.WriteLine($"Rows read = {rows}");
        }


      }

    }

  }


}
