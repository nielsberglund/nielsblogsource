
DECLARE @inPut nvarchar(max) = (SELECT * FROM dbo.tb_irisdata_full FOR JSON PATH)

EXEC sp_execute_external_script
            @language = N'R'
          , @script = N'
                require(jsonlite)
                library(jsonlite)
                data <- fromJSON(inputTab1)
                df <- as.data.frame(data)
                meanFullSepWidth <- mean(df$SepalWidth)
                cat(paste("Seposa sepal mean width: ", meanFullSepWidth))'
          , @params = N'@inputTab1 nvarchar(max)'
          , @inputTab1 = @inPut

EXEC sp_execute_external_script
@language = N'Python'
, @script = N'
df = InputDataSet
fullMean = df.loc[:,"SepalWidth"].mean()'
, @input_data_1 = N'SELECT * FROM dbo.tb_irisdata_full' 
GO

DECLARE @inPut nvarchar(max) = (SELECT * FROM dbo.tb_irisdata_full FOR JSON PATH)

EXEC sp_execute_external_script
@language = N'Python'
, @script = N'
import pandas as pd
df =  pd.read_json(inputTab1)
fullMean = df.loc[:,"SepalWidth"].mean()'
, @params = N'@inputTab1 nvarchar(max)'
, @inputTab1 = @inPut


EXEC sp_execute_external_script
@language = N'R'
, @script = N'
 df <- InputDataSet
 nmbrRows <- nrow(df)
 cat(paste("Number rows @input_data_1: ", nmbrRows))'
, @input_data_1 = N'SELECT * FROM sys.columns' 
GO

EXEC sp_execute_external_script
@language = N'Python'
, @script = N'
pd = InputDataSet
nmbrRows = len(pd.index)
print("Number rows @input_data_1: ", nmbrRows)'
, @input_data_1 = N'SELECT * FROM sys.columns' 
GO

SELECT name, object_id, schema_id 
FROM sys.tables
FOR JSON AUTO

DECLARE @sysTabs nvarchar(max) = (SELECT * FROM sys.tables FOR JSON AUTO);
DECLARE @sysDbs nvarchar(max) = (SELECT * FROM sys.databases FOR JSON AUTO);
EXEC sp_execute_external_script
@language = N'R'
, @script = N'
 df <- InputDataSet
 nmbrRows <- nrow(df)
 cat(paste("Number rows @input_data_1: ", nmbrRows))'
, @input_data_1 = N'SELECT * FROM sys.columns'
, @params = N'@sysTables nvarchar(max), @sysDatabases nvarchar(max)'
, @sysTables = @sysTabs
, @sysDatabases = @sysDbs;
GO

DECLARE @sysTabs nvarchar(max) = (SELECT * FROM sys.tables FOR JSON AUTO);
DECLARE @sysDbs nvarchar(max) = (SELECT * FROM sys.databases FOR JSON AUTO);
EXEC sp_execute_external_script
@language = N'Python'
, @script = N'
import pandas as pd

df= InputDataSet
sysTab = pd.read_json(sysTables)
sysDb = pd.read_json(sysDatabases)
print("Number rows @input_data_1: ", len(df.index))
print("Number rows @sysTables: ", len(sysTab.index))
print("Number rows @sysDatabases: ", len(sysDb.index))'
, @input_data_1 = N'SELECT * FROM sys.columns'
, @params = N'@sysTables nvarchar(max), @sysDatabases nvarchar(max)'
, @sysTables = @sysTabs
, @sysDatabases = @sysDbs;
GO

SELECT name, database_id, source_database_id FROM sys.databases

DECLARE @sysTabs nvarchar(max) = (SELECT * FROM sys.tables FOR JSON AUTO);
DECLARE @sysDbs nvarchar(max) = (SELECT * FROM sys.databases FOR JSON AUTO);
EXEC sp_execute_external_script
  @language = N'R'
, @script = N'
    require(jsonlite)
    library(jsonlite)

    df <- InputDataSet
    sysTab <- as.data.frame(fromJSON(sysTables))
    sysDb <- as.data.frame(fromJSON(sysDatabases))

    cat(paste("Number rows @input_data_1: ", nrow(df)))
    cat(paste("\nNumber rows @sysTables: ", nrow(sysTab)))
    cat(paste("\nNumber rows @sysDatabases: ", nrow(sysDb)))'
