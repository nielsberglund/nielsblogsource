
sp_configure 'external scripts enabled', 1
GO
RECONFIGURE
GO



EXEC sp_execute_external_script   @language = N'R'
                                , @script = N'd <- 42'


EXEC sp_execute_external_script   @language = N'R'
                                , @script = N'ctx <- rxGetComputeContext()
                                              show(ctx)'


EXEC sp_execute_external_script   @language = N'R'
                                , @script = N'

".test" <- function(maxVal)
{i <- 0
  while(i < maxVal)
  {
    i = i + 1
                                          
  }
  return(i)   
}
sqlConnString <- "Driver=SQL Server;Server=.\\inst2k17; Database=master;uid=sa;pwd=!@#$%A1"
sqlCtx <- RxInSqlServer(connectionString = sqlConnString, numTasks = 4) 
rxSetComputeContext(sqlCtx)

res <- rxExec(.test, 75000000)

OutputDataSet <- data.frame(res)'


EXEC sp_execute_external_script   @language = N'R'
                                , @script = N'

".test" <- function(maxVal)
{i <- 0
  while(i < maxVal)
  {
    i = i + 1
                                          
  }
  return(i)   
}

res <- .test(7500000)

print(res)
'




DECLARE @inputData nvarchar(max) = N'SELECT y, rand1, rand2, rand3, rand4, rand5
FROM dbo.tb_Rand_50M'
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
    , @input_data_1 = N'SELECT y, rand1, rand2, rand3, rand4, rand5 FROM dbo.tb_Rand_50M'
    , @params = N'@r_rowsPerRead int' 
    , @r_rowsPerRead = 40000000
    
WITH RESULT SETS ((ProcessId int, Rows int NOT NULL, 
                   ModelAsVarchar nvarchar(max) NULL));
SELECT DATEDIFF(ss, @start, SYSUTCDATETIME())


DECLARE @start datetime2 = SYSUTCDATETIME()
EXEC sp_execute_external_script
      @language = N'R'
    , @script = N'
                        
        xdfFileName <- "c:\\data\\inputdataset.xdf";

        rxImport(InputDataSet, xdfFileName, overwrite = TRUE);'
    , @input_data_1 = N'SELECT TOP(25000000) y, rand1, rand2, rand3, rand4, rand5 FROM dbo.tb_Rand_50M'
        
WITH RESULT SETS ((ProcessId int, Rows int NOT NULL, 
                   ModelAsVarchar nvarchar(max) NULL));
SELECT DATEDIFF(ss, @start, SYSUTCDATETIME())



DECLARE @start datetime2 = SYSUTCDATETIME()
EXEC sp_execute_external_script
      @language = N'R'
    , @script = N'
                        
        xdfFileName <- "c:\\data\\inputdataset.xdf";
        rxImport(InputDataSet, xdfFileName, overwrite = TRUE);'
    , @input_data_1 = N'SELECT TOP(25000000) y, rand1, rand2, rand3, rand4, rand5 FROM dbo.tb_Rand_50M'
SELECT DATEDIFF(ss, @start, SYSUTCDATETIME())


EXEC sp_execute_external_script
      @language = N'R'
    , @script = N'
        
        # set up the connection string
      sqlServerConnString <- "Driver=SQL Server;server=.;
                              database=testParallel;
                              uid=sa;pwd=sapwd"

       mydata <- RxSqlServerData(sqlQuery = "SELECT TOP(25000000) y, rand1, rand2, 
                                            rand3, rand4, rand5 
                                            FROM dbo.tb_Rand_50M",
                                connectionString = sqlServerConnString);
                        
        xdfFileName <- "c:\\data\\rxLocalCtx.xdf";
        rxImport(mydata, xdfFileName, overwrite = TRUE);'
    

EXEC sp_execute_external_script
      @language = N'R'
    , @script = N'
        
        # set up the connection string
      sqlServerConnString <- "Driver=SQL Server;server=.;
                              database=testParallel;
                              uid=sa;pwd=sapwd"

      sqlCtx <- RxInSqlServer(connectionString = sqlServerConnString, numTasks = 1)
      # set the compute context to be the sql context
      rxSetComputeContext(sqlCtx)

       mydata <- RxSqlServerData(sqlQuery = "SELECT TOP(25000000) y, rand1, rand2, 
                                            rand3, rand4, rand5 
                                            FROM dbo.tb_Rand_50M",
                                connectionString = sqlServerConnString);
                        
        xdfFileName <- "c:\\data\\rxSqlCC.xdf";
        rxImport(mydata, xdfFileName, overwrite = TRUE);'
    


