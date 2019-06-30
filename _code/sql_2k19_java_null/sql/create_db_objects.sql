USE master;
GO
SET NOCOUNT ON;
GO
DROP DATABASE IF EXISTS JavaNullDB;
GO
CREATE DATABASE JavaNullDB;
GO
USE JavaNullDB;
GO
DROP TABLE IF EXISTS dbo.tb_NullRand10
CREATE TABLE dbo.tb_NullRand10(RowID int identity primary key, 
                          x int, y int, col1 nvarchar(50));
GO
INSERT INTO dbo.tb_NullRand10(x, y, col1)
SELECT TOP(10) CAST(ABS(CHECKSUM(NEWID())) % 14 AS int) 
  , CAST(ABS(CHECKSUM(NEWID())) % 20 AS int)
  , N'Hello ' + CAST(CAST(ABS(CHECKSUM(NEWID())) % 25 AS int) AS nvarchar(25))
FROM sys.objects o1
CROSS JOIN sys.objects o2
CROSS JOIN sys.objects o3
CROSS JOIN sys.objects o4;
GO
UPDATE dbo.tb_NullRand10
  SET y = NULL
WHERE RowId = 3
UPDATE dbo.tb_NullRand10
  SET Col1 = NULL
WHERE RowId = 5    
UPDATE dbo.tb_NullRand10
  SET x = NULL
WHERE RowId = 6 
UPDATE dbo.tb_NullRand10
  SET y = NULL
WHERE RowId = 8  
UPDATE dbo.tb_NullRand10
  SET col1 = NULL
WHERE RowId = 9 
GO

SELECT * FROM dbo.tb_Rand10
SELECT * FROM dbo.tb_NullRand10
GO



