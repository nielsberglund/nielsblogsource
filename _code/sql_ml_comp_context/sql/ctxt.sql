
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

EXEC sp_execute_external_script
      @language = N'R'
    , @script = N'
        pid <- Sys.getpid()

        sqlConnString <- "Driver=SQL Server;Server=.\\inst2k17; 
                          Database=TestParallel;uid=sa;pwd=sapwd"

		    # sqlCtx <- RxInSqlServer(connectionString = sqlConnString, numTasks = 4)  
		    # rxSetComputeContext(sqlCtx)
        ds <- RxSqlServerData(connectionString=sqlConnString, sqlQuery=inData)

        myModel <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, 
                      data=ds)

        model <- serialize(myModel, NULL);
        modelbinstr = paste(model, collapse = "")
        OutputDataSet <- data.frame(ProcessId = pid, 
                              nRows=myModel$nValidObs, 
                              theModel = modelbinstr)'
    , @input_data_1 = N''
    , @params = N'@inData nvarchar(max)'
    , @inData = @inputData
WITH RESULT SETS ((ProcessId int, Rows int NOT NULL, 
                   ModelAsVarchar nvarchar(max) NULL));

EXEC sp_execute_external_script
      @language = N'R'
    , @script = N'
        pid <- Sys.getpid()

        sqlConnString <- "Driver=SQL Server;Server=.\\inst2k17; 
                          Database=TestParallel;uid=sa;pwd=!@#$%A1"

		    sqlCtx <- RxInSqlServer(connectionString = sqlConnString, 
                                        numTasks = 4)  
		    rxSetComputeContext(sqlCtx)
        # ds <- RxSqlServerData(connectionString=sqlConnString, sqlQuery=InputDataset)

        myModel <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, 
                      data=InputDataSet)

        model <- serialize(myModel, NULL);
        modelbinstr = paste(model, collapse = "")
        OutputDataSet <- data.frame(ProcessId = pid, 
                              nRows=myModel$nValidObs, 
                              theModel = modelbinstr)'
    , @input_data_1 = N'SELECT y, rand1, rand2, rand3, rand4, rand5
FROM dbo.tb_Rand_50M
TABLESAMPLE(80 PERCENT) 
REPEATABLE(98074)
WHERE  rand5 >= 5
OPTION(querytraceon 8649)'
WITH RESULT SETS ((ProcessId int, Rows int NOT NULL, 
                   ModelAsVarchar nvarchar(max) NULL));



rxGetComputeContext()  



EXEC sp_execute_external_script
      @language = N'R'
    , @script = N'
            d <- 42;
            ctx <- rxGetComputeContext();
            show(ctx);'
        



DECLARE @start datetime2 = SYSUTCDATETIME()
EXEC sp_execute_external_script  
      @language = N'R'
    , @script = N'
    
      ".test" <- function(maxVal)
      {i <- 0
        while(i < maxVal)
        {
          i = i + 1
                                          
        }
        return(i)   
      }
      # set up the connection string
      sqlServerConnString <- "Driver=SQL Server;server=.\\inst2k17;
                              database=testParallel;
                              uid=sa;pwd=sapwd"

      # set up a compute context
      sqlCtx <- RxInSqlServer(connectionString = sqlServerConnString, numTasks = 4)
      # set the compute context to be the sql context
      rxSetComputeContext(sqlCtx)

      #Sys.sleep(20)


      mydata <- RxSqlServerData(sqlQuery = "SELECT y, rand1, rand2, 
                                            rand3, rand4, rand5 
                                            FROM dbo.tb_Rand_50M",
                                connectionString = sqlServerConnString);

      #res <- .test(50000000)

      myModel <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, 
                          data = mydata);

      #res <- .test(50000000)'
SELECT DATEDIFF(ss, @start, SYSUTCDATETIME())

DECLARE @start datetime2 = SYSUTCDATETIME()
EXEC sp_execute_external_script  
      @language = N'R'
    , @script = N'
         
      # set up the connection string
      sqlServerConnString <- "Driver=SQL Server;server=.\\inst2k17;
                              database=testParallel;
                              uid=sa;pwd=sapwd"

      # set up a compute context
      sqlCtx <- RxInSqlServer(connectionString = sqlServerConnString, numTasks = 4)
      # set the compute context to be the sql context
      rxSetComputeContext(sqlCtx)

      mydata <- RxSqlServerData(sqlQuery = "SELECT y, rand1, rand2, 
                                            rand3, rand4, rand5 
                                            FROM dbo.tb_Rand_50M",
                                connectionString = sqlServerConnString);

      Sys.sleep(10)
      
      #res <- .test(50000000)

      myModel <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, 
                          data = mydata);

      #res <- .test(50000000)'
SELECT DATEDIFF(ss, @start, SYSUTCDATETIME())




















  -n 4 "C:\PROGRA~1\MICROS~3\MSSQL1~1.INS\R_SERV~2\bin\x64\rterm.exe" --no-restore --no-save -q -e "stopifnot(require(RevoScaleR) || stop(.libPaths()));Sys.setenv(MRS_EXTLIB_SHARED_PATH='C:/Program Files/Microsoft SQL Server/MSSQL14.INST2K17/MSSQL/ExternalLibraries/R/6/1');Sys.setenv(MRS_EXTLIB_USER_PATH='');rxRemoteCall();" --args "rxCommArgs(rxCommType='MPI',rxComputeWhere='masterNode',rxNetworkShareJobDirectory='C:/PROGRA~1/MICROS~3/MSSQL1~1.INS/MSSQL/EXTENS~1/INST2K1701/26D75BEE-94F7-498B-9D53-27F16C2FD563/work',rxTraceLevel=0,sessionId='11F1E49E-0FE6-4732-9802-6065339DC7FB',port=55464,sqlSatellitePath='C:\\Program Files\\Microsoft SQL Server\\MSSQL14.INST2K17\\MSSQL\\Binn\\sqlsatellite.dll',pipeName='DataSet1_1Col_Int_1Row',logPath='',rxClusterTarget='sqlserver')"


  mpiexec.exe
   -n 4 "C:\PROGRA~1\MICROS~3\MSSQL1~1.INS\R_SERV~2\bin\x64\rterm.exe" --no-restore --no-save -q -e "stopifnot(require(RevoScaleR) || stop(.libPaths()));Sys.setenv(MRS_EXTLIB_SHARED_PATH='C:/Program Files/Microsoft SQL Server/MSSQL14.INST2K17/MSSQL/ExternalLibraries/R/6/1');Sys.setenv(MRS_EXTLIB_USER_PATH='');rxRemoteCall();" --args "rxCommArgs(rxCommType='MPI',rxComputeWhere='masterNode',rxNetworkShareJobDirectory='C:/PROGRA~1/MICROS~3/MSSQL1~1.INS/MSSQL/EXTENS~1/INST2K1701/DCCD2350-8E0E-431B-B865-38502FEDD225/work',rxTraceLevel=0,sessionId='857CFFE8-75F1-4D09-9EA7-2CA60A5026DD',port=55464,sqlSatellitePath='C:\\Program Files\\Microsoft SQL Server\\MSSQL14.INST2K17\\MSSQL\\Binn\\sqlsatellite.dll',pipeName='DataSet1_1Col_Int_1Row',logPath='',rxClusterTarget='sqlserver')"

   smpd.exe
  "C:\Program Files\Microsoft MPI\bin\smpd.exe" -p 8677 -d 0 -mgr 268 "job" -localonly