, @input_data_1 = N'SELECT * FROM sys.columns'
, @params = N'@sysTables nvarchar(max), @sysDatabases nvarchar(max)'
, @sysTables = @sysTabs
, @sysDatabases = @sysDbs;




DECLARE @q1 nvarchar(max) = 'SELECT * FROM sys.tables FOR JSON AUTO'
GO
ALTER PROCEDURE dbo.pr_SerializeHelperR @query nvarchar(max)
                                        , @serializedResult varbinary(max) OUT
AS

EXEC sp_execute_external_script
  @language = N'R'
, @script = N'
  serRes <- serialize(InputDataSet, NULL)'
, @input_data_1 = @query
, @params = N'@serRes varbinary(max) OUT'  
, @serRes = @serializedResult OUT;

GO

DECLARE @res varbinary(max);
DECLARE @q1 nvarchar(max) = 'SELECT * FROM sys.tables'

EXEC dbo.pr_SerializeHelperR @query = @q1
                             , @serializedResult = @res OUT

SELECT @res                             
GO
DECLARE @res varbinary(max);
DECLARE @q1 nvarchar(max) = 'SELECT name, object_id, schema_id FROM sys.tables'
EXEC sp_execute_external_script
  @language = N'Python'
, @script = N'
import pickle as p
serRes = p.dumps(InputDataSet)'
, @input_data_1 = @q1
, @params = N'@serRes varbinary(max) OUT'  
, @serRes = @res OUT;
SELECT @res

EXEC sp_execute_external_script
  @language = N'Python'
, @script = N'
import pickle as p
import pandas as pd
df = p.loads(serRes)
print("Number of rows: ",len(df.index)) '
, @params = N'@serRes varbinary(max)'  
, @serRes = @res;

GO

--DROP PROCEDURE dbo.pr_SerializationHelperPy
CREATE PROCEDURE dbo.pr_SerializeHelperPy  @query nvarchar(max)
                                             , @serializedResult varbinary(max) OUT
AS

EXEC sp_execute_external_script
  @language = N'Python'
, @script = N'
import pickle as p 
serRes = p.dumps(InputDataSet)'
, @input_data_1 = @query
, @params = N'@serRes varbinary(max) OUT'  
, @serRes = @serializedResult OUT;
GO

-- declare the variables for queries as well 
--as serialized binary representation
DECLARE @sysTabs nvarchar(max) = 'SELECT name, object_id, schema_id FROM sys.tables';
DECLARE @sysDbs nvarchar(max) = 'SELECT name, database_id, source_database_id FROM sys.databases';
DECLARE @sysTabsBin varbinary(max);
DECLARE @sysDbsBin varbinary(max);

-- get the serialized result of @sysTabs
EXEC dbo.pr_SerializeHelperPy   @query = @sysTabs
                              , @serializedResult = @sysTabsBin OUT

-- get the serialized result of @sysDbs
EXEC dbo.pr_SerializeHelperPy   @query = @sysDbs
                              , @serializedResult = @sysDbsBin OUT

-- do the "real" stuff
EXEC sp_execute_external_script
@language = N'Python'
, @script = N'
import pandas as pd
import pickle as p 

df= InputDataSet
sysTab = p.loads(sysTables)
sysDb = p.loads(sysDatabases)
print("Number rows @input_data_1: ", len(df.index))
print("Number rows @sysTables: ", len(sysTab.index))
print("Number rows @sysDatabases: ", len(sysDb.index))'
, @input_data_1 = N'SELECT * FROM sys.columns'
, @params = N'@sysTables varbinary(max), @sysDatabases varbinary(max)'
, @sysTables = @sysTabsBin
, @sysDatabases = @sysDbsBin;



EXEC sp_execute_external_script
  @language = N'Python'
, @script = N'
import pickle as p
import pandas as pd
df = p.loads(serRes)
print("Number of rows: ",len(df.index)) '
, @params = N'@serRes varbinary(max)'  
, @serRes = @res;
GO

