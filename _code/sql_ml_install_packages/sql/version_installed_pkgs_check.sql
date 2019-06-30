
sp_configure 'external scripts enabled', 1
RECONFIGURE

EXECUTE sp_execute_external_script  
           @language = N'R'
         , @script = N'OutputDataSet <- data.frame(.libPaths());'
WITH RESULT SETS (([DefaultLibraryName] VARCHAR(MAX) NOT NULL));
GO


EXECUTE sp_execute_external_script  
           @language = N'R'
         , @script = N'path <- .libPaths()[1]
                       cat(path);'
GO


--C:/Program Files/Microsoft SQL Server/MSSQL14.INST2K17/R_SERVICES/library


EXEC sp_execute_external_script
                  @language = N'R' ,
                  @script = N'print(R.Version()$version)'

EXEC sp_execute_external_script
                  @language = N'R' ,
                  @script = N'print(Sys.getenv("PATH"))'

EXEC sp_execute_external_script
    @language = N'R'
    , @script = N'
    OutputDataSet <- data.frame(installed.packages()[,c("Package", "Version", "Depends", 
"License", "Built", "LibPath")]);'
WITH RESULT SETS ((Package nvarchar(255), Version nvarchar(100), 
                   Depends nvarchar(4000), License nvarchar(1000), 
                   Built nvarchar(100), LibPath nvarchar(2000)));

BoomSpikeSlab (>= 0.9.0), zoo, xts, Boom (>= 0.7), R(>= 3.3.1)


"C:\\Program Files\\Microsoft SQL Server\\MSSQL14.MSSQLSERVER\\MSSQL\\Binn;C:\\Program Files\\Microsoft MPI\\Bin\\;C:\\Windows\\system32;C:\\Windows;C:\\Windows\\System32\\Wbem;C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\;C:\\Program Files (x86)\\Microsoft SQL Server\\140\\Tools\\Binn\\;C:\\Program Files\\Microsoft SQL Server\\140\\Tools\\Binn\\;C:\\Program Files (x86)\\Microsoft SQL Server\\140\\DTS\\Binn\\;C:\\Program Files\\Microsoft SQL Server\\140\\DTS\\Binn\\;C:\\Program Files\\Microsoft SQL Server\\Client SDK\\ODBC\\130\\Tools\\Binn\\"





EXEC sp_execute_external_script
                  @language = N'R' ,
                  @script = N'library("bsts")'

EXEC sp_execute_external_script
                  @language = N'R' ,
                  @script = N'library("dplyr")'

EXEC sp_execute_external_script
                  @language = N'R' ,
                  @script = N'remove.packages("dplyr")'

DROP EXTERNAL LIBRARY dplyr2


SELECT * FROM sys.external_library_files

SELECT * FROM sys.external_libraries

SELECT * FROM sys.external_libraries


sp_helptext 'sys.external_libraries'

sp_helptext 'sys.external_library_files'


