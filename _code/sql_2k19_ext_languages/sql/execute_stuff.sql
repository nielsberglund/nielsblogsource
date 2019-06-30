USE JavaTestDB;
GO

SELECT * FROM sys.external_languages
SELECT * FROM sys.external_language_files


SELECT * FROM sys.database_principals


CREATE EXTERNAL LANGUAGE Java
FROM (CONTENT = 'W:\javaextension.zip'
      , FILE_NAME = 'javaextension.dll');
GO

SELECT * FROM sys.external_languages
SELECT * FROM sys.external_language_files

-- DROP EXTERNAL LANGUAGE NielsIsAwesome
-- DROP EXTERNAL LANGUAGE Java
-- DROP EXTERNAL LIBRARY javaSDK

CREATE EXTERNAL LIBRARY javaSDK 
FROM (CONTENT = 'W:\mssql-java-lang-extension.jar')
WITH (LANGUAGE = 'Java');
GO 

SELECT * FROM sys.external_libraries

CREATE EXTERNAL LIBRARY mySqlJar2 
FROM (CONTENT = 'W:\sql-1.0.jar')
WITH (LANGUAGE = 'Java');
GO 

SELECT * FROM sys.external_libraries


DECLARE @p1 int = 21;
DECLARE @p2 int = 21;
EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'sql.JavaTest1'
, @params = N'@x int, @y int'
, @x = @p1
, @y = @p2   
GO


DROP EXTERNAL LIBRARY mySqlJar2;
GO

CREATE EXTERNAL LIBRARY mySqlJar 
FROM (CONTENT = 'W:\sql-1.0.jar')
WITH (LANGUAGE = 'Java');
GO 


SELECT * FROM dbo.tb_Rand10

EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'sql.JavaTest2'
, @input_data_1 = N'SELECT * FROM dbo.tb_Rand10'
WITH RESULT SETS ((RowID int, Result int));
GO

SELECT RowID, x, y, x + y FROM dbo.tb_Rand10



EXEC sp_execute_external_script @language = N'R',
                                @script = N'd<-42
                                             show(d)'

EXEC sp_execute_external_script  @language =N'R', 
                                 @script=N'OutputDataSet<-InputDataSet', 
                                 @input_data_1 =N'SELECT 42' 
      WITH RESULT SETS (([TheAnswer] int not null));                                               