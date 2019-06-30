SET NOCOUNT ON;
GO

USE TestParallel;
GO


SELECT   y, rand1, rand2, rand3, 
                      rand4, rand5 
              FROM dbo.tb_Rand_3M TABLESAMPLE(50 PERCENT) 
                                  REPEATABLE(98074)
WHERE  rand5 >= 10           
OPTION(querytraceon 8649, MAXDOP 4)  


DECLARE @model varbinary(max) = (SELECT TOP(1) ModelBin  FROM dbo.tb_Model WHERE ModelName = 'GLM_75Pct'); 
EXECUTE sp_execute_external_script
                   @language = N'R',  
                   @script = N'  
                     Sys.sleep(10)
                     #mod <- unserialize(model); 

                     cat(paste0("R Process ID = ", Sys.getpid()))
                     cat("\n")
                     cat(paste0("Nmbr rows = ", nrow(InputDataSet)))
                     cat("\n")
                     cat("----------------")
                     cat("\n")

                      OutputDataSet <- InputDataSet',
                       @input_data_1 = N' SELECT TOP(100) y, rand1, rand2, rand3, 
                      rand4, rand5 
              FROM dbo.tb_Rand_3M 
WHERE rand5 >= 10',
 @params = N'@r_rowsPerRead int',
 @r_rowsPerRead = 10;




DECLARE @model varbinary(max) = (SELECT TOP(1) ModelBin  FROM dbo.tb_Model WHERE ModelName = 'GLM_75Pct');  
  EXEC sp_execute_external_script @language = N'R',  
     @script = N'  
       #Sys.sleep(10)
       mod <- unserialize(model); 

       cat(paste0("R Process ID = ", Sys.getpid()))
       cat("\n")
       cat(paste0("Nmbr rows = ", nrow(InputDataSet)))
       cat("\n")
       cat("----------------")
       cat("\n")

        OutputDataSet <- data.frame(predict(mod, 
                                  newdata = InputDataSet, 
                                  type = "response"))',  
  @input_data_1 = N' SELECT TOP(1) y, rand1, rand2, rand3, 
                      rand4, rand5 
              FROM dbo.tb_Rand_3M',  
  @params = N'@model varbinary(max)', 
  @model = @model
WITH RESULT SETS ((Y_predict float));

DECLARE @model varbinary(max) = (SELECT TOP(1) ModelBin  FROM dbo.tb_Model WHERE ModelName = 'GLM_75Pct');  
  EXEC sp_execute_external_script @language = N'R',  
     @script = N'  
       mod <- unserialize(model); 

       cat(paste0("R Process ID = ", Sys.getpid()))
       cat("\n")
       cat(paste0("Nmbr rows = ", nrow(InputDataSet)))
       cat("\n")
       cat("----------------")
       cat("\n")

        OutputDataSet <- data.frame(predict(mod, 
                                  newdata = InputDataSet, 
                                  type = "response"))',  
  @input_data_1 = N' SELECT TOP(1000) y, rand1, rand2, rand3, 
                      rand4, rand5 
              FROM dbo.tb_Rand_3M',  
  @params = N'@model varbinary(max), @r_rowsPerRead int', 
  @model = @model,
  @r_rowsPerRead = 250
WITH RESULT SETS ((Y_predict float));





DECLARE @start datetime2 = SYSUTCDATETIME();
DECLARE @model varbinary(max) = (SELECT TOP(1) ModelBin  FROM dbo.tb_Model WHERE ModelName = 'RxLM_75Pct');  
  EXEC sp_execute_external_script @language = N'R',  
      
  @parallel = 1,
  @script = N'
       Sys.sleep(10)  
       mod <- unserialize(model); 
       cat(paste0("R Process ID = ", Sys.getpid()))
       cat("\n")
       cat(paste0("Nmbr rows = ", nrow(InputDataSet)))
       cat("\n")
       cat("----------------")
       cat("\n")      
       OutputDataSet <- data.frame(rxPredict(modelObject = mod, 
           data = InputDataSet, 
           outData = NULL, 
           type = "response", 
           writeModelVars = FALSE, overwrite = TRUE));',  
  @input_data_1 = N'SELECT TOP(2800000) y, rand1, rand2, rand3, 
                      rand4, rand5 
              FROM dbo.tb_Rand_3M 
