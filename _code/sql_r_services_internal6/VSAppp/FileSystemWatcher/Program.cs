using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FileSystemWatcher
{
  class Program
  {
    private static string extPath =
      @"C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\ExtensibilityData\MSSQLSERVER01";
    static void Main(string[] args)
    {
      //get the path if sent in, otherwise fall back to the constant above
      if (args.Length > 0)
      {
        extPath = args[0];
      }

      System.IO.FileSystemWatcher watcher = new System.IO.FileSystemWatcher
      {
        Path = extPath,
        NotifyFilter = NotifyFilters.LastAccess | NotifyFilters.LastWrite
                       | NotifyFilters.FileName | NotifyFilters.DirectoryName,
        IncludeSubdirectories = true
      };

      watcher.Changed += new FileSystemEventHandler(OnChanged);
      watcher.Created += new FileSystemEventHandler(OnChanged);
      watcher.Deleted += new FileSystemEventHandler(OnChanged);
      watcher.Renamed += new RenamedEventHandler(OnRenamed);

      // Begin watching.
      watcher.EnableRaisingEvents = true;

      // Wait for the user to quit the program.
      Console.WriteLine("Press \'q\' to quit the sample.");
      while (Console.Read() != 'q');
    }

    private static void OnChanged(object source, FileSystemEventArgs e)
    {
      // Specify what is done when a file is changed, created, or deleted.
      Console.WriteLine("File: " + e.FullPath + " " + e.ChangeType);
    }

    private static void OnRenamed(object source, RenamedEventArgs e)
    {
      // Specify what is done when a file is renamed.
      Console.WriteLine("File: {0} renamed to {1}", e.OldFullPath, e.FullPath);
    }
  }
}
