USE master;
GO

DROP DATABASE IF EXISTS DataScienceDB;
GO

IF EXISTS(SELECT 1 FROM sys.server_principals WHERE name = 'dane')
BEGIN
  DROP LOGIN dane;
END

CREATE LOGIN dane
WITH PASSWORD = 'password1234$';

IF EXISTS(SELECT 1 FROM sys.server_principals WHERE name = 'nielsb')
BEGIN
  DROP LOGIN nielsb;
END

CREATE LOGIN nielsb
WITH PASSWORD = 'password1234$';

IF EXISTS(SELECT 1 FROM sys.server_principals WHERE name = 'nielsb2')
BEGIN
  DROP LOGIN nielsb2;
END

CREATE LOGIN nielsb2
WITH PASSWORD = 'password1234$';

CREATE DATABASE DataScienceDB;
GO

USE DataScienceDB;
GO

CREATE USER dane
FROM LOGIN dane;

CREATE USER nielsb
FROM LOGIN nielsb;

ALTER ROLE db_owner
  ADD MEMBER nielsb;
GO

CREATE ROLE rpkgRole
AUTHORIZATION dbo;
GO

USE master;
GO

GRANT EXECUTE ON sp_execute_external_script TO public;
GO

USE DataScienceDB;
GO

GRANT EXECUTE ANY EXTERNAL SCRIPT TO dane;
GRANT EXECUTE ANY EXTERNAL SCRIPT TO nielsb;
GO

USE DataScienceDB;
GO
