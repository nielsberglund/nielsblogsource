

DECLARE @mod varbinary(max);
DECLARE @input_query nvarchar(max) = 'select tipped, fare_amount, passenger_count,trip_time_in_secs,trip_distance, 
    pickup_datetime, dropoff_datetime, 
    dbo.fn_CalculateDistance(pickup_latitude, pickup_longitude,  dropoff_latitude, dropoff_longitude) as direct_distance
    from dbo.tb_NYCityTaxi
    tablesample (70 percent) repeatable (98052)'

EXEC sp_execute_external_script @language = N'R',
                                  @script = N'
## Create model
logitObj <- glm(tipped ~ passenger_count + trip_distance + trip_time_in_secs + direct_distance, 
                data = InputDataSet, family = binomial(link=logit))
## Serialize model and put it in data frame
model <- as.raw(serialize(logitObj, NULL));',
                                  @input_data_1 = @input_query,
                                  @params = N'@model varbinary(max) OUT',
                                  @model = @mod OUT;

MERGE dbo.tb_Model AS tgt
USING(SELECT @mod AS ModelBin, 'GLM_75Pct' AS ModelName) AS src
ON (tgt.ModelName = src.ModelName)
WHEN NOT MATCHED THEN
  INSERT(ModelName, ModelBin)
  VALUES(src.ModelName, src.ModelBin)
WHEN MATCHED AND tgt.ModelName <> src.ModelName THEN
  UPDATE 
    SET tgt.ModelBin = src.ModelBin;
GO

/*

SELECT * FROM dbo.tb_Model

*/

DECLARE @mod varbinary(max);
DECLARE @input_query nvarchar(max) = 'select tipped, fare_amount, passenger_count,trip_time_in_secs,trip_distance, 
    pickup_datetime, dropoff_datetime, 
    dbo.fn_CalculateDistance(pickup_latitude, pickup_longitude,  dropoff_latitude, dropoff_longitude) as direct_distance
    from dbo.tb_NYCityTaxi
    tablesample (70 percent) repeatable (98052)'

EXEC sp_execute_external_script
          @language = N'R'
        , @script = N'
              logitObj <- rxLogit(tipped ~ passenger_count + trip_distance + trip_time_in_secs + direct_distance, data = InputDataSet)
              
              model <- as.raw(serialize(logitObj, NULL));'
       
       , @input_data_1 = @input_query,
         @params = N'@model varbinary(max) OUT',
         @model = @mod OUT;

MERGE dbo.tb_Model AS tgt
USING(SELECT @mod AS ModelBin, 'RxLM_75Pct' AS ModelName) AS src
ON (tgt.ModelName = src.ModelName)
WHEN NOT MATCHED THEN
  INSERT(ModelName, ModelBin)
  VALUES(src.ModelName, src.ModelBin)
WHEN MATCHED AND tgt.ModelName <> src.ModelName THEN
  UPDATE 
    SET tgt.ModelBin = src.ModelBin;