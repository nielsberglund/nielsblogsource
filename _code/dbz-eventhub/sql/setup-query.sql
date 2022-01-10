USE master;
GO

--  to start from scratch drop the database if exists
IF EXISTS(SELECT * FROM sys.databases WHERE name = 'DebeziumTest')
BEGIN
  ALTER DATABASE DebeziumTest
  SET SINGLE_USER
  WITH ROLLBACK IMMEDIATE;

  DROP DATABASE DebeziumTest;
END
GO

-- create the database
CREATE DATABASE DebeziumTest;
GO

USE DebeziumTest;
GO

-- this statement just if we don't want to drop the db, 
-- but still start over with the table
-- DROP TABLE dbo.tb_CDCTab1;

-- table which we later will CDC enable
CREATE TABLE dbo.tb_CDCTab1 (RowID int identity primary key,
                      Col1 int,
                      Col2 nvarchar(25));
GO


/*
EXECUTE sys.sp_cdc_disable_table   
      @source_schema = N'dbo',   
      @source_name = N'tb_CDCTab1',  
      @capture_instance = N'ALL';

EXEC sys.sp_cdc_disable_db;

TRUNCATE TABLE dbo.tb_CDCTab1

SELECT * FROM dbo.tb_CDCTab1

*/

USE DebeziumTest;
GO
-- before we enable CDC ensure the SQL Server Agent is started
EXEC sys.sp_cdc_enable_db;

EXEC sys.sp_cdc_enable_table @source_schema = N'dbo',
								               @source_name   = N'tb_CDCTab1',
								               @role_name = NULL,
								               @supports_net_changes = 0;

INSERT INTO dbo.tb_CDCTab1(Col1, Col2)
VALUES(6, 'Hello Number 6');

SELECT * FROM sys.tables

SELECT * FROM dbo.tb_CDCTab1


SELECT * FROM cdc.dbo_tb_CDCTab1_CT

UPDATE dbo.tb_CDCTab1
SET Col1 = 42
WHERE RowID = 2

DELETE dbo.tb_CDCTab1
WHERE RowID = 1
