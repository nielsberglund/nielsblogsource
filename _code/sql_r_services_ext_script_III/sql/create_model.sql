SET NOCOUNT ON;
GO

USE TestParallel;
GO

DECLARE @mod varbinary(max);
EXEC sp_execute_external_script
          @language = N'R'
        , @script = N'
              myModel <- glm(y ~ rand1 + rand2 + rand3 + rand4 + rand5, 
                           data=InputDataSet)
              
              model <- serialize(myModel, NULL);'
       
       , @input_data_1 = N'
              SELECT  y, rand1, rand2, rand3, 
                      rand4, rand5 
              FROM dbo.tb_Rand_3M TABLESAMPLE(75 PERCENT) 
                                  REPEATABLE(98074)',
         @params = N'@model varbinary(max) OUT',
         @model = @mod OUT;

SELECT @mod

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

DECLARE @mod varbinary(max);
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
                                  REPEATABLE(98074)',
         @params = N'@model varbinary(max) OUT',
         @model = @mod OUT;

SELECT @mod

MERGE dbo.tb_Model AS tgt
USING(SELECT @mod AS ModelBin, 'RxLM_75Pct' AS ModelName) AS src
ON (tgt.ModelName = src.ModelName)
WHEN NOT MATCHED THEN
  INSERT(ModelName, ModelBin)
  VALUES(src.ModelName, src.ModelBin)
WHEN MATCHED AND tgt.ModelName <> src.ModelName THEN
  UPDATE 
    SET tgt.ModelBin = src.ModelBin;




/*

SELECT * FROM dbo.tb_Model

TRUNCATE TABLE dbo.tb_Model

*/