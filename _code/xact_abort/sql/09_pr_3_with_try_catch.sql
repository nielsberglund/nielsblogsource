
USE ErrTestDB;
GO

SET NOCOUNT ON;
GO


DROP PROCEDURE IF EXISTS dbo.pr_3;
GO

CREATE PROCEDURE dbo.pr_3
AS

SET NOCOUNT ON;
BEGIN TRY
INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(5, 'Details for Invalid OrderID'); -- this should cause a fk exception
END TRY
BEGIN CATCH
  PRINT 'dbo.pr_3: We are handling an error, cleaning up, and raising'
  RAISERROR('dbo.pr_3: Error in dbo.pr_3', 16, -1);
  RETURN
END CATCH
GO