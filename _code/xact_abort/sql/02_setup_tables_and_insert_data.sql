
USE ErrTestDB;
GO

SET NOCOUNT ON;
GO

DROP TABLE IF EXISTS dbo.tb_OrderDetail;

DROP TABLE IF EXISTS dbo.tb_Order;
GO

CREATE TABLE dbo.tb_Order(OrderID int
                          CONSTRAINT [pk_Order] PRIMARY KEY, 
                          OrderValue int,
						  OrderDetail nvarchar(10));
GO

CREATE TABLE dbo.tb_OrderDetail(OrderDetailID int identity
                                CONSTRAINT [pk_OrderDetail] PRIMARY KEY, 
                                OrderID int CONSTRAINT [fk_OrderDetail_OrderID] 
								FOREIGN KEY REFERENCES dbo.tb_Order(OrderID), 
								SomeDetail nvarchar(50));
GO

INSERT INTO dbo.tb_Order(OrderID, OrderValue, OrderDetail)
VALUES(1, 100, 'Order 1'), 
      (2, 200, 'Order 2'), 
	  (3, 350, 'Order 3');
GO