WHERE  rand5 >= 10           
OPTION(querytraceon 8649, MAXDOP 4)',
  @params = N'@model varbinary(max)',  
  @model = @model
WITH RESULT SETS ((Y_predict float)); 
SELECT DATEDIFF(ms, @start, SYSUTCDATETIME());   
GO

DECLARE @model varbinary(max) = (SELECT TOP(1) ModelBin  FROM dbo.tb_Model WHERE ModelName = 'RxLM_75Pct');  
  EXEC sp_execute_external_script @language = N'R',  
     @script = N'
       Sys.sleep(10)
       mod <- unserialize(model);
       cat(paste0("R Process ID = ", Sys.getpid()))
       cat("\n")
       cat(paste0("Nmbr rows = ", nrow(InputDataSet)))
       cat("\n")
       cat("----------------")
       cat("\n")     
       OutputDataSet <- data.frame(rxPredict(modelObject = mod, 
           data = InputDataSet, 
           outData = NULL, 
           type = "response", 
           writeModelVars = FALSE, overwrite = TRUE));',  
  @input_data_1 = N'SELECT TOP(2800000) y, rand1, rand2, rand3, 
                      rand4, rand5 
              FROM dbo.tb_Rand_3M 
WHERE  rand5 >= 10', 
  @params = N'@model varbinary(max)',  
  @model = @model;
GO

DECLARE @model varbinary(max) = (SELECT TOP(1) ModelBin  FROM dbo.tb_Model WHERE ModelName = 'RxLM_75Pct');  
  EXEC sp_execute_external_script @language = N'R',  
     @script = N'
       Sys.sleep(10)
       mod <- unserialize(model);
       cat(paste0("R Process ID = ", Sys.getpid()))
       cat("\n")
       cat(paste0("Nmbr rows = ", nrow(InputDataSet)))
       cat("\n")
       cat("----------------")
       cat("\n")     
       OutputDataSet <- data.frame(rxPredict(modelObject = mod, 
           data = InputDataSet, 
           outData = NULL, 
           type = "response", 
           writeModelVars = FALSE, overwrite = TRUE));',  
  @input_data_1 = N'SELECT TOP(2800000) y, rand1, rand2, rand3, 
                      rand4, rand5 
              FROM dbo.tb_Rand_3M 
WHERE  rand5 >= 10', 
  @params = N'@model varbinary(max), @r_rowsPerRead int',
  @r_rowsPerRead = 500000, 
  @model = @model;
GO






EXEC sp_execute_external_script @language = N'R',  
     @script = N'  
       cat(paste0("R Process ID = ", Sys.getpid()))
       cat("\n")
       cat(paste0("Nmbr rows = ", nrow(InputDataSet)))
       cat("\n")
       cat("----------------")
       cat("\n")

        OutputDataSet <- InputDataSet',  
  @input_data_1 = N' SELECT TOP(100) y, rand1, rand2, rand3, 
                      rand4, rand5 
              FROM dbo.tb_Rand_3M';


EXEC sp_execute_external_script @language = N'R',  
     @script = N'  
       Sys.sleep(10)
       cat(paste0("R Process ID = ", Sys.getpid()))
       cat("\n")
       cat(paste0("Nmbr rows = ", nrow(InputDataSet)))
       cat("\n")
       cat("----------------")
       cat("\n")

        OutputDataSet <- InputDataSet',  
  @input_data_1 = N' SELECT TOP(100) y, rand1, rand2, rand3, 
                      rand4, rand5 
              FROM dbo.tb_Rand_3M',
  @params = N'@r_rowsPerRead int',
  @r_rowsPerRead = 25;








