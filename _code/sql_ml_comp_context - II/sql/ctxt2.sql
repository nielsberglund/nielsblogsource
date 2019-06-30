SELECT TOP(1) y, rand1, rand2, rand3, rand4, rand5 FROM dbo.tb_Rand_30M

sp_executesql N'SELECT TOP(1) y, rand1, rand2, rand3, rand4, rand5 FROM dbo.tb_Rand_30M'




-- 30 M
DECLARE @start datetime2 = SYSUTCDATETIME()
EXEC sp_execute_external_script
      @language = N'R'
    , @script = N'
        pid <- Sys.getpid()
                
        myModel <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, 
                      data=InputDataSet)

        model <- serialize(myModel, NULL);
        modelbinstr = paste(model, collapse = "")
        OutputDataSet <- data.frame(ProcessId = pid, 
                              nRows=myModel$nValidObs, 
                              theModel = modelbinstr)'
    , @input_data_1 = N'SELECT y, rand1, rand2, rand3, rand4, rand5 FROM dbo.tb_Rand_30M'
       
WITH RESULT SETS ((ProcessId int, Rows int NOT NULL, 
                   ModelAsVarchar nvarchar(max) NULL));
SELECT DATEDIFF(ms, @start, SYSUTCDATETIME()) --16.9 sec 11,621 events

DECLARE @start datetime2 = SYSUTCDATETIME()
EXEC sp_execute_external_script
      @language = N'R'
    , @script = N'
        pid <- Sys.getpid()
        
        ds <- InputDataSet;'
       
    , @input_data_1 = N'SELECT TOP(1) y, rand1, rand2, rand3, rand4, rand5 FROM dbo.tb_Rand_30M'
SELECT DATEDIFF(ms, @start, SYSUTCDATETIME()) -- .2 seconds 8 events

l

DECLARE @start datetime2 = SYSUTCDATETIME()
EXEC sp_execute_external_script
      @language = N'R'
    , @script = N'
      pid <- Sys.getpid()
        # set up the connection string
      sqlServerConnString <- "Driver=SQL Server;server=.;
                              database=testParallel;
                              uid=sa;pwd=sapwd"

      mydata <- RxSqlServerData(sqlQuery = "SELECT TOP(1) y, rand1, rand2, 
                                            rand3, rand4, rand5 
                                            FROM dbo.tb_Rand_30M",
                                connectionString = sqlServerConnString);
                        
        ds <- rxImport(mydata)'
SELECT DATEDIFF(ms, @start, SYSUTCDATETIME()) -- .9 sec    17 events

DECLARE @start datetime2 = SYSUTCDATETIME()
EXEC sp_execute_external_script
      @language = N'R'
    , @script = N'
      pid <- Sys.getpid()
        # set up the connection string
      sqlServerConnString <- "Driver=SQL Server;server=.;
                              database=testParallel;
                              uid=sa;pwd=sapwd"

      mydata <- RxSqlServerData(sqlQuery = "SELECT TOP(1) y, rand1, rand2, 
                                            rand3, rand4, rand5 
                                            FROM dbo.tb_Rand_30M",
                                connectionString = sqlServerConnString);
                        
         myModel <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, 
                      data=mydata)'
SELECT DATEDIFF(ms, @start, SYSUTCDATETIME()) -- .9 sec    17 events





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



DECLARE @start datetime2 = SYSUTCDATETIME()
EXEC sp_execute_external_script
      @language = N'R'
    , @script = N'
      pid <- Sys.getpid()
        # set up the connection string
      sqlServerConnString <- "Driver=SQL Server;server=.;
                              database=testParallel;
                              uid=sa;pwd=sapwd"

      sqlCtx <- RxInSqlServer(connectionString = sqlServerConnString, numTasks = 1)
      # set the compute context to be the sql context
      rxSetComputeContext(sqlCtx)

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
SELECT DATEDIFF(ms, @start, SYSUTCDATETIME()) -- 14.4 12006

-- 30 M 4 tasks
DECLARE @start datetime2 = SYSUTCDATETIME()
EXEC sp_execute_external_script
      @language = N'R'
    , @script = N'
      pid <- Sys.getpid()
        # set up the connection string
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
                        
        myModel <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, 
                      data=mydata)

        model <- serialize(myModel, NULL);
        modelbinstr = paste(model, collapse = "")
        OutputDataSet <- data.frame(ProcessId = pid, 
                              nRows=myModel$nValidObs, 
                              theModel = modelbinstr)'
WITH RESULT SETS ((ProcessId int, Rows int NOT NULL, 
            ModelAsVarchar nvarchar(max) NULL));
SELECT DATEDIFF(ms, @start, SYSUTCDATETIME()) -- 9 sec



-- 50 M
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
                                            FROM dbo.tb_Rand_50M",
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
SELECT DATEDIFF(ms, @start, SYSUTCDATETIME()) -- 40 sec   



DECLARE @start datetime2 = SYSUTCDATETIME()
EXEC sp_execute_external_script
      @language = N'R'
    , @script = N'
      pid <- Sys.getpid()
        # set up the connection string
      sqlServerConnString <- "Driver=SQL Server;server=.;
                              database=testParallel;
                              uid=sa;pwd=sapwd"

      sqlCtx <- RxInSqlServer(connectionString = sqlServerConnString, numTasks = 1)
      # set the compute context to be the sql context
      rxSetComputeContext(sqlCtx)

       mydata <- RxSqlServerData(sqlQuery = "SELECT y, rand1, rand2, 
                                            rand3, rand4, rand5 
                                            FROM dbo.tb_Rand_50M",
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
SELECT DATEDIFF(ms, @start, SYSUTCDATETIME()) -- 23 sec

-- 50 M 4 tasks
DECLARE @start datetime2 = SYSUTCDATETIME()
EXEC sp_execute_external_script
      @language = N'R'
    , @script = N'
      pid <- Sys.getpid()
        # set up the connection string
      sqlServerConnString <- "Driver=SQL Server;server=.;
                              database=testParallel;
                              uid=sa;pwd=sapwd"

      sqlCtx <- RxInSqlServer(connectionString = sqlServerConnString, numTasks = 4)
      # set the compute context to be the sql context
      rxSetComputeContext(sqlCtx)

       mydata <- RxSqlServerData(sqlQuery = "SELECT y, rand1, rand2, 
                                            rand3, rand4, rand5 
                                            FROM dbo.tb_Rand_50M",
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
SELECT DATEDIFF(ms, @start, SYSUTCDATETIME()) -- 13 sec



