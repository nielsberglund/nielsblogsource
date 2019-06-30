

USE ErrTestDB;
GO

SET NOCOUNT ON;
GO
BEGIN
TRUNCATE TABLE dbo.tb_OrderDetail
BEGIN TRANSACTION
  INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
  VALUES(1, 'Details for Order 1')

  INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
  VALUES(5, 'Details for Invalid OrderID') -- this should cause a fk exception

  INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
  VALUES(3, 'Details for OrderID 3')

  COMMIT
END
GO
SELECT * FROM dbo.tb_OrderDetail --but we still have data, commit succeeded
GO

--TRUNCATE TABLE dbo.tb_OrderDetail

--pk exception
BEGIN

TRUNCATE TABLE dbo.tb_OrderDetail;

BEGIN TRANSACTION
  INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
  VALUES(1, 'Details for Order 1')

  INSERT INTO dbo.tb_Order(OrderID, OrderValue, OrderDetail)
  VALUES(1, 100, 'Order 1') -- this should cause a pk exception

  INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
  VALUES(3, 'Details for OrderID 3')

  COMMIT

SELECT * FROM dbo.tb_OrderDetail --but we still have data, commit succeeded
END
GO

--cast error
BEGIN
TRUNCATE TABLE dbo.tb_OrderDetail;
BEGIN TRANSACTION
  INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
  VALUES(1, 'Details for Order 1')

  DECLARE @n int
  SELECT @n = CONVERT(int,'ABC') -- some very benign data error here (example)
  IF(@@ERROR <> 0)
  BEGIN
    PRINT 'We are in catch-block, but we want to commit'
	COMMIT
  END
  
  INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
  VALUES(3, 'Details for OrderID 3')

  COMMIT
END
GO
SELECT * FROM dbo.tb_OrderDetail -- no data, the batch was terminated at the error
/*
Msg 529, Level 16, State 2, Line 59
Explicit conversion from data type uniqueidentifier to int is not allowed.

Msg 245, Level 16, State 1, Line 60
Conversion failed when converting the varchar value 'ABC' to data type int.
*/
GO

--ddl error
BEGIN

TRUNCATE TABLE dbo.tb_OrderDetail;

BEGIN TRANSACTION
  INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
  VALUES(1, 'Details for Order 1')

  ALTER TABLE dbo.tb_OrderDetail --trying to drop a non existent column
  DROP COlumn col1

  INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
  VALUES(3, 'Details for OrderID 3')

  COMMIT

SELECT * FROM dbo.tb_OrderDetail -- no data, the batch was terminated at the error
END
/*
Msg 4924, Level 16, State 1, Line 83
ALTER TABLE DROP COLUMN failed because column 'col1' does not exist in table 'tb_OrderDetail'.
*/
GO

BEGIN
TRUNCATE TABLE dbo.tb_OrderDetail
BEGIN TRANSACTION
  BEGIN TRY
    INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
    VALUES(1, 'Details for Order 1')

    INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
    VALUES(5, 'Details for Invalid OrderID') -- this should cause a fk exception

    INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
    VALUES(3, 'Details for OrderID 3')

    COMMIT
  END TRY
  BEGIN CATCH
    PRINT 'We are in catch-block, but we want to commit'
	COMMIT
  END CATCH

SELECT * FROM dbo.tb_OrderDetail --but we still have data, commit succeeded
END
GO

BEGIN
TRUNCATE TABLE dbo.tb_OrderDetail
BEGIN TRANSACTION
  BEGIN TRY
    INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
    VALUES(1, 'Details for Order 1')

    DECLARE @n int
    SELECT @n = CONVERT(int,'ABC') -- some very benign data error here (example)

    INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
    VALUES(3, 'Details for OrderID 3')

    COMMIT
  END TRY
  BEGIN CATCH
    PRINT 'We are in catch-block, but we want to commit'
	COMMIT
  END CATCH
END
GO
SELECT * FROM dbo.tb_OrderDetail --but we still have data, commit succeeded
GO

