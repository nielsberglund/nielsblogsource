


USE ErrTestDB;
GO

SET NOCOUNT ON;
GO

BEGIN
TRUNCATE TABLE dbo.tb_OrderDetail
BEGIN TRANSACTION

  SELECT * FROM sys.dm_tran_session_transactions

  INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
  VALUES(1, 'Details for Order 1')

  INSERT INTO dbo.tb_Order(OrderID, OrderValue, OrderDetail)
  VALUES(1, 100, 'Order 1')

  SELECT * FROM dbo.tb_MyTable;
  IF(@@ERROR <> 0 )
  BEGIN
    PRINT 'In errorblock'
  END

  INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
  VALUES(3, 'Details for OrderID 3')

  PRINT 'About to commit'

  COMMIT
END
GO
SELECT * FROM dbo.tb_OrderDetail
SELECT * FROM sys.dm_tran_session_transactions
GO


BEGIN
TRUNCATE TABLE dbo.tb_OrderDetail
BEGIN TRANSACTION
  SELECT * FROM sys.dm_tran_session_transactions
  BEGIN TRY
    INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
    VALUES(1, 'Details for Order 1')
	  
    SELECT * FROM dbo.tb_MyTable;
  
    INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
    VALUES(3, 'Details for OrderID 3')
	
	COMMIT
  END TRY
  BEGIN CATCH
    PRINT 'In Catch Block'
  END CATCH

END
GO
SELECT * FROM dbo.tb_OrderDetail
SELECT * FROM sys.dm_tran_session_transactions
GO


--TRUNCATE TABLE dbo.tb_OrderDetail
--ROLLBACK

-- the DROP ... IF EXISTS only works on SQL SERVER 2016+
DROP PROCEDURE IF EXISTS dbo.pr_Caller
DROP PROCEDURE IF EXISTS dbo.pr_1;
DROP PROCEDURE IF EXISTS dbo.pr_2;
DROP PROCEDURE IF EXISTS dbo.pr_3;
GO

ALTER PROCEDURE dbo.pr_3
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(3, 'Details for OrderID 3')
END
GO

ALTER PROCEDURE dbo.pr_2
AS
BEGIN
SET NOCOUNT ON;
PRINT 'dbo.pr_2: Before Insert'

----this should just work
--INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
--VALUES(2, 'Details for OrderID 2');

-- this should cause a fk exception
INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(5, 'Details for Invalid OrderID');

---- invalid object name 
--SELECT * FROM dbo.tb_MyTable;

---- Conversion failure
--DECLARE @n int;
--SELECT @n = CONVERT(int,'ABC');

PRINT 'dbo.pr_2: Before EXEC dbo.pr_3'
EXEC dbo.pr_3
PRINT 'After execution'
END
GO

CREATE PROCEDURE dbo.pr_1
AS
BEGIN
SET NOCOUNT ON;
PRINT 'dbo.pr_1: Before Insert'
INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(1, 'Details for Order 1')
PRINT 'dbo.pr_1: Before EXEC dbo.pr_2'
EXEC dbo.pr_2;
END
GO

ALTER PROCEDURE dbo.pr_Caller
AS
BEGIN
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN TRY
  PRINT 'dbo.pr_Caller: Before Begin TX'
  BEGIN TRANSACTION
  PRINT 'dbo.pr_Caller: Before EXEC dbo.pr_1'
  EXEC dbo.pr_1;
  PRINT 'dbo.pr_Caller: Before Commit TX'
  COMMIT
END TRY
BEGIN CATCH
  DECLARE @state smallint = (SELECT XACT_STATE());
  PRINT 'In catch block and XACT_STATE = ' + CAST(@state as varchar(2));
  IF(@state = -1)
  BEGIN
    PRINT 'We are rolling back'
    ROLLBACK TRAN;
  END
  ELSE IF (@state = 1)
  BEGIN
    PRINT 'We are committing'
	COMMIT TRAN
  END
  ELSE
    PRINT 'No transaction available'
    
END CATCH
END
GO


TRUNCATE TABLE dbo.tb_OrderDetail;
GO
EXEC dbo.pr_Caller;
GO
SELECT * FROM dbo.tb_OrderDetail;
GO



SELECT * FROM sys.dm_tran_active_transactions

ROLLBACK
