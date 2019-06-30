using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;

namespace RPackageToBinary
{
  class Program
  {
    //CreateBinary(inPath, outPath);
    static void Main(string[] args)
    {
      if (args.Length == 1 && HelpRequired(args[0]) || args.Length != 3)
      {
        Usage();
      }
      else
      {
        var pktPath = args[0];
        var connString = args[2];
        var pktName = args[1];

        var pktBinary = ZipToByteArrayToHexViaSoapHexBinary(pktPath);
        CreatePackageInDb(connString, pktBinary, pktName);

      }
    }

    private static bool HelpRequired(string param)
    {
      return param == "-h" || param == "--help" || param == "/?";
    }


    static void Usage()
    {
      var s1 = "RPackageToBinary is an application converting an R packet to binary representation,\n";
      var s6 = "and it creates an R package in the database from the binary representation.\n\n";
      var s2 = "It takes three parameters:\n";
      var s3 = "\t* Path to the zip file for the package.\n";
      var s4 = "\t* Connection string to the database.\n";
      var s5 = "\t* Package name to install.\n";

      Console.WriteLine(string.Concat(s1, s6, s2, s3, s4, s5));
      Console.WriteLine("Press any key to exit the application.");
      Console.ReadLine();
    }
    
    static string ZipToByteArrayToHexViaSoapHexBinary(string inPath)
    {
      var data = File.ReadAllBytes(inPath);
      var soapHexBinary = new SoapHexBinary(data);
      return string.Concat("0x", soapHexBinary.ToString());
      
    }

    static void CreatePackageInDb(string connString, string data, string packageName)
    {

      using (var sqlConn = new SqlConnection(connString))
      {
        var sqlCmd = sqlConn.CreateCommand();
        var cmd = $"CREATE EXTERNAL LIBRARY {packageName} FROM (CONTENT = {data}) WITH (LANGUAGE = 'R');";
        sqlCmd.CommandText = cmd;
        sqlCmd.CommandType = CommandType.Text;
        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();
      }


    }
  }
}
