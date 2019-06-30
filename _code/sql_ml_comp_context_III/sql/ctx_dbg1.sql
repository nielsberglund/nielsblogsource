
USE TestParallel;
GO

DECLARE @isCtx bit = 0;
DECLARE @numTasks int = 1;
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

      mydata <- RxSqlServerData(sqlQuery = "SELECT TOP(1) y, rand1, rand2, 
                                            rand3, rand4, rand5 
                                            FROM dbo.tb_Rand_50M",
                                connectionString = sqlServerConnString);
                      
      myModel <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, 
                      data=mydata)'
     
    , @params = N'@tasks int, @useContext bit'
    , @tasks = @numTasks
    , @useContext = @isCtx
GO

DECLARE @isCtx bit = 0;
DECLARE @numTasks int = 1;
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

      mydata <- RxSqlServerData(sqlQuery = "SELECT TOP(1) y, rand1, rand2, 
                                            rand3, rand4, rand5 
                                            FROM dbo.tb_Rand_50M",
                                connectionString = sqlServerConnString);
      
      ds <- rxImport(mydata)'                
          
    , @params = N'@tasks int, @useContext bit'
    , @tasks = @numTasks
    , @useContext = @isCtx
GO




DECLARE @isCtx bit = 0;
DECLARE @numTasks int = 1;
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

      mydata <- RxSqlServerData(sqlQuery = "SELECT ''size'' as y, ''size'' as rand1, ''size'' as rand2, 
                                            ''size'' as rand3, ''size'' as rand4, ''size'' as rand5",
                                            connectionString = sqlServerConnString);
                      
      ds <- rxImport(mydata)'
     
    , @params = N'@tasks int, @useContext bit'
    , @tasks = @numTasks
    , @useContext = @isCtx
GO




EXEC sp_execute_external_script
      @language = N'R'
    , @script = N'
            d<-42'
   
--WITH RESULT SETS ((NumberRows int NOT NULL));

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
                      
      myModel <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, data=InputDataSet)'
    , @input_data_1 = N'SELECT TOP(1) y, rand1, rand2, rand3, rand4, rand5 FROM dbo.tb_Rand_50M'
    , @params = N'@tasks int, @useContext bit'
    , @tasks = @numTasks
    , @useContext = @isCtx 
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
                      
      myModel <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, data=InputDataSet)'
    , @input_data_1 = N'SELECT TOP(1) y, rand1, rand2, rand3, rand4, rand5 FROM dbo.tb_Rand_50M'
    , @params = N'@tasks int, @useContext bit'
    , @tasks = @numTasks
    , @useContext = @isCtx 
GO

DECLARE @isCtx bit = 1;
DECLARE @numTasks int = 1;
--DECLARE @start datetime2 = SYSUTCDATETIME();
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

      mydata <- RxSqlServerData(sqlQuery = "SELECT TOP(1)  y, rand1, rand2, 
                                            rand3, rand4, rand5 
                                            FROM dbo.tb_Rand_50M",
                                connectionString = sqlServerConnString);
                            
      myModel <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, 
                      data=mydata)'
    , @params = N'@tasks int, @useContext bit'
    , @tasks = @numTasks
    , @useContext = @isCtx
GO

DECLARE @isCtx bit = 0;
DECLARE @numTasks int = 1;
--DECLARE @start datetime2 = SYSUTCDATETIME();
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

      mydata <- RxSqlServerData(sqlQuery = "SELECT TOP(1) 1 / (y-y),  y, rand1, rand2, 
                                            rand3, rand4, rand5 
                                            FROM dbo.tb_Rand_50M",
                                connectionString = sqlServerConnString);
                      
      myModel <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, 
                      data=mydata)

      #OutputDataSet <- data.frame(nRows=myModel$nValidObs);'
    , @params = N'@tasks int, @useContext bit'
    , @tasks = @numTasks
    , @useContext = @isCtx
GO