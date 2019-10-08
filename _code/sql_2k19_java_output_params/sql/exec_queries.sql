
UPDATE dbo.tb_NullRand10
  SET y = NULL
WHERE RowId = 8  

EXEC sp_execute_external_script @language = N'R'
                                , @script = N'OutputDataSet <- InputDataSet'
                                , @input_data_1 = N'SELECT * FROM dbo.tb_Rand100';

EXEC sp_execute_external_script @language = N'Python'
                                , @script = N'OutputDataSet = InputDataSet'
                                , @input_data_1 = N'SELECT RowID, y, rand1 FROM dbo.tb_Rand100';  





EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'NullValues.foo'
, @input_data_1 = N'SELECT RowID, x, y FROM dbo.tb_NullRand10';

EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'NullValues.bar'
, @input_data_1 = N'SELECT RowID, x, y FROM dbo.tb_NullRand10 WHERE RowID IN(3, 6, 8)';

EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'NullValues.multipler'
, @input_data_1 = N'SELECT RowID, x, y FROM dbo.tb_NullRand10 WHERE RowID NOT IN(3, 6, 8)';

EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'NullValues.multiplier'
, @input_data_1 = N'SELECT RowID, x, y FROM dbo.tb_NullRand10';

EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'NullValues.multiplier2'
, @input_data_1 = N'SELECT RowID, x, y FROM dbo.tb_NullRand10';

EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'NullValues.multiplier3'
, @input_data_1 = N'SELECT RowID, x, y FROM dbo.tb_NullRand10';

EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'NullStringValues.bar'
, @input_data_1 = N'SELECT RowID, Col1 
                    FROM dbo.tb_NullRand10 
                    WHERE RowID IN(4, 5, 8, 9, 10)';

EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'NullStringValues.foo';
                





EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'JavaTest1.helloWorld'
, @input_data_1 = N'SELECT RowID, x, y FROM dbo.tb_NullRand10';

DECLARE @x int = NULL;
DECLARE @y int = 21;

SELECT @x * @y;



SELECT * FROM dbo.tb_NullRand10
