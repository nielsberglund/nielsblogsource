USE GamePlayDB
GO

DECLARE @evtTime datetime2 = SYSUTCDATETIME();

EXEC dbo.pr_LogWager  @UserID = 12345,
                      @GameID = 10025,
                      @WagerAmount = 40.00,
                      @PayoutAmount = 70.00,
                      @EventTime = @evtTime;

SELECT * FROM dbo.tb_GamePlay                      


dbo.pr_PublishToKafka @EventID = 1,
                      @PartitionValue = null,
                      @EventMessage = N'Hello World'


DECLARE @p1 int = 21;
DECLARE @p2 int = 11;
EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'sql.JavaTest1'
, @params = N'@x int, @y int'
, @x = @p1
, @y = @p2 
GO                      


dbo.pr_EmulateGamePlay @Loops = 5,
                      @MinDelay = 50,
                      @MaxDelay = 500;