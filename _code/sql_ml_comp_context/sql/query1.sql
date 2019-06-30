
EXEC sp_execute_external_script   @language = N'R'
                                , @script = N'd <- 42'
SELECT COUNT(*) FROM dbo.tb_Rand_50M

SELECT y, rand1, rand2, rand3, rand4, rand5
FROM dbo.tb_Rand_50M
TABLESAMPLE(40 PERCENT) 
REPEATABLE(98074)
WHERE  rand5 >= 5
OPTION(querytraceon 8649)


SELECT TOP(2400000) y, rand1, rand2, rand3, 
                                           rand4, rand5 
                       FROM dbo.tb_Rand_3M 
                       WHERE  rand5 >= 10           
                       OPTION(querytraceon 8649, MAXDOP 4)


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

res <- rxExecBy(func = .test, funcParams = 75000000)

OutputDataSet <- data.frame(res)'

--results1 <- rxExecBy(inData = inXdfDataSource, keys = c("car.age", "type"), func = .linMod)



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
WHERE  rand5 >= 5'
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
WHERE  rand5 >= 5'



