
USE ErrTestDB;
GO

SET NOCOUNT ON;
GO

IF EXISTS(SELECT 1 FROM sys.procedures WHERE object_id = OBJECT_ID('dbo.pr_1'))
BEGIN
  DROP PROC dbo.pr_1;
END
GO


CREATE PROC dbo.pr_1
AS

SET NOCOUNT ON;
DECLARE @err int;
--add the new "cool" errorhandling
BEGIN TRY
--do some stuff
--do some other stuff
--then call into dbo.pr_2
PRINT 'dbo.pr_1: We are now about to execute dbo.pr_2'
EXEC dbo.pr_2
END TRY
BEGIN CATCH
  --clean up and log etc.
  PRINT 'dbo.pr_1: We are cleaning up, rewinding, blah, blah'
  RAISERROR('dbo.pr_1: Something went wrong when calling dbo.pr_2', 16, -1)
END CATCH
GO --end dbo.pr_1