DECLARE @model varbinary(max) = (SELECT TOP(1) ModelBin  FROM dbo.tb_Model WHERE ModelName = 'RxLM_75Pct');  
  EXEC sp_execute_external_script @language = N'R',  
     @script = N'  
       mod <- unserialize(model); 
       cat(paste0("R Process ID = ", Sys.getpid()))
       cat("\n")
       cat(paste0("Nmbr rows = ", nrow(InputDataSet)))
       cat("\n")
       cat("----------------")
       cat("\n")      
       OutputDataSet <- data.frame(rxPredict(modelObject = mod, 
           data = InputDataSet, 
           outData = NULL, 
           type = "response", 
           writeModelVars = FALSE, overwrite = TRUE));',  
  @input_data_1 = N'SELECT y, rand1, rand2, rand3, 
                      rand4, rand5 
              FROM dbo.tb_Rand_3M', 
  @parallel = 1,                                   
  @params = N'@model varbinary(max), @r_rowsPerRead int',  
  @r_rowsPerRead = 500000,
  @model = @model
WITH RESULT SETS ((Y_predict float))    
GO
 
 






 SELECT   TOP(1300000) y, rand1, rand2, rand3, 
                      rand4, rand5 
              FROM dbo.tb_Rand_3M 
WHERE rand5 >= 10
OPTION(querytraceon 8649, MAXDOP 4)



DECLARE @model varbinary(max) = (SELECT TOP(1) ModelBin  FROM dbo.tb_Model WHERE ModelName = 'RxLM_75Pct');  
  EXEC sp_execute_external_script @language = N'R',  
     @script = N'  
       mod <- unserialize(model); 
       cat(paste0("R Process ID = ", Sys.getpid()))
       cat("\n")
       cat(paste0("Nmbr rows = ", nrow(InputDataSet)))
       cat("\n")
       cat("----------------")
       cat("\n")      
       OutputDataSet <- data.frame(rxPredict(modelObject = mod, 
           data = InputDataSet, 
           outData = NULL, 
           type = "response", 
           writeModelVars = FALSE, overwrite = TRUE));',  
  @input_data_1 = N'SELECT TOP(1200000)   y, rand1, rand2, rand3, 
                      rand4, rand5 
              FROM dbo.tb_Rand_3M 
WHERE  rand5 >= 10',
  @parallel = 1, 
  @params = N'@model varbinary(max)',  
  @model = @model
WITH RESULT SETS ((Y_predict float))    
GO


EXEC sp_execute_external_script
          @language = N'R'
        , @script = N'
              myModel <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, 
                           data=InputDataSet)
              
              model <- serialize(myModel, NULL);'
       
       , @input_data_1 = N'
              SELECT  y, rand1, rand2, rand3, 
                      rand4, rand5 
              FROM dbo.tb_Rand_3M TABLESAMPLE(75 PERCENT) 
                                  REPEATABLE(98074)
              WHERE  rand5 >= 10           
OPTION(querytraceon 8649, MAXDOP 4)',
       @parallel = 1
WITH RESULT SETS ((Y_predict float)) 


EXEC sp_execute_external_script
          @language = N'R'
        , @script = N'
            #Sys.sleep(30)
             pid <- Sys.getpid()
             r <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, 
                           data=InputDataSet)
 
             coef <- r$coefficients
             icept <- coef[1];
              OutputDataSet <- data.frame(pid=pid, nRows=r$nValidObs, 
                                          intercept=icept)'
        , @input_data_1 =N'SELECT TOP(2800000) y, rand1, rand2, rand3, 
                      rand4, rand5 
              FROM dbo.tb_Rand_3M 
