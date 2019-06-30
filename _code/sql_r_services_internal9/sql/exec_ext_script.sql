EXEC sp_execute_external_script 
                    @language =N'R',
                    @script=N'OutputDataSet<-InputDataSet;
                              Sys.sleep(240);',
                    @input_data_1 =N'SELECT 42'
WITH RESULT SETS (([TheAnswer] int not null));