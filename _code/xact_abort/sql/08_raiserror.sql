USE ErrTestDB;
GO

SET NOCOUNT ON;
GO


DROP PROCEDURE IF EXISTS dbo.pr_3;
GO

CREATE PROCEDURE dbo.pr_3
AS

SET NOCOUNT ON;
PRINT 'dbo.pr_3: An error happened, we are raising';
RAISERROR('dbo.pr_3: Error in dbo.pr_3', 16, -1);
RETURN

GO