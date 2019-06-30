

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
GO

CREATE PROCEDURE dbo.pr_2
AS

SET NOCOUNT ON;

INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(3, 'Details for OrderID 3')

EXEC dbo.pr_3;

GO

CREATE PROCEDURE dbo.pr_1
AS

SET NOCOUNT ON;

SET XACT_ABORT ON;
BEGIN TRANSACTION

INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(1, 'Details for Order 1')

EXEC dbo.pr_2;

COMMIT TRAN;


GO
