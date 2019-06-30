

USE ErrTestDB;
GO

SET NOCOUNT ON;
GO

-- these statements require SQL 2016
DROP PROCEDURE IF EXISTS dbo.pr_1;

DROP PROCEDURE IF EXISTS dbo.pr_2;

DROP PROCEDURE IF EXISTS dbo.pr_3;
GO

CREATE PROCEDURE dbo.pr_3
AS

SET NOCOUNT ON;

INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(5, 'Details for Invalid OrderID'); -- this should cause a fk exception
IF(@@ERROR <> 0)
BEGIN
  PRINT 'dbo.pr_3: We are handling an error, cleaning up, and raising'
  RAISERROR('dbo.pr_3: Error in dbo.pr_3', 16, -1);
  RETURN
END


GO

CREATE PROCEDURE dbo.pr_2
AS

SET NOCOUNT ON;

INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(3, 'Details for OrderID 3')

EXEC dbo.pr_3;
IF(@@ERROR <> 0)
BEGIN
  PRINT 'dbo.pr_2: We are handling an error, cleaning up, and raising'
  RAISERROR('dbo.pr_2: Error executing dbo.pr_3', 16, -1);
  RETURN
END

GO

CREATE PROCEDURE dbo.pr_1
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(1, 'Details for Order 1')

EXEC dbo.pr_2;
IF(@@ERROR <> 0)
BEGIN
  PRINT 'dbo.pr_1: We are handling an error, cleaning up, and rolling back'
  ROLLBACK TRAN;
  RETURN
END
PRINT 'Here we are doing something which 
      relies on the execution of dbo.pr_2 being successful'

COMMIT TRAN;
GO
