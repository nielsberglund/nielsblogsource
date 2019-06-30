USE JavaTest;
GO


EXEC sp_execute_external_script @language = N'R'
                                , @script = N'OutputDataSet <- InputDataSet'
                                , @input_data_1 = N'SELECT * FROM dbo.tb_Rand100';

EXEC sp_execute_external_script @language = N'Python'
                                , @script = N'OutputDataSet = InputDataSet'
                                , @input_data_1 = N'SELECT RowID, y, rand1 FROM dbo.tb_Rand100';  


EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'DataPassing.echoData'
, @input_data_1 = N'SELECT RowID, y, rand1 FROM dbo.tb_Rand100'; 

EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'DataPassing.foo'
, @input_data_1 = N'SELECT TOP(10) RowID, y, rand1 FROM dbo.tb_Rand100';  


EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'DataPassing.bar'
, @input_data_1 = N'SELECT TOP(10) RowID, y, rand1 FROM dbo.tb_Rand100'; 


EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'NullValues.foo'
, @input_data_1 = N'SELECT Col1, Col2, Col3 FROM dbo.tb_Nullable';

EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'NullValues.bar'
, @input_data_1 = N'SELECT Col1, Col2, Col3 FROM dbo.tb_Nullable'; 

EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'NullValues.bar'
, @input_data_1 = N'SELECT Col1, Col2, Col3 FROM dbo.tb_Nullable WHERE RowID = 3'; 

EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'Calculator.adder'
, @input_data_1 = N'SELECT 21, 21'; 