WHERE  rand5 >= 10           
OPTION(querytraceon 8649, MAXDOP 4)'
        , @parallel=1
        --, @params = N'@r_rowsPerRead int'
	      --, @r_rowsPerRead = 100000
WITH RESULT SETS ((pid INT NOT NULL, nRows INT NOT NULL, intercept FLOAT NULL)
); 


DECLARE @mod varbinary(max);
EXEC sp_execute_external_script
      @language = N'R'
    , @script = N'
          pid <- Sys.getpid()
          myModel <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, 
                       data=InputDataSet)
          coef <- myModel$coefficients
          icept <- coef[1];
          model <- serialize(myModel, NULL);
          OutputDataSet <- data.frame(pid=pid, nRows=myModel$nValidObs, 
                                       intercept=icept, theModel = model)'
   
   , @input_data_1 = N'SELECT TOP(2800000) y, rand1, rand2, rand3, 
                      rand4, rand5 
              FROM dbo.tb_Rand_3M 
WHERE  rand5 >= 10           
OPTION(querytraceon 8649, MAXDOP 4)',
     @parallel = 1
    WITH RESULT SETS ((pid INT NOT NULL, nRows INT NOT NULL, intercept FLOAT NULL, model varbinary(max) NULL));


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
   , @input_data_1 = N'SELECT TOP(2400000) y, rand1, rand2, rand3, 
                                           rand4, rand5 
                       FROM dbo.tb_Rand_3M 
                       WHERE  rand5 >= 10           
                       OPTION(querytraceon 8649, MAXDOP 4)'
   , @parallel = 1
WITH RESULT SETS ((ProcessId int, Rows int NOT NULL, 
                   ModelAsVarchar nvarchar(max) NULL));

DECLARE @inputData nvarchar(max) = N'SELECT y, rand1, rand2, rand3, 
                                     rand4, rand5 
                                    FROM dbo.tb_Rand_30M 
                                    TABLESAMPLE(95 PERCENT) 
                                    REPEATABLE(98074)'
EXEC sp_execute_external_script
      @language = N'R'
    , @script = N'
        pid <- Sys.getpid()

        sqlConnString <- "Driver=SQL Server;Server=.; 
                          Database=TestParallel;uid=sa;pwd=sapwd"

		    sqlCtx <- RxInSqlServer(connectionString = sqlConnString, 
                                        numTasks = 2)  
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





EXEC sp_execute_external_script
          @language = N'R'
        , @script = N'
              myModel <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, 
                           data=InputDataSet)
              
              model <- serialize(myModel, NULL);'
       
       , @input_data_1 = N'
              SELECT  y, rand1, rand2, rand3, 
                      rand4, rand5 
              FROM dbo.tb_Rand_30M TABLESAMPLE(75 PERCENT) 
                                  REPEATABLE(98074)',
       @parallel = 1
WITH RESULT SETS ((Y_predict float)) 





DROP TABLE IF EXISTS dbo.tb_Rand_30M
GO
CREATE TABLE dbo.tb_Rand_30M(RowID bigint identity primary key, y int, rand1 int, rand2 int, rand3 int, rand4 int, rand5 int);
GO

INSERT INTO dbo.tb_Rand_30M(y, rand1, rand2, rand3, rand4, rand5)
SELECT TOP(30000000) CAST(ABS(CHECKSUM(NEWID())) % 14 AS INT) 
	, CAST(ABS(CHECKSUM(NEWID())) % 20 AS INT)
	, CAST(ABS(CHECKSUM(NEWID())) % 25 AS INT)
	, CAST(ABS(CHECKSUM(NEWID())) % 14 AS INT)
	, CAST(ABS(CHECKSUM(NEWID())) % 50 AS INT)
	, CAST(ABS(CHECKSUM(NEWID())) % 100 AS INT)
FROM sys.objects o1
CROSS JOIN sys.objects o2
CROSS JOIN sys.objects o3
CROSS JOIN sys.objects o4;
GO