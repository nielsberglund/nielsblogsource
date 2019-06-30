
EXECUTE AS USER = 'dane'

USE master;  
GRANT CONTROL SERVER TO nielsb; 
GO  


ALTER SERVER ROLE sysadmin
  ADD MEMBER nielsb;
GO
EXECUTE sp_execute_external_script @language = N'R',
@script = N'
  library("randomForest")
  data(iris)
  iris.rf <- randomForest(iris[,-5], iris[,5], prox=TRUE)
  cat(iris.rf)'

  EXECUTE sp_execute_external_script @language = N'R',
@script = N'
  library("MASS")'

  ALTER ROLE db_owner
  ADD MEMBER nielsb;
GO

EXECUTE AS USER = 'nielsb'

SELECT * FROM sys.database_principals

REVERT

GRANT CREATE EXTERNAL LIBRARY TO nielsb;

CREATE EXTERNAL LIBRARY randomForest
FROM (CONTENT = 'W:\randomForest_4.6-14.zip') 
WITH (LANGUAGE = 'R');  


DROP EXTERNAL LIBRARY randomForest


EXEC sp_execute_external_script 
                    @language = N'R', 
                    @script = N'library("randomForest")'



SELECT * FROM sys.external_libraries

SELECT * FROM sysusers


SELECT * FROM sys.external_library_files

data(iris)
iris.rf <- randomForest(iris[,-5], iris[,5], prox=TRUE)


SELECT * FROM sysobjects



EXEC sp_execute_external_script 
                    @language = N'R', 
                    @script = N'
                    OutputDataSet <- data.frame(
                    installed.packages()[,c("Package", "LibPath")]);'
WITH RESULT SETS ((Package nvarchar(255), LibPath nvarchar(2000)));

EXEC sp_execute_external_script 
                    @language = N'R', 
                    @script = N'library("randomForest")'


EXEC sp_execute_external_script 
                    @language = N'R', 
                    @script = N'
                    OutputDataSet <- data.frame(
                    installed.packages()[,c("Package", "Version", 
                                        "Depends", "License", 
                                        "Built", "LibPath")]);'
WITH RESULT SETS ((Package nvarchar(255), Version nvarchar(100), 
                   Depends nvarchar(4000), License nvarchar(1000), 
                   Built nvarchar(100), LibPath nvarchar(2000)));

DROP EXTERNAL LIBRARY myRf


EXEC sp_execute_external_script 
         @language = N'R',
         @script = N'
                library("abc.data")
                data(human)
                OutputDataSet <-  data.frame(stat.voight)'
WITH RESULT SETS(([pi] float, [TajD.m] float, [TajD.v] float ))


CREATE EXTERNAL LIBRARY abc
FROM (CONTENT = 'W:\minicran\miniCranAbc\bin\windows\contrib\3.3\abc_2.1.zip, W:\minicran\miniCranAbc\bin\windows\contrib\3.3\abc.data_1.0.zip' ) 
WITH (LANGUAGE = 'R');  

SELECT * FROM sys.external_libraries

65537

DROP EXTERNAL LIBRARY randomForest

DECLARE @content varbinary(max)
SELECT @content = content
FROM sys.external_library_files
PRINT @content


SELECT l.external_library_id, l.name, lf.content
FROM sys.external_libraries l
JOIN sys.external_library_files lf
  ON l.external_library_id = lf.external_library_id
WHERE l.name = 'randomForest' 



DECLARE @hexLit varbinary(max);

SELECT @hexLit = lf.content
FROM sys.external_libraries l
JOIN sys.external_library_files lf
  ON l.external_library_id = lf.external_library_id
WHERE l.name = 'randomForest' 

PRINT @hexLit;

SELECT DATALENGTH(content)
FROM sys.external_library_files


SELECT DB_ID()

DROP DATABASE DataScienceDBRemote;

CREATE DATABASE DataScienceDBRemote;

sp_who



KILL 57


DECLARE @hexLit varbinary(max);

SELECT @hexLit = lf.content
FROM sys.external_libraries l
JOIN sys.external_library_files lf
  ON l.external_library_id = lf.external_library_id
WHERE l.name = 'randomForest' 

DECLARE @hexLitString varchar(max) = (SELECT CONVERT(varchar(max), @hexLit, 1) )

SELECT @hexLitString AS [processing-instruction(x)] FOR XML PATH('')


DECLARE @b varbinary(max) = 0x21232F297A57A5A743894A0E4A801FC3
DECLARE @bs varchar(max);

SELECT @bs = CONVERT(varchar(max), @b, 1)

SELECT @bs



--DROP DATABASE DataScienceDB

SELECT @@SPID
