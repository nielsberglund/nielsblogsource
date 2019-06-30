

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

DROP TABLE IF EXISTS dbo.rand_1M_N

CREATE TABLE dbo.rand_1M_N(RowID bigint identity primary key, 
                           y int, rand1 int, rand2 int, 
						   rand3 int, rand4 int, rand5 int);

DROP TABLE IF EXISTS dbo.rand_1M

CREATE TABLE dbo.rand_1M(RowID bigint identity primary key, 
                          y int NOT NULL, rand1 int NOT NULL,
						  rand2 int NOT NULL, rand3 int NOT NULL, 
						  rand4 int NOT NULL, rand5 int NOT NULL);


DROP TABLE IF EXISTS dbo.tb_Tab1;
CREATE TABLE dbo.tb_Tab1(RowID bigint identity primary key,
                         ColInt1 int NOT NULL,
						 ColInt2 int NOT NULL,
						 ColInt3 int NOT NULL,
						 ColIntN1 int NULL,
						 ColIntN2 int NULL,
						 ColIntN3 int NULL,
						 ColBigInt1 bigint NOT NULL,
						 ColBigInt2 bigint NOT NULL,
						 ColBigInt3 bigint NOT NULL,
						 ColBigIntN1 bigint NULL,
						 ColBigIntN2 bigint NULL,
						 ColBigIntN3 bigint NULL,
						 ColDec1 decimal(10, 6) NOT NULL,
						 ColDec2 decimal(10, 6) NOT NULL,
						 ColDec3 decimal(10, 6) NOT NULL,
						 ColDecN1 decimal(10, 6) NULL,
						 ColDecN2 decimal(10, 6) NULL,
						 ColDecN3 decimal(10, 6) NULL,
						 ColString1 varchar(50) NOT NULL,
						 ColString2 varchar(50) NOT NULL,
						 ColString3 varchar(50) NOT NULL,
						 ColStringN1 varchar(50) NULL,
						 ColStringN2 varchar(50) NULL,
						 ColStringN3 varchar(50) NULL,
						 ColNString1 nvarchar(50) NOT NULL,
						 ColNString2 nvarchar(50) NOT NULL,
						 ColNString3 nvarchar(50) NOT NULL,
						 ColNStringN1 nvarchar(50) NULL,
						 ColNStringN2 nvarchar(50) NULL,
						 ColNStringN3 nvarchar(50) NULL,
						 ColStringMax1 varchar(max) NOT NULL,
						 ColStringMax2 varchar(max) NOT NULL,
						 ColStringMax3 varchar(max) NOT NULL,
						 ColStringMax_S1 varchar(max) NOT NULL,
						 ColStringMax_S2 varchar(max) NOT NULL,
						 ColStringMax_S3 varchar(max) NOT NULL,
						 ColStringMaxN1 varchar(max) NULL,
						 ColStringMaxN2 varchar(max) NULL,
						 ColStringMaxN3 varchar(max) NULL);

DROP TABLE IF EXISTS dbo.tb_Test1;

CREATE TABLE dbo.tb_Test1
(
  RowID int identity primary key,
  rand1 varchar(4) NOT NULL,
  rand2 varchar(4) NOT NULL,
  rand3 varchar(4) NOT NULL,
  rand4 varchar(4) NULL,
  rand5 varchar(4) NULL
);


INSERT INTO dbo.tb_Test1
VALUES   ('size', 'size', 'size', 'size', 'size')
       , ('size', 'size', 'size', 'size', NULL)
       , ('size', 'size', 'size', NULL, NULL);

INSERT INTO dbo.tb_Tab1(ColInt1, ColInt2, ColInt3, 
                        ColIntN1, ColIntN2, ColIntN3, 
						ColBigInt1, ColBigInt2, ColBigInt3, 
						ColBigIntN1, ColBigIntN2, ColBigIntN3,
                        ColDec1, ColDec2, ColDec3, 
						ColDecN1, ColDecN2, ColDecN3, 
						ColString1, ColString2, ColString3,
						ColStringN1, ColStringN2, ColStringN3,
                        ColNString1, ColNString2, ColNString3,
						ColNStringN1, ColNStringN2, ColNStringN3,
						ColStringMax1, ColStringMax2, ColStringMax3,
						ColStringMax_S1, ColStringMax_S2, ColStringMax_S3,
						ColStringMaxN1, ColStringMaxN2, ColStringMaxN3)

