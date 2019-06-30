USE master;
GO

SET NOCOUNT ON;
GO

DROP DATABASE IF EXISTS TestParallel;
GO

CREATE DATABASE TestParallel;
GO

USE TestParallel;
GO

DROP TABLE IF EXISTS dbo.rand_1M
CREATE TABLE dbo.rand_1M(RowID bigint identity primary key, y bigint, 
                          rand1 bigint, rand2 bigint, rand3 bigint, rand4 bigint, 
                          rand5 bigint);

INSERT INTO dbo.rand_1M(y, rand1, rand2, rand3, rand4, rand5)
SELECT TOP(1000000) CAST(ABS(CHECKSUM(NEWID())) % 14 AS bigint) 
  , CAST(ABS(CHECKSUM(NEWID())) % 20 AS bigint)
  , CAST(ABS(CHECKSUM(NEWID())) % 25 AS bigint)
  , CAST(ABS(CHECKSUM(NEWID())) % 14 AS bigint)
  , CAST(ABS(CHECKSUM(NEWID())) % 50 AS bigint)
  , CAST(ABS(CHECKSUM(NEWID())) % 100 AS bigint)
FROM sys.objects o1
CROSS JOIN sys.objects o2
CROSS JOIN sys.objects o3
CROSS JOIN sys.objects o4;
GO



SELECT * FROM dbo.rand_1M