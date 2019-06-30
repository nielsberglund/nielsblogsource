USE DataScienceDB;
GO

EXECUTE sp_execute_external_script 
  @language = N'R',
  @script = N'library("randomForest")';
  

