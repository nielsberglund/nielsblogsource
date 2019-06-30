DECLARE @inputData nvarchar(max) = N'SELECT y, rand1, rand2, rand3, rand4, rand5
FROM dbo.tb_Rand_3M'


EXEC sp_execute_external_script
      @language = N'R'
    , @script = N'
        pid <- Sys.getpid()

        sqlConnString <- "Driver=SQL Server;Server=.\\inst2k17; 
                          Database=TestParallel;uid=sa;pwd=sapwd"

		    sqlCtx <- RxInSqlServer(connectionString = sqlConnString, numTasks = 2)  
		    rxSetComputeContext(sqlCtx)
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