

USE ErrTestDB;
GO

SET NOCOUNT ON;
GO

-- these statements require SQL 2016
DROP PROCEDURE IF EXISTS dbo.pr_1;
GO

CREATE PROCEDURE dbo.pr_1
AS

SET NOCOUNT ON;

SET XACT_ABORT ON;

BEGIN TRANSACTION

INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(1, 'Details for Order 1')

EXEC dbo.pr_2;
IF(@@ERROR <> 0)
BEGIN
  -- we have taken out the rollback as XACT_ABORT is ON
  -- however we still need to cleanup
  PRINT 'dbo.pr_1: We are handling an error, cleaning up'
  RETURN
END
PRINT 'Here we are doing something which 
      relies on the execution of dbo.pr_2 being successful'

COMMIT TRAN;
GO