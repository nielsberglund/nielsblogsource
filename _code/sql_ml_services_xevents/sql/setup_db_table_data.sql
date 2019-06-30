USE master;
GO

SET NOCOUNT ON;
GO


DROP DATABASE IF EXISTS XEvents;
GO

CREATE DATABASE XEvents;
GO

USE XEvents;
GO

DROP TABLE IF EXISTS dbo.tb_irisdata_full;
CREATE TABLE dbo.tb_irisdata_full 
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

/*
SELECT * FROM dbo.tb_irisdata_full
SELECT * FROM dbo.tb_Rand_3M
*/