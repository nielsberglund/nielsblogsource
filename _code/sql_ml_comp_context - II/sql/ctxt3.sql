


DECLARE @isCtx bit = 1;
DECLARE @numTasks int = 1;
DECLARE @start datetime2 = SYSUTCDATETIME();
EXEC sp_execute_external_script
      @language = N'R'
    , @script = N'
      # set up the connection string
      sqlServerConnString <- "Driver=SQL Server;server=.;
                              database=testParallel;
                              uid=sa;pwd=sapwd"
      
      if(useContext == 1) {
        sqlCtx <- RxInSqlServer(connectionString = sqlServerConnString, numTasks = tasks)
        # set the compute context to be the sql context
        rxSetComputeContext(sqlCtx)
      }

      mydata <- RxSqlServerData(sqlQuery = "SELECT TOP(30000000) y, rand1, rand2, 
                                            rand3, rand4, rand5 
                                            FROM dbo.tb_Rand_50M",
                                connectionString = sqlServerConnString);
                               
      myModel <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, 
                      data=mydata)

      #OutputDataSet <- data.frame(nRows=myModel$nValidObs);'
    , @params = N'@tasks int, @useContext bit'
    , @tasks = @numTasks
    , @useContext = @isCtx
--WITH RESULT SETS ((NumberRows int NOT NULL));
SELECT DATEDIFF(ms, @start, SYSUTCDATETIME()) -- 40 sec 50000 rpr, 
GO



DECLARE @isCtx bit = 0;
DECLARE @numTasks int = 1;
DECLARE @start datetime2 = SYSUTCDATETIME();
EXEC sp_execute_external_script
      @language = N'R'
    , @script = N'
      # set up the connection string
      sqlServerConnString <- "Driver=SQL Server;server=.;
                              database=testParallel;
                              uid=sa;pwd=sapwd"
      
      if(useContext == 1) {
        sqlCtx <- RxInSqlServer(connectionString = sqlServerConnString, numTasks = tasks)
        # set the compute context to be the sql context
        rxSetComputeContext(sqlCtx)
      }
                      
      myModel <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, data=InputDataSet)

      #OutputDataSet <- data.frame(nRows=myModel$nValidObs);'
    , @input_data_1 = N'SELECT TOP(30000000) y, rand1, rand2, rand3, rand4, rand5 FROM dbo.tb_Rand_50M'
    , @params = N'@tasks int, @useContext bit'
    , @tasks = @numTasks
    , @useContext = @isCtx    
--WITH RESULT SETS ((NumberRows int NOT NULL));
SELECT DATEDIFF(ms, @start, SYSUTCDATETIME()) -- 29 sec 
GO


DECLARE @isCtx bit = 0;
DECLARE @numTasks int = 1;
DECLARE @start datetime2 = SYSUTCDATETIME();
EXEC sp_execute_external_script
      @language = N'R'
    , @script = N'
      # set up the connection string
      sqlServerConnString <- "Driver=SQL Server;server=.;
                              database=testParallel;
                              uid=sa;pwd=sapwd"
      
      if(useContext == 1) {
        sqlCtx <- RxInSqlServer(connectionString = sqlServerConnString, numTasks = tasks)
        # set the compute context to be the sql context
        rxSetComputeContext(sqlCtx)
      }

      #cat(paste0("Nmbr rows = ", nrow(InputDataSet)));

      #print(nrow(mydata));
                       
      myModel <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, data=InputDataSet)

      OutputDataSet <- data.frame(nRows=myModel$nValidObs);'
    , @input_data_1 = N'SELECT y, rand1, rand2, rand3, rand4, rand5 FROM dbo.tb_Rand_50M'
    , @params = N'@tasks int, @useContext bit, @r_rowsPerRead int'
    , @tasks = @numTasks
    , @useContext = @isCtx
    , @r_rowsPerRead = 500000
SELECT DATEDIFF(ms, @start, SYSUTCDATETIME()) -- 29 sec 
GO