VALUES (41, 42, 43, 
        41, 42, NULL,
		3147483647, 3147483647, 3147483647, 
		3147483647, NULL, 3147483647, 
		134.56789, 134.56789, 134.56789, 
		134.56789, NULL, 134.56789, 
		'Hello', 'Hello', 'Hello',
		'Hello', 'Hello', 'Hello',
		N'Hello',  N'Hello', N'Hello',
		N'Hello',  N'Hello', N'Hello',
       CAST(REPLICATE(CAST('Loads of data ' as varchar(max)),1000) AS varchar(max)), 
	   CAST(REPLICATE(CAST('Loads of data ' as varchar(max)),1000) AS varchar(max)),
	   CAST(REPLICATE(CAST('Loads of data ' as varchar(max)),1000) AS varchar(max)),
	   'Hello', 'Hello', 'Hello',
	   CAST(REPLICATE(CAST('Loads of data ' as varchar(max)),1000) AS varchar(max)), 
	   CAST(REPLICATE(CAST('Loads of data ' as varchar(max)),1000) AS varchar(max)),
	   CAST(REPLICATE(CAST('Loads of data ' as varchar(max)),1000) AS varchar(max))),
	   
	   (42, 43, 44, 
        42, 43, NULL,
		3147483648, 3147483648, 3147483648, 
		3147483648, NULL, 3147483648, 
		135.56789, 135.56789, 135.56789, 
		135.56789, NULL, 135.56789, 
		'Hello', 'Hello', 'Hello',
		'Hello', NULL, 'Hello',
		N'Hello',  N'Hello', N'Hello',
		N'Hello',  NULL, N'Hello',
		CAST(REPLICATE(CAST('Loads of data ' as varchar(max)),1000) AS varchar(max)), 
	    CAST(REPLICATE(CAST('Loads of data ' as varchar(max)),1000) AS varchar(max)),
	    CAST(REPLICATE(CAST('Loads of data ' as varchar(max)),1000) AS varchar(max)),
		'Hello', 'Hello', 'Hello',
		CAST(REPLICATE(CAST('Loads of data ' as varchar(max)),1000) AS varchar(max)), 
	    NULL,
	    CAST(REPLICATE(CAST('Loads of data ' as varchar(max)),1000) AS varchar(max))),

		(42, 43, 44, 
        42, 43, NULL,
		3147483648, 3147483648, 3147483648, 
		3147483648, NULL, 3147483648, 
		135.56789, 135.56789, 135.56789, 
		135.56789, NULL, 135.56789, 
		'Hello', 'Hello', 'Hello',
		'Hello', NULL, 'Hello',
		N'Hello',  N'Hello', N'Hello',
		N'Hello',  NULL, N'Hello',
		CAST(REPLICATE(CAST('Loads of data ' as varchar(max)),1000) AS varchar(max)), 
	    CAST(REPLICATE(CAST('Loads of data ' as varchar(max)),1000) AS varchar(max)),
	    CAST(REPLICATE(CAST('Loads of data ' as varchar(max)),1000) AS varchar(max)),
		'Hello', 'Hello', 'Hello',
		CAST(REPLICATE(CAST('Loads of data ' as varchar(max)),1000) AS varchar(max)), 
	    NULL,
	    CAST(REPLICATE(CAST('Loads of data ' as varchar(max)),1000) AS varchar(max))); 

   
INSERT INTO dbo.rand_1M(y, rand1, rand2, rand3, rand4, rand5)
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

INSERT INTO dbo.rand_1M_N(y, rand1, rand2, rand3, rand4, rand5)
SELECT y, rand1, rand2, rand3, rand4, rand5
FROM dbo.rand_1M;



GO

/*

SELECT * FROM dbo.tb_Tab1
SELECT * FROM dbo.rand_1M

SELECT * FROM dbo.rand_1M_N


*/