-- declare the variables for the querie as well 
-- as serialized binary representation
DECLARE @sysTabs nvarchar(max) = 'SELECT name, object_id, schema_id FROM sys.tables';
DECLARE @sysTabsBin varbinary(max);

-- get the serialized result of @sysTabs
EXEC dbo.pr_SerializeHelperR   @query = @sysTabs
                              , @serializedResult = @sysTabsBin OUT

-- do the "real" stuff
EXEC sp_execute_external_script
@language = N'R'
, @script = N'

sysTab = unserialize(sysTables)
cat(paste("Number rows @sysTables: ", nrow(sysTab)))'
, @input_data_1 = N'SELECT * FROM sys.columns'
, @params = N'@sysTables varbinary(max)'
, @sysTables = @sysTabsBin;
GO

DROP DATABASE IF EXISTS MultiDataSetDB;
GO
CREATE DATABASE MultiDataSetDB;
GO

USE MultiDataSetDB
GO 

SET NOCOUNT ON;
GO

DROP TABLE IF EXISTS dbo.tb_Rand1M ;
CREATE TABLE dbo.tb_Rand1M
(
  RowID bigint identity,
  y int NOT NULL, 
  rand1 int NOT NULL, 
  rand2 int NOT NULL, 
  rand3 int NOT NULL, 
  rand4 int NOT NULL, 
  rand5 int NOT NULL,
  CONSTRAINT [pk_Rand1M] PRIMARY KEY (RowID)
)
GO
INSERT INTO dbo.tb_Rand1M(y, rand1, rand2, rand3, rand4, rand5)
SELECT TOP(1000000) CAST(ABS(CHECKSUM(NEWID())) % 14 AS INT) 
	, CAST(ABS(CHECKSUM(NEWID())) % 20 AS INT)
	, CAST(ABS(CHECKSUM(NEWID())) % 25 AS INT)
	, CAST(ABS(CHECKSUM(NEWID())) % 14 AS INT)
	, CAST(ABS(CHECKSUM(NEWID())) % 50 AS INT)
	, CAST(ABS(CHECKSUM(NEWID())) % 100 AS INT)
FROM sys.objects o1
CROSS JOIN sys.objects o2
CROSS JOIN sys.objects o3
CROSS JOIN sys.objects o4;
GO

SELECT COUNT(*) FROM dbo.tb_Rand1M
GO

DECLARE @start datetime2 = SYSUTCDATETIME();
DECLARE @rand1M nvarchar(max) = (SELECT TOP(10000) * FROM dbo.tb_Rand1M FOR JSON AUTO);
EXEC sp_execute_external_script
@language = N'Python'
, @script = N'
import pandas as pd

df = pd.read_json(randTab)
print("Number rows @randTab: ", len(df.index))'
, @params = N'@randTab nvarchar(max)'
, @randTab = @rand1M;
SELECT DATEDIFF(ms, @start, SYSUTCDATETIME()) AS JSONTime -- 6.8 secs, 
GO

-- declare the variables for queries as well 
--as serialized binary representation
DECLARE @start datetime2 = SYSUTCDATETIME();
DECLARE @rand1M nvarchar(max) = 'SELECT TOP(10000) FROM dbo.tb_Rand1M';
DECLARE @rand1MBin varbinary(max);
-- get the serialized result of @sysTabs
EXEC dbo.pr_SerializeHelperPy   @query = @rand1M
                              , @serializedResult = @rand1MBin OUT

-- do the "real" stuff
EXEC sp_execute_external_script
@language = N'Python'
, @script = N'
import pandas as pd
import pickle as p 

sysTab = p.loads(randTab)

print("Number rows @sysTables: ", len(sysTab.index))'
, @params = N'@randTab varbinary(max)'
, @randTab = @rand1MBin
SELECT DATEDIFF(ms, @start, SYSUTCDATETIME()) AS BinaryTime -- 6.8 secs,
GO



EXEC sp_execute_external_script
  @language = N'Python'
, @script = N'
import pickle as p
import pandas as pd
df = p.loads(serRes)
print("Number of rows: ",len(df.index)) '
, @params = N'@serRes varbinary(max)'  
, @serRes = @res;
GO



