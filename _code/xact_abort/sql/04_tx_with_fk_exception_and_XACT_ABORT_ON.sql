

USE ErrTestDB;
GO

SET NOCOUNT ON;
GO

TRUNCATE TABLE dbo.tb_OrderDetail

SET XACT_ABORT ON;
BEGIN
BEGIN TRANSACTION

  INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
  VALUES(1, 'Details for Order 1')

  INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
  VALUES(5, 'Details for Invalid OrderID') -- this should cause a fk exception
  
  INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
  VALUES(3, 'Details for OrderID 3')

  COMMIT

SELECT * FROM dbo.tb_OrderDetail
END
GO
