SELECT * FROM sys.external_languages;

CREATE EXTERNAL LANGUAGE Java
FROM
(CONTENT = N'/opt/mssql/java/jars/java-lang-extension-3.2-linux.tar.gz', FILE_NAME = 'javaextension.so', PLATFORM = LINUX);
GO

SELECT * FROM sys.external_languages;

CREATE EXTERNAL LIBRARY JavaSDK
FROM (CONTENT = N'/opt/mssql/java/jars/mssql-java-lang-extension.jar')
WITH( LANGUAGE = 'Java')


SELECT * FROM sys.external_libraries

CREATE EXTERNAL LIBRARY JavaTest 
FROM (CONTENT = N'/opt/mssql/java/jars/sql-1.0.jar')
WITH (LANGUAGE = 'Java');
GO

SELECT * FROM sys.external_libraries

DECLARE @p1 int = 21;
DECLARE @p2 int = 21;
EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'sql.JavaTest1'
, @params = N'@x int, @y int'
, @x = @p1
, @y = @p2   
GO


DROP EXTERNAL LANGUAGE Java

