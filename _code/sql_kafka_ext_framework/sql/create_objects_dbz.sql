USE master;
GO

DROP DATABASE IF EXISTS GamePlayDB;
GO

CREATE DATABASE GamePlayDB;
GO

USE GamePlayDB;
GO

--drop table dbo.tb_GamePlay
CREATE TABLE dbo.tb_GamePlay
(
  RowID bigint identity PRIMARY KEY,
  UserID int NOT NULL,
  GameID int NOT NULL,
  WagerAmount bigint NOT NULL,
  PayoutAmount bigint NOT NULL,
  EventTime datetime2 NOT NULL
);
GO

CREATE TABLE dbo.tb_KafkaCluster
(
  ClusterID int,
  BootstrapServers nvarchar(4000) NOT NULL,
  [Description] nvarchar(4000) NOT NULL,
  CONSTRAINT [pk_KafkaCluster] PRIMARY KEY
  (ClusterID)
);
GO

CREATE TABLE dbo.tb_KafkaEventSubscriber
(
  SubscriberID int identity,
  EventID int NOT NULL,
  ClusterID int NOT NULL,
  Topic nvarchar(256) NOT NULL,
  CONSTRAINT [pk_KafkaEventSubscriber] PRIMARY KEY
  (EventID, ClusterID, Topic),
  CONSTRAINT [fk_KafkaEventSubscriber_ClusterID] FOREIGN KEY (ClusterID)
  REFERENCES dbo.tb_KafkaCluster(ClusterID)
);
GO

INSERT INTO dbo.tb_KafkaCluster(ClusterID, BootstrapServers, [Description])
VALUES(1, 'localhost:9092', 'First cluster');

INSERT INTO dbo.tb_KafkaEventSubscriber(EventID, ClusterID, Topic)
VALUES (1, 1, 'testTopic'),
       (1500, 1, 'wagers');
GO

/*
  SELECT * FROM dbo.tb_KafkaCluster
  SELECT * FROM dbo.tb_KafkaEventSubscriber

*/

CREATE PROCEDURE dbo.pr_PublishToKafka @EventID int,
                                       @PartitionValue nvarchar(50),
                                       @EventMessage nvarchar(max)
AS
BEGIN

  IF(@PartitionValue = '')
  BEGIN
    SET @PartitionValue = NULL
  END

  EXEC sp_execute_external_script @language = N'Java',
                                  @script = N'kafkapublish.SqlKafka',
                                  @input_data_1 = N'SELECT kc.BootstrapServers, @partVal, kes.Topic
                                                    FROM dbo.tb_KafkaCluster kc
                                                    JOIN dbo.tb_KafkaEventSubscriber kes
                                                      ON kc.ClusterID = kes.ClusterID
                                                    WHERE kes.EventID =  @eventID ',
                                  @params = N'@msg nvarchar(max), @eventID int, @partVal nvarchar(50)',
                                  @eventID = @EventID,
                                  @partVal = @PartitionValue,
                                  @msg = @EventMessage;
END
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

  EXEC dbo.pr_PublishToKafka @EventID = 1500,
                             @PartitionValue = @UserID,
                             @EventMessage = @msg; 
END
GO


CREATE PROCEDURE dbo.pr_LogWager @UserID INT,
                                 @GameID INT,
                                 @WagerAmount bigint,
                                 @PayoutAmount bigint,
                                 @EventTime datetime2
AS
BEGIN
  IF(@EventTime IS NULL)
  BEGIN
    SET @EventTime = SYSUTCDATETIME();
  END 

  BEGIN TRY
    BEGIN TRAN
      INSERT INTO dbo.tb_GamePlay(UserID, GameID, WagerAmount, PayoutAmount, EventTime)
      VALUES(@UserID, @GameID, @WagerAmount, @PayoutAmount, @EventTime);
      --do some more tx "stuff" here
    COMMIT TRAN

    -- EXEC dbo.pr_GenerateAndPublishWagerEvent @UserID = @UserID,
    --                                       @GameID = @GameID,
    --                                       @WagerAmount = @WagerAmount,
    --                                       @PayoutAmount = @PayoutAmount,
    --                                       @EventTime = @EventTime;

  END TRY
  BEGIN CATCH
    ROLLBACK TRAN;
  END CATCH

END  
GO

ALTER PROCEDURE dbo.pr_EmulateGamePlay @Loops int = 10,
                                        @MinDelay int = 50,
                                        @MaxDelay int = 500
AS
BEGIN                                        
  DECLARE @delay int;
  DECLARE @waitfor varchar(25);
  DECLARE @winMultiplier int;
  DECLARE @wager bigint;
  DECLARE @userId int;
  DECLARE @gameId int;
  DECLARE @payout bigint = 0;
  DECLARE @minUserId int = 100;
  DECLARE @maxUserId int = 125;
  DECLARE @minwager int = 250;
  DECLARE @maxwager int = 500000;
  DECLARE @minWinMult int = 1;
  DECLARE @maxWinMult int = 10;
  DECLARE @minGameId int = 1000;
  DECLARE @maxGameId int = 1050;
  DECLARE @minWinIndicator int = 1;
  DECLARE @maxWinIndicator int = 12;
  DECLARE @noLoops int = 0;
  DECLARE @eventTime datetime2;
  
  WHILE(@noLoops < @Loops)
  BEGIN

    SET @eventTime = SYSUTCDATETIME();
  -- get random values for delay between games, wager size, user id, game id,
  -- win multiplier
    SELECT @delay = @MinDelay + ROUND(RAND() * (@MaxDelay + 1 - @MinDelay), 0),
            @wager = (@minwager + ROUND(RAND() * (@maxwager + 1 - @minwager), 0)) / 100,
            @userId = @minUserId + ROUND(RAND() * (@maxUserId + 1 - @minUserId), 0),
            @gameId = @minGameId + ROUND(RAND() * (@maxGameId + 1 - @minGameId), 0),
            @winMultiplier = @minWinMult + ROUND(RAND() * (@maxWinMult + 1 - @minWinMult), 0)
    -- set up the waitfor variable
    SELECT @waitfor = FORMATMESSAGE('00:00:00.%i', @delay);
    --check if win
    IF(CAST((@minWinIndicator + ROUND(RAND() * (@maxWinIndicator + 1 - @minWinIndicator), 0)) AS int) % 3) = 0
    BEGIN
        SET @payout =   @wager * @winMultiplier;
    END

    EXEC dbo.pr_LogWager    @UserID = @userId,
                            @GameID = @gameId,
                            @WagerAmount = @wager,
                            @PayoutAmount = @payout,
                            @EventTime = @eventTime;
  
    SELECT @noLoops += 1, @delay = null, @wager = null, @userId = null, @gameId = null, @winMultiplier = null,  
         @waitfor = '', @payout = 0;

    WAITFOR DELAY @waitfor;

  END
END  
GO


-- EXECUTE dbo.pr_EmulateGamePlay @Loops = 3
-- TRUNCATE TABLE dbo.tb_GamePlay
--SELECT * FROM dbo.tb_GamePlay
