

USE master;
GO

SET NOCOUNT ON;
GO

DROP DATABASE IF EXISTS ResultData;
GO

CREATE DATABASE ResultData;
GO

USE ResultData;
GO

DROP TABLE IF EXISTS dbo.rand_50M

CREATE TABLE dbo.rand_50M(RowID bigint identity primary key, y int, 
                          rand1 int, rand2 int, rand3 int, rand4 int, 
                          rand5 int);


DROP TABLE IF EXISTS dbo.tb_Tab1;

CREATE TABLE dbo.tb_Tab1(RowID bigint identity primary key,
                         ColInt int NOT NULL,
						 ColIntN int NULL,
						 ColBigInt bigint NOT NULL,
						 ColBigIntN bigint NULL,
						 ColDec decimal(10, 6) NOT NULL,
						 ColDecN decimal(10, 6) NULL,
						 ColString varchar(50) NOT NULL,
						 ColStringN varchar(50) NULL,
						 ColNString nvarchar(50) NOT NULL,
						 ColNStringN nvarchar(50) NULL,
						 ColStringMax varchar(max) NOT NULL,
						 ColStringMaxN varchar(max) NULL);

					 
INSERT INTO dbo.tb_Tab1(ColInt, ColIntN, ColBigInt, ColBigIntN,  ColDec, ColDecN, ColString, ColStringN, ColNString, ColNStringN, ColStringMax, ColStringMaxN)
VALUES (41, 41, 3147483647, 3147483647, 134.56789, 134.56789, 'Hello 41', 'Hello 41', N'Hello 41', N'Hello 41', 
       CAST(REPLICATE(CAST('Loads of data ' as varchar(max)),1000) AS varchar(max)), 
	   CAST(REPLICATE(CAST('Loads of data ' as varchar(max)),1000) AS varchar(max))), 
       (42, NULL, 4147483647, NULL, 135.56789, NULL,  'Hello 42', NULL, N'Hello 42', NULL, 
	   CAST(REPLICATE(CAST('Loads of data ' as varchar(max)), 10000) AS varchar(max)), NULL);
	   
INSERT INTO dbo.rand_50M(y, rand1, rand2, rand3, rand4, rand5)
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

/*

SELECT * FROM dbo.tb_Tab1
SELECT * FROM dbo.rand_50M

*/