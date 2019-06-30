
USE master;
GO

DROP DATABASE IF EXISTS IrisTestDb;
CREATE DATABASE IrisTestDb;

USE IrisTestDb;
GO

DROP TABLE IF EXISTS dbo.tb_irisdata_full;
CREATE TABLE dbo.tb_irisdata_full 
(
  RowID int identity primary key, SepalLength float not null, 
  SepalWidth float not null, PetalLength float not null, 
  PetalWidth float not null, Species varchar(100) null
);
GO

DROP TABLE IF EXISTS dbo.tb_irisdata_even;
CREATE TABLE dbo.tb_irisdata_even 
(
  RowID int identity primary key, SepalLength float not null, 
  SepalWidth float not null, PetalLength float not null, 
  PetalWidth float not null, Species varchar(100) null
);
GO

DROP TABLE IF EXISTS dbo.tb_irisdata_uneven;
CREATE TABLE dbo.tb_irisdata_uneven 
(
  RowID int identity primary key, SepalLength float not null, 
  SepalWidth float not null, PetalLength float not null, 
  PetalWidth float not null, Species varchar(100) null
);
GO

INSERT INTO dbo.tb_irisdata_full( SepalLength, SepalWidth, 
                                  PetalLength, PetalWidth, Species)
EXECUTE sp_execute_external_script
  @language = N'R'
  , @script = N'iris_data <- iris;'
  , @input_data_1 = N''
  , @output_data_1_name = N'iris_data';

--split up the Iris data
INSERT INTO dbo.tb_irisdata_even( SepalLength, SepalWidth, 
                                  PetalLength, PetalWidth, Species)
SELECT SepalLength, SepalWidth, PetalLength, PetalWidth, Species 
FROM dbo.tb_irisdata_full
WHERE RowID % 2 = 0

INSERT INTO dbo.tb_irisdata_uneven( SepalLength, SepalWidth, 
                                    PetalLength, PetalWidth, Species)
SELECT SepalLength, SepalWidth, PetalLength, PetalWidth, Species 
FROM dbo.tb_irisdata_full
WHERE RowID % 2 = 1

DROP TABLE IF EXISTS dbo.rand_10M
CREATE TABLE dbo.rand_10M(RowID bigint identity primary key, y int, 
                          rand1 int, rand2 int, rand3 int, rand4 int, 
                          rand5 int);

INSERT INTO dbo.rand_10M(y, rand1, rand2, rand3, rand4, rand5)
SELECT TOP(10000000) CAST(ABS(CHECKSUM(NEWID())) % 14 AS INT) 
  , CAST(ABS(CHECKSUM(NEWID())) % 20 AS INT)
  , CAST(ABS(CHECKSUM(NEWID())) % 25 AS INT)
  , CAST(ABS(CHECKSUM(NEWID())) % 14 AS INT)
  , CAST(ABS(CHECKSUM(NEWID())) % 50 AS INT)
  , CAST(ABS(CHECKSUM(NEWID())) % 100 AS INT)
FROM sys.objects o1
CROSS JOIN sys.objects o2
CROSS JOIN sys.objects o3
CROSS JOIN sys.objects o4;

/*
SELECT * FROM dbo.tb_irisdata_full
SELECT * FROM dbo.tb_irisdata_even
SELECT * FROM dbo.tb_irisdata_uneven
SELECT * FROM dbo.rand_10M
*/