
USE master;
GO

DROP DATABASE IF EXISTS IrisTestDb;
CREATE DATABASE IrisTestDb;
GO

USE IrisTestDb;
GO

SET NOCOUNT ON;
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

/*
SELECT * FROM dbo.tb_irisdata_full
SELECT * FROM dbo.tb_irisdata_even
SELECT * FROM dbo.tb_irisdata_uneven
*/
