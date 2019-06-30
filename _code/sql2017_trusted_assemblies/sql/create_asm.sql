

USE TrustedAsmDB;
GO

CREATE ASSEMBLY Sql2k17TrustedAsm
FROM 'W:\nielsb-work\GitHub-Repos\nielsberglund.com\_code\sql2017_trusted_assemblies\cs\Sql2k17TrustedAsm\Sql2k17TrustedAsm1\bin\Release\Sql2k17TrustedAsm1.dll'
GO

SELECT * FROM sys.assemblies
GO

CREATE FUNCTION dbo.fn_clr_Adder(@x int, @y int)
RETURNS int
EXTERNAL NAME Sql2k17TrustedAsm.[Sql2k17TrustedAsm1.Functions].fn_clr_Adder
GO

SELECT dbo.fn_clr_Adder(21, 21)
GO

CREATE FUNCTION dbo.fn_clr_LongRunningAdder(@x int, @y int)
RETURNS int
EXTERNAL NAME Sql2k17TrustedAsm.[Sql2k17TrustedAsm1.Functions].fn_clr_LongRunningAdder
GO

SELECT dbo.fn_clr_LongRunningAdder(21, 21);
GO


DROP FUNCTION IF EXISTS dbo.fn_clr_Adder;
DROP FUNCTION IF EXISTS dbo.fn_clr_LongRunningAdder;
DROP ASSEMBLY IF EXISTS Sql2k17TrustedAsm;
GO

CREATE ASSEMBLY Sql2k17TrustedAsm
FROM 'W:\nielsb-work\GitHub-Repos\nielsberglund.com\_code\sql2017_trusted_assemblies\cs\Sql2k17TrustedAsm\Sql2k17TrustedAsm1\bin\Release\Sql2k17TrustedAsm1.dll'
WITH PERMISSION_SET = UNSAFE;
GO






CREATE DATABASE TrustedAsmDB2
GO

USE TrustedAsmDB2;
GO

CREATE ASSEMBLY Sql2k17TrustedAsm
FROM 'W:\nielsb-work\GitHub-Repos\nielsberglund.com\_code\sql2017_trusted_assemblies\cs\Sql2k17TrustedAsm\Sql2k17TrustedAsm1\bin\Release\Sql2k17TrustedAsm1.dll'
GO