SET NOCOUNT ON;
GO

DROP DATABASE IF EXISTS BxlTest;
GO
CREATE DATABASE BxlTest;
GO

USE BxlTest;
GO


DROP TABLE IF EXISTS dbo.tb_Test1
CREATE TABLE dbo.tb_Test1(ID int, col1 int, col2 bigint, col3 bigint)

DROP TABLE IF EXISTS dbo.tb_Test2
CREATE TABLE dbo.tb_Test2(ID int NOT NULL, col1 int NOT NULL, col2 bigint NOT NULL, col3 bigint NOT NULL)

INSERT INTO dbo.tb_Test1
VALUES (1, 5, 100, 10000000),
       (2, 6, 101, 10000001),
       (3, 7, 102, 10000002),
       (4, 8, 103, 10000003),
       (5, 9, 104, 10000004),
       (6, 10, 105, 10000005),
       (7, 11, 106, 10000006);

INSERT INTO dbo.tb_Test2
VALUES (1, 5, 100, 10000000),
       (2, 6, 101, 10000001),
       (3, 7, 102, 10000002),
       (4, 8, 103, 10000003),
       (5, 9, 104, 10000004),
       (6, 10, 105, 10000005),
       (7, 11, 106, 10000006);



exec sp_execute_external_script
    @language = N'R' ,
    @script = N'Sys.sleep(10) 
           d<-42'
  , @input_data_1 = N'
  SELECT TOP(1) col1 FROM dbo.tb_Test2'

  exec sp_execute_external_script
    @language = N'R' ,
    @script = N'Sys.sleep(10) 
           d<-42'
  , @input_data_1 = N'
  SELECT CAST(42 AS BIGINT)'