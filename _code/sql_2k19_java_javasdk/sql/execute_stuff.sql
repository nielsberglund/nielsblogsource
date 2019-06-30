

CREATE EXTERNAL LIBRARY javaSDK 
FROM (CONTENT = 'W:\mssql-java-lang-extension.jar')
WITH (LANGUAGE = 'Java');
GO 

SELECT * FROM sys.external_libraries

CREATE EXTERNAL LIBRARY mySqlJar 
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

DROP EXTERNAL LIBRARY mySqlJar;
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