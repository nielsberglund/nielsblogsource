USE master;
GO

SET NOCOUNT ON;
GO

DROP DATABASE IF EXISTS JavaTest;
GO

CREATE DATABASE JavaTest;
GO

USE JavaTest;
GO

DROP TABLE IF EXISTS dbo.tb_Rand100
CREATE TABLE dbo.tb_Rand100(RowID int identity primary key, y int, 
                          rand1 int, rand2 int);
GO                          

DROP TABLE IF EXISTS dbo.tb_Nullable
CREATE TABLE dbo.tb_Nullable(RowID int identity primary key,
                            Col1 int,
                            Col2 int,
                            Col3 nvarchar(50));
GO                                                      

INSERT INTO dbo.tb_Rand100(y, rand1, rand2)
SELECT TOP(100) CAST(ABS(CHECKSUM(NEWID())) % 14 AS int) 
  , CAST(ABS(CHECKSUM(NEWID())) % 20 AS int)
  , CAST(ABS(CHECKSUM(NEWID())) % 25 AS int)
FROM sys.objects o1
CROSS JOIN sys.objects o2
CROSS JOIN sys.objects o3
CROSS JOIN sys.objects o4;
GO

INSERT INTO dbo.tb_Nullable (Col1, Col2, Col3)
VALUES   (1, 2, 'Hello 1 & 2')
       , (2, NULL, 'Hello 2 & NULL')
       , (3, 4, NULL)
       , (null, 5, 'Hello NULL & 5')
GO





SELECT* FROM dbo.tb_Rand100