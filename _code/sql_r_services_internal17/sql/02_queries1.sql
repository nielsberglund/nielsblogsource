

USE ResultData;
GO

--60730

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-42';

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(10)
				            d<-42',
				 @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' --2051    --51

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(30)
				             d<-42
				             OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' --2051    --51

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(60)
				             OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' --2051    --51


EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(60)
				             OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' --2051    --51
WITH RESULT SETS((rand1 int));

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'#Sys.sleep(30) 
				             OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' --2051    --51
WITH RESULT SETS((rand1 int, rand2 varchar(50)));


sp_executesql N'SELECT TOP(1) rand1, rand2 FROM dbo.rand_1M' 

sp_executesql N'SELECT 1/0 FROM dbo.rand_1M' 


...C.4.............8.r.a.n.d.1.Ñ....ÿ..Á.........y....þ..à.........


...%.4........... .4.Ñ4.ý..Á.........