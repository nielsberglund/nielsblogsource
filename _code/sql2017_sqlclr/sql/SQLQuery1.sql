
USE master;
GO

sp_configure 'clr enabled', 1
RECONFIGURE
GO

DROP DATABASE IF EXISTS SqlClrTest;
GO

CREATE DATABASE SqlClrTest;
GO

USE SqlClrTest;
GO

DROP ASSEMBLY Sql2k17SqlClr
DROP FUNCTION dbo.fn_clr_LongRunningAdder

CREATE ASSEMBLY Sql2k17SqlClr
FROM 'W:\nielsb-work\GitHub-Repos\nielsberglund.com\_code\sql2017_sqlclr\cs\Sql2k17SqlClr\Sql2k17SqlClr1\bin\Release\Sql2k17SqlClr1.dll'
WITH PERMISSION_SET = UNSAFE
GO

sp_configure 'show advanced options', 1


sp_configure 'clr strict security', 1
RECONFIGURE


CREATE FUNCTION dbo.fn_clr_LongRunningAdder(@x int, @y int)
RETURNS int
EXTERNAL NAME Sql2k17SqlClr.[Sql2k17SqlClr.Functions].fn_clr_LongRunningAdder
GO


SELECT dbo.fn_clr_LongRunningAdder(21, 21)


ALTER DATABASE SqlClrTest
SET TRUSTWORTHY OFF;


USE master;
GO
CREATE CERTIFICATE NielsTestCert
FROM FILE = 'W:\nielsb-work\GitHub-Repos\nielsberglund.com\_code\sql2017_sqlclr\cert\NielsTestCert.cer';
GO

CREATE LOGIN login_NielsTestCert 
FROM CERTIFICATE NielsTestCert
GO

GRANT UNSAFE ASSEMBLY TO login_NielsTestCert;
GO

CREATE FUNCTION dbo.fn_clr_Adder(@x int, @y int)
RETURNS int
EXTERNAL NAME Sql2k17SqlClr.[Sql2k17SqlClr.Functions].fn_clr_Adder
GO

SELECT dbo.fn_clr_Adder(21, 21)



-- W:\nielsb-work\GitHub-Repos\nielsberglund.com\_code\sql2017_sqlclr\cs\Sql2k17SqlClr\Sql2k17SqlClr2\bin\Release\Sql2k17SqlClr2.dll

CREATE ASSEMBLY Sql2k17SqlClr2
FROM 'W:\nielsb-work\GitHub-Repos\nielsberglund.com\_code\sql2017_sqlclr\cs\Sql2k17SqlClr\Sql2k17SqlClr2\bin\Release\Sql2k17SqlClr2.dll'
WITH PERMISSION_SET = SAFE
GO


CREATE ASSEMBLY Sql2k17SqlClr2
FROM 'W:\nielsb-work\GitHub-Repos\nielsberglund.com\_code\sql2017_sqlclr\cs\Sql2k17SqlClr\Sql2k17SqlClr2\bin\Release\Sql2k17SqlClr2.dll'
WITH PERMISSION_SET = UNSAFE
GO

CREATE FUNCTION dbo.fn_clr_LongRunningAdder(@x int, @y int)
RETURNS int
EXTERNAL NAME Sql2k17SqlClr2.[Sql2k17SqlClr.Functions].fn_clr_LongRunningAdder
GO

SELECT dbo.fn_clr_LongRunningAdder(21, 21);

DROP FUNCTION dbo.fn_clr_LongRunningAdder
DROP ASSEMBLY Sql2k17SqlClr2


W:\nielsb-work\GitHub-Repos\nielsberglund.com\_code\sql2017_sqlclr\cs\Sql2k17SqlClr\Sql2k17SqlClr3\bin\Release\Sql2k17SqlClr3.dll

CREATE ASSEMBLY Sql2k17SqlClr3
FROM 'W:\nielsb-work\GitHub-Repos\nielsberglund.com\_code\sql2017_sqlclr\cs\Sql2k17SqlClr\Sql2k17SqlClr3\bin\Release\Sql2k17SqlClr3.dll'
WITH PERMISSION_SET = UNSAFE
GO

CREATE FUNCTION dbo.fn_clr_Adder3(@x int, @y int)
RETURNS int
EXTERNAL NAME Sql2k17SqlClr3.[Sql2k17SqlClr3.Functions].fn_clr_Adder
GO

SELECT dbo.fn_clr_Adder3(21, 21)

DROP FUNCTION dbo.fn_clr_Adder3
DROP ASSEMBLY Sql2k17SqlClr3


