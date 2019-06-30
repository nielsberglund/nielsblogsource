
USE ErrTestDB;
GO

SET NOCOUNT ON;
GO

--drop existing procs
IF EXISTS(SELECT 1 FROM sys.procedures WHERE object_id = OBJECT_ID('dbo.pr_Caller'))
BEGIN
  DROP PROC dbo.pr_Caller;
END
GO

IF EXISTS(SELECT 1 FROM sys.procedures WHERE object_id = OBJECT_ID('dbo.pr_1'))
BEGIN
  DROP PROC dbo.pr_1;
END
GO

IF EXISTS(SELECT 1 FROM sys.procedures WHERE object_id = OBJECT_ID('dbo.pr_2'))
BEGIN
  DROP PROC dbo.pr_2;
END
GO

IF EXISTS(SELECT 1 FROM sys.procedures WHERE object_id = OBJECT_ID('dbo.pr_3'))
BEGIN
  DROP PROC dbo.pr_3;
END
GO
--end drop existing procs

--create procs
--create dbo.pr_3
CREATE PROC dbo.pr_3
AS

SET NOCOUNT ON;
DECLARE @err int;
PRINT 'dbo.pr_3: We are now about to do a division 0 error'
SELECT 1/0;
SELECT @err = @@ERROR;
IF(@err <> 0)
BEGIN
  --clean up and log etc.
  PRINT 'dbo.pr_3: We are cleaning up, rewinding, blah, blah'
  RAISERROR('dbo.pr_3: Something went wrong in dbo.pr_3', 16, -1)
  RETURN
END
GO --end dbo.pr_3

CREATE PROC dbo.pr_2
AS

SET NOCOUNT ON;
DECLARE @err int;
--do some stuff
--then call into dbo.pr_3
PRINT 'dbo.pr_2: We are now about to execute dbo.pr_3'
EXEC dbo.pr_3
SELECT @err = @@ERROR;
IF(@err <> 0)
BEGIN
  --clean up and log etc.
  PRINT 'dbo.pr_2: We are cleaning up, rewinding, blah, blah'
  RAISERROR('dbo.pr_2: Something went wrong when calling dbo.pr_3', 16, -1)
  RETURN
END
GO --end dbo.pr_2

CREATE PROC dbo.pr_1
AS

SET NOCOUNT ON;
DECLARE @err int;
--do some stuff
--then call into dbo.pr_2
PRINT 'dbo.pr_1: We are now about to execute dbo.pr_2'
EXEC dbo.pr_2
SELECT @err = @@ERROR;
IF(@err <> 0)
BEGIN
  --clean up and log etc.
  PRINT 'dbo.pr_1: We are cleaning up, rewinding, blah, blah'
  RAISERROR('dbo.pr_1: Something went wrong when calling dbo.pr_2', 16, -1)
  RETURN
END
GO --end dbo.pr_1

CREATE PROC dbo.pr_Caller
AS

SET NOCOUNT ON;
DECLARE @err int;
--do some stuff
--then call into dbo.pr_1
PRINT 'dbo.pr_Caller: We are now about to execute dbo.pr_1'
EXEC dbo.pr_1
SELECT @err = @@ERROR;
IF(@err <> 0)
BEGIN
  --clean up and log etc.
  PRINT 'dbo.pr_Caller: We are cleaning up, rewinding, blah, blah'
  RAISERROR('dbo.pr_Caller: Something went wrong when calling dbo.pr_1', 16, -1)
  RETURN
END
GO --end dbo.pr_Caller


--end create procs




