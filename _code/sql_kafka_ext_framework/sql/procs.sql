




DECLARE @userId int = 12345;
DECLARE @gameId int = 100025;
DECLARE @WagerAmount decimal(10, 2) = 25.00;
DECLARE @PayoutAmount decimal(10, 2) = 0;
DECLARE @eventTypeId int = 1500;
DECLARE @eventTime datetime2 = SYSUTCDATETIME()
DECLARE @msg nvarchar(max)

SET @msg = (SELECT @eventTypeId AS eventTypeId,
       @userId AS userId,
       @gameId AS gameId,
       @WagerAmount AS wagerAmount,
       @PayoutAmount AS payoutAmount,
       @eventTime AS eventTime
FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)

SELECT @msg
GO

CREATE PROCEDURE dbo.pr_GenerateAndPublishWagerEvent @UserID INT,
                                          @GameID INT,
                                          @WagerAmount decimal(10, 2),
                                          @PayoutAmount decimal(10, 2),
                                          @EventTime datetime2
AS
BEGIN
  DECLARE @msg nvarchar(max);

  --generate the event
  SET @msg =  (SELECT 1500 AS eventTypeId,
                 @UserId AS userId,
                 @GameId AS gameId,
                 @WagerAmount AS wagerAmount,
                 @PayoutAmount AS payoutAmount,
                 @EventTime AS eventTime
     FOR JSON PATH, WITHOUT_ARRAY_WRAPPER);
  -- call "something" to publish to Kafka
END








