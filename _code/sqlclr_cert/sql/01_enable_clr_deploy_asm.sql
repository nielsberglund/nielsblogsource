USE master;
GO

sp_configure 'clr enabled', 1;
RECONFIGURE
GO

DROP DATABASE IF EXISTS CertTest;
GO

CREATE DATABASE CertTest;
GO

USE CertTest;
GO

DROP ASSEMBLY IF EXISTS CertTest


CREATE ASSEMBLY CertTest
FROM 'W:\nielsb-work\GitHub-Repos\nielsberglund.com\_code\sqlclr_cert\cs\SqlClrCertTest\SqlClrCert\bin\Release\SqlClrCert.dll'
WITH PERMISSION_SET = UNSAFE;
GO

CREATE FUNCTION dbo.fn_clr_Adder(@x int, @y int)
RETURNS int
EXTERNAL NAME CertTest.[SqlClrCert.Functions].fn_clr_Adder

GO

DROP FUNCTION IF EXISTS dbo.fn_clr_Adder
DROP FUNCTION IF EXISTS dbo.fn_clr_LongRunningAdder
DROP ASSEMBLY IF EXISTS CertTest

CREATE FUNCTION dbo.fn_clr_LongRunningAdder(@x int, @y int)
RETURNS int
EXTERNAL NAME CertTest.[SqlClrCert.Functions].fn_clr_LongRunningAdder
WITH PERMISSION_SET = UNSAFE;
GO

SELECT dbo.fn_clr_Adder(21, 21);

SELECT dbo.fn_clr_LongRunningAdder(21, 21);

SELECT is_trustworthy_on FROM sys.databases

ALTER DATABASE CertTest SET TRUSTWORTHY OFF;

DROP FUNCTION IF EXISTS dbo.fn_clr_Adder;
DROP FUNCTION IF EXISTS dbo.fn_clr_LongRunningAdder;
DROP ASSEMBLY IF EXISTS CertTest;
GO

-- drop certificate NielsTestCert

CREATE CERTIFICATE NielsTestCert
FROM FILE = 'W:\nielsb-work\GitHub-Repos\nielsberglund.com\_code\sqlclr_cert\cert\NielsTestCert.cer';
GO


CREATE LOGIN login_NielsTestCert 
FROM CERTIFICATE NielsTestCert
GO

GRANT UNSAFE ASSEMBLY TO login_NielsTestCert;
GO

CREATE ASSEMBLY CertTest
FROM 'W:\nielsb-work\GitHub-Repos\nielsberglund.com\_code\sqlclr_cert\cs\SqlClrCertTest\SqlClrCert\bin\Release\SqlClrCert.dll'
WITH PERMISSION_SET = UNSAFE;
GO

CREATE ASYMMETRIC KEY NielsTestKey
FROM EXECUTABLE FILE = 'W:\nielsb-work\GitHub-Repos\nielsberglund.com\_code\sqlclr_cert\cs\SqlClrCertTest\SqlClrCert\bin\Release\SqlClrCert.dll'

CREATE LOGIN login_NielsTestKey 
FROM ASYMMETRIC KEY NielsTestKey
GO

SELECT * FROM sys.asymmetric_keys

DROP ASYMMETRIC KEY NielsTestKey

DROP LOGIN login_NielsTestKey

CREATE ASSEMBLY RabbitCertTest
FROM 'W:\nielsb-work\GitHub-Repos\nielsberglund.com\_code\sqlclr_cert\cert\RabbitMQ.Client.dll'
WITH PERMISSION_SET = UNSAFE;
GO 

CREATE ASSEMBLY ThreadingCertTest
FROM 'W:\nielsb-work\GitHub-Repos\nielsberglund.com\_code\sqlclr_cert\cert\System.Threading.dll'
WITH PERMISSION_SET = UNSAFE;
GO 