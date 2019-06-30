

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

       OutputDataSet <- data.frame(predict(mod, newdata = InputDataSet, type = "response"))',  
  @input_data_1 = N'SELECT tipped, passenger_count, trip_time_in_secs, trip_distance, d.direct_distance FROM dbo.tb_NYCityTaxi 
CROSS APPLY (SELECT direct_distance = dbo.fn_CalculateDistance(pickup_latitude, pickup_longitude, dropoff_latitude, dropoff_longitude)) d 
OPTION(QUERYTRACEON 8649)',
  @parallel = 1,
  @params = N'@model varbinary(max)', 
  @model = @model
WITH RESULT SETS ((Tipped int));
GO


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
  @input_data_1 = N'SELECT tipped, passenger_count, trip_time_in_secs, trip_distance, d.direct_distance FROM dbo.tb_NYCityTaxi 
CROSS APPLY (SELECT direct_distance = dbo.fn_CalculateDistance(pickup_latitude, pickup_longitude, dropoff_latitude, dropoff_longitude)) d OPTION(MAXDOP 4)', 
  @parallel = 1,                                   
  @params = N'@model varbinary(max)',  
  @model = @model
WITH RESULT SETS ((Tipped int))    
GO
