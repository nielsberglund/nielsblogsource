USE master;
GO
SET NOCOUNT ON;
GO
DROP DATABASE IF EXISTS JavaTestDB;
GO
CREATE DATABASE JavaTestDB;
GO
USE JavaTestDB;
GO

DROP TABLE IF EXISTS dbo.tb_Rand10
CREATE TABLE dbo.tb_Rand10(RowID int identity primary key, x int, y int);

INSERT INTO dbo.tb_Rand10(x, y)
SELECT TOP(10) CAST(ABS(CHECKSUM(NEWID())) % 14 AS int) 
  , CAST(ABS(CHECKSUM(NEWID())) % 20 AS int)
FROM sys.objects o1
CROSS JOIN sys.objects o2
GO

SELECT * FROM dbo.tb_Rand10
