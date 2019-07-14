
USE GamePlayDB;
GO




-- DECLARE @userId int = 12345;
-- DECLARE @gameId int = 100025;
-- DECLARE @WagerAmount decimal(10, 2) = 25.00;
-- DECLARE @PayoutAmount decimal(10, 2) = 0;
-- DECLARE @eventTypeId int = 1500;
-- DECLARE @eventTime datetime2 = SYSUTCDATETIME()
-- DECLARE @msg nvarchar(max)

-- SET @msg = (SELECT @eventTypeId AS eventTypeId,
--        @userId AS userId,
--        @gameId AS gameId,
--        @WagerAmount AS wagerAmount,
--        @PayoutAmount AS payoutAmount,
--        @eventTime AS eventTime
-- FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)

-- SELECT @msg
-- GO

ALTER PROCEDURE dbo.pr_GenerateAndPublishWagerEvent @UserID INT,
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

     SELECT @msg;
  
  -- EXEC dbo.pr_PublishToKafka @EventID = 1500,
  --                            @PartitionValue = @UserID,
  --                            @EventMessage = @msg; 
END
GO

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



DECLARE @eventID int = 1500;
DECLARE @partVal nvarchar(50) = CAST(2345 AS nvarchar(50))

SELECT kc.BootstrapServers, @partVal, kes.Topic
FROM dbo.tb_KafkaCluster kc
JOIN dbo.tb_KafkaEventSubscriber kes
  ON kc.ClusterID = kes.ClusterID
WHERE kes.EventID =  @eventID
GO

DECLARE @eventID int = 1500;
DECLARE @partVal nvarchar(50) = CAST(2345 AS nvarchar(50));
DECLARE @EventMessage nvarchar(max) = 'Hello World';
EXEC sp_execute_external_script @language = N'R',
                                  @script = N'OutputDataSet <- InputDataSet',
                                  @input_data_1 = N'SELECT kc.BootstrapServers, @partVal, kes.Topic
                                                    FROM dbo.tb_KafkaCluster kc
                                                    JOIN dbo.tb_KafkaEventSubscriber kes
                                                      ON kc.ClusterID = kes.ClusterID
                                                    WHERE kes.EventID =  @eventID ',
                                  @params = N'@msg nvarchar(max), @eventID int, @partVal nvarchar(50)',
                                  @eventID = @EventID,
                                  @partVal = @partVal,
                                  @msg = @EventMessage;

DECLARE @eventID int = 1500;
DECLARE @partVal nvarchar(50) = CAST(2345 AS nvarchar(50));
DECLARE @EventMessage nvarchar(max) = 'Hello World';
EXEC sp_execute_external_script @language = N'R',
                                  @script = N'OutputDataSet <- InputDataSet',
                                  @input_data_1 = N'SELECT 42'                        




