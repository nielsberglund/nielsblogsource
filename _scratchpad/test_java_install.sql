USE master;
GO

EXEC sp_configure 'external scripts enabled', 1
RECONFIGURE WITH OVERRIDE;

DROP DATABASE IF EXISTS JavaTest;
GO

CREATE DATABASE JavaTest;
GO

USE JavaTest
GO

CREATE EXTERNAL LANGUAGE Java
FROM (CONTENT = 'W:\java-lang-extension-3.2.zip', FILE_NAME = 'javaextension.dll');
GO

SELECT * FROM sys.external_languages

CREATE EXTERNAL LIBRARY javaSDK 
FROM (CONTENT = 'W:\mssql-java-lang-extension-3.2.jar')
WITH (LANGUAGE = 'Java');
GO 

SELECT * FROM sys.external_libraries

CREATE EXTERNAL LIBRARY javaTest
FROM (CONTENT = 'W:\sql-1.0.jar')
WITH (LANGUAGE = 'Java');

SELECT * FROM sys.external_libraries

-- test that it works
DECLARE @p1 int = 21;
DECLARE @p2 int = 21;
EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'sql.JavaTest1'
, @params = N'@x int, @y int'
, @x = @p1
, @y = @p2 
GO 


