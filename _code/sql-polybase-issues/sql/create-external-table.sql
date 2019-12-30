USE MyTargetDB;
GO
SELECT @@SPID



CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'password1234$';
GO

CREATE DATABASE SCOPED CREDENTIAL [oracleCred]
WITH IDENTITY = N'sa', SECRET = N'sapwd';

CREATE EXTERNAL DATA SOURCE OraConnection
WITH 
( 
  LOCATION = 'sqlserver://localhost',
  CREDENTIAL = [oracleCred]
);

CREATE EXTERNAL TABLE [dbo].[emp_ora]
(
  [EMPNO] int NOT NULL,
  [ENAME] NVARCHAR(50),
  [JOB] NVARCHAR(50),
  [MGR] int,
  [HIREDATE] DATE,
  [SAL] int,
  [COMM] int,
  [DEPTNO] int
)
WITH (LOCATION = N'[MyOraSourceDB].[dbo].[emp]', 
      DATA_SOURCE = [OraConnection]);


SELECT * FROM dbo.emp_ora;

EXEC sp_spaceused 'dbo.emp_ora'


CREATE EXTERNAL FILE FORMAT csv_file
  WITH (
      FORMAT_TYPE = DELIMITEDTEXT,
      FORMAT_OPTIONS(
          FIELD_TERMINATOR = ',',
          STRING_DELIMITER = '"')
  );      



SELECT name, value, value_in_use, description 
FROM sys.configurations
WHERE NAME LIKE '%polybase%'


EXEC sp_configure 'polybase enabled', 1
RECONFIGURE WITH OVERRIDE;
