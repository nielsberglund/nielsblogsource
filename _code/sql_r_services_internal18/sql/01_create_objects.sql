

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

DROP TABLE IF EXISTS dbo.rand_1M
CREATE TABLE dbo.rand_1M(RowID bigint identity primary key, 
                          y int NOT NULL, rand1 int NOT NULL,
						  rand2 int NOT NULL, rand3 int NOT NULL, 
						  rand4 int NOT NULL, rand5 int NOT NULL);
GO

DROP TABLE IF EXISTS dbo.test1;
CREATE TABLE dbo.test1
(
  RowID int identity primary key, colint1 int NOT NULL,  colint2 int NULL, 
  colint3 int NULL, colvchar1 varchar(50) NOT NULL, colvchar2 varchar(50) NOT NULL,
  colvchar3 varchar(50) NOT NULL, colvchar4 varchar(50) NULL, 
);
GO

DROP TABLE IF EXISTS dbo.test2;
CREATE TABLE dbo.test2
(
  RowID int identity primary key, coltiny tinyint, colsmallint smallint,
  colint int, colbigint bigint, colfloat float, colfloatsmall float(10),
  colreal real, colmoney money,
  coldec decimal(4,2), coldec2 decimal(18, 10)
);
GO

DROP TABLE IF EXISTS dbo.test3;
CREATE TABLE dbo.test3
(
  RowID int identity primary key, coltiny tinyint NOT NULL, colsmallint smallint NOT NULL,
  colint int NOT NULL, colbigint bigint NOT NULL, colfloat float NOT NULL, colfloatsmall float(10) NOT NULL,
  colreal real NOT NULL, colmoney money NOT NULL,
  coldec decimal(4,2) NOT NULL, coldec2 decimal(18, 10) NOT NULL
);
GO

INSERT INTO dbo.test3
VALUES (1,1,1,1, 1, 1, 1, 1, 1, 1),
       (1,1, 1, 1, 100.56, 1.1, 1, 1234.1234, 10.15, 123456.7891234),
	   (1,1, 1, 1, 100.56, 1, 1, 1, 10.15, 1),
	   (1,1, 1, 1, 1, 1.1, 1, 1234.1234, 1, 123456.7891234)

INSERT INTO dbo.test2
VALUES (1,1,1,1, 1, 1, 1, 1, 1, 1),
       (1,1, 1, 1, 100.56, 1.1, 1, 1234.1234, 10.15, 123456.7891234),
	   (1,NULL, 1, NULL, 100.56, NULL, 1, NULL, 10.15, NULL),
	   (NULL,1, NULL, 1, NULL, 1.1, NULL, 1234.1234, NULL, 123456.7891234)

INSERT INTO dbo.test1
VALUES (1, 2, 5, 'A', 'B', 'C', 'D'),
       (3, 4, 6, 'E', 'F', 'G', 'H');
        

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

GO

/*

SELECT * FROM dbo.test1

SELECT * FROM dbo.test2

SELECT * FROM dbo.test3
SELECT * FROM dbo.rand_1M

*/