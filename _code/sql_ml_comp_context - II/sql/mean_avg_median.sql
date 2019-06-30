

DECLARE @start datetime2 = SYSUTCDATETIME()
EXEC sp_execute_external_script
      @language = N'R'
    , @script = N'
      pid <- Sys.getpid()
        # set up the connection string
      sqlServerConnString <- "Driver=SQL Server;server=.;
                              database=testParallel;
                              uid=sa;pwd=sapwd"

      mydata <- RxSqlServerData(sqlQuery = "SELECT y, rand1, rand2, 
                                            rand3, rand4, rand5 
                                            FROM dbo.tb_Rand_30M",
                                connectionString = sqlServerConnString);


      
                        
        myModel <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, 
                      data=mydata)

        model <- serialize(myModel, NULL);
        modelbinstr = paste(model, collapse = "")
        OutputDataSet <- data.frame(ProcessId = pid, 
                              nRows=myModel$nValidObs, 
                              theModel = modelbinstr)'
WITH RESULT SETS ((ProcessId int, Rows int NOT NULL, 
            ModelAsVarchar nvarchar(max) NULL));
SELECT DATEDIFF(ms, @start, SYSUTCDATETIME()) -- 25 sec    22 sec 1654 events



DECLARE @medVal float
EXEC sp_execute_external_script 
                         @language = N'R'
                       , @script = N'
                        
                         sqlServerConnString <- "Driver=SQL Server;server=.;
                              database=testParallel;
                              uid=sa;pwd=sapwd"

                         sqlCtx <- RxInSqlServer(connectionString = sqlServerConnString, numTasks = 4)
                         # set the compute context to be the sql context
                         rxSetComputeContext(sqlCtx)

                         mydata <- RxSqlServerData(sqlQuery = "SELECT y, rand1, rand2, 
                                            rand3, rand4, rand5 
                                            FROM dbo.tb_Rand_30M",
                                connectionString = sqlServerConnString);

                        
                        ds <- rxImport(mydata)
                        med <- median(ds$rand5)'
                        , @params = N'@med float OUTPUT'
                        , @med = @medVal OUT
SELECT @medVal
                        



EXEC sp_execute_external_script 
                         @language = N'R'
                       , @script = N'
                        
                         sqlServerConnString <- "Driver=SQL Server;server=.;
                              database=testParallel;
                              uid=sa;pwd=sapwd"

                         sqlCtx <- RxInSqlServer(connectionString = sqlServerConnString, numTasks = 1)
                         # set the compute context to be the sql context
                         rxSetComputeContext(sqlCtx)

                         mydata <- RxSqlServerData(sqlQuery = "SELECT TOP(1) y, rand1, rand2, 
                                            rand3, rand4, rand5 
                                            FROM dbo.tb_Rand_30M",
                                connectionString = sqlServerConnString,rowsPerRead = 1000000);

                        
                        #ds <- rxImport(mydata)

                        rxSummary(~ rand5 , mydata)'

                        #myModel <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, data=mydata)'

                        


select
 avg(rand5 * 1.0) [mean]
 
from dbo.tb_Rand_30M







                        
SELECT TOP(100) PERCENTILE_CONT(0.5) 
  WITHIN GROUP (ORDER BY rand1) OVER ()
FROM dbo.tb_Rand_30M;
                        

DECLARE @c BIGINT =  100; --  (SELECT COUNT(*) FROM dbo.EvenRows);
 
SELECT AVG(1.0 * rand1)
FROM (
    SELECT TOP(100) rand1 FROM dbo.tb_Rand_30M
     ORDER BY rand1
     OFFSET (@c - 1) / 2 ROWS
     FETCH NEXT 1 + (1 - @c % 2) ROWS ONLY
) AS x;


SELECT rand5 FROM dbo.tb_Rand_30M

DECLARE @md float
SELECT @md = AVG(1.0 * rand5)
FROM
(
    SELECT o.rand5, rn = ROW_NUMBER() OVER (ORDER BY o.rand5), c.c
    FROM dbo.tb_Rand_30M AS o
    CROSS JOIN (SELECT c = COUNT(*) FROM dbo.tb_Rand_30M) AS c
) AS x
WHERE rn IN ((c + 1)/2, (c + 2)/2);

SELECT @md;



DECLARE @c BIGINT = (SELECT COUNT(*) FROM dbo.tb_Rand_30M);
 
SELECT AVG(1.0 * rand5)
FROM (
    SELECT rand5 FROM dbo.tb_Rand_30M
     ORDER BY rand5
     OFFSET (@c - 1) / 2 ROWS
     FETCH NEXT 1 + (1 - @c % 2) ROWS ONLY
) AS x;