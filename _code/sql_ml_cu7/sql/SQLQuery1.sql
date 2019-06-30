

EXEC sp_execute_external_script   @language = N'R'
                                , @script = N'OutputDataSet = InputDataSet'
                                , @input_data_1 = N'SELECT 42 AS RValue'

EXEC sp_execute_external_script   @language = N'Python'
                                , @script = N'OutputDataSet = InputDataSet'
                                , @input_data_1 = N'SELECT 1 AS PythonValue'
