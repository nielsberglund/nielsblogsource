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

DROP TABLE IF EXISTS dbo.tb_Rand_3M
CREATE TABLE dbo.tb_Rand_3M
(
  RowID bigint identity,
  y int NOT NULL, 
  rand1 int NOT NULL, 
  rand2 int NOT NULL, 
  rand3 int NOT NULL, 
  rand4 int NOT NULL, 
  rand5 int NOT NULL,
  CONSTRAINT [pk_Rand_3M] PRIMARY KEY (RowID)

);

INSERT INTO dbo.tb_Rand_3M(y, rand1, rand2, rand3, rand4, rand5)
SELECT TOP(3000000) CAST(ABS(CHECKSUM(NEWID())) % 14 AS INT) 
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

DROP TABLE IF EXISTS dbo.tb_Rand_50M
CREATE TABLE dbo.tb_Rand_50M
(
  RowID bigint identity,
  y int NOT NULL, 
  rand1 int NOT NULL, 
  rand2 int NOT NULL, 
  rand3 int NOT NULL, 
  rand4 int NOT NULL, 
  rand5 int NOT NULL,
  CONSTRAINT [pk_Rand_50M] PRIMARY KEY (RowID)

);

INSERT INTO dbo.tb_Rand_50M(y, rand1, rand2, rand3, rand4, rand5)
SELECT TOP(50000000) CAST(ABS(CHECKSUM(NEWID())) % 14 AS INT) 
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