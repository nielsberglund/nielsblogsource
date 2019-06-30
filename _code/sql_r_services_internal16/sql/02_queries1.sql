

USE ResultData;
GO

--60730

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-42';


EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(20)
				             OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(2) rand1 FROM dbo.rand_1M' --2051    --51
WITH RESULT SETS((rand1 int));

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' --2051    --51
WITH RESULT SETS((rand1 int, rand2 varchar(50)));

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' --2051    --51

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(10) 
				             OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(2) rand1 FROM dbo.rand_1M' --2051    --51


EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(2) rand1 FROM dbo.rand_1M' --2055

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1, rand2 FROM dbo.rand_1M' -- 4074 2023 --69

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(2) rand1, rand2 FROM dbo.rand_1M' -- 4074 2023 --69

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1, rand2, rand3 FROM dbo.rand_1M' -- 6097 2023 --87

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT 42 AS rand1' -- 6097 2023 --87


EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(6000) rand1, rand2, rand3 FROM dbo.rand_1M' -- 6097 2023

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) colvchar2 FROM dbo.Test1' -- 35 66

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(2) colvchar2 FROM dbo.Test1' -- 38 72



EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) coltiny FROM dbo.Test3' -- 2051 2055

EXEC sp_execute_external_script
				@language = N'R' ,
				@script = N'OutputDataSet<-InputDataSet'
			  , @input_data_1 = N'SELECT TOP(2) colsmallint FROM dbo.Test3' -- 2051 2055

EXEC sp_execute_external_script
				@language = N'R' ,
				@script = N'OutputDataSet<-InputDataSet'
			  , @input_data_1 = N'SELECT TOP(2) colreal FROM dbo.Test3' -- 1078 1086

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(2) colbigint FROM dbo.Test3' -- 1078 1086

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(2) colfloat FROM dbo.Test3' -- 1078 1086

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(2) colfloatsmall FROM dbo.Test3' -- 1078 1086

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(2) coldec FROM dbo.Test3' -- 1078 1086

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(2) coldec2 FROM dbo.Test3' -- 1078 1086

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(2) colmoney FROM dbo.Test3' -- 1078 1086

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) colmoney, coldec FROM dbo.Test3' -- 2128

UPDATE dbo.Test1
SET colvchar1 = 'A'

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) colvchar1 FROM dbo.Test1' -- 35 66

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(2) colvchar1 FROM dbo.Test1' -- 38 72

UPDATE dbo.Test1
SET colvchar1 = 'AB'

EXEC sp_execute_external_script
				@language = N'R' ,
				@script = N'OutputDataSet<-InputDataSet'
			  , @input_data_1 = N'SELECT TOP(1) colvchar1 FROM dbo.Test1' -- 36 68 --51

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(2) colvchar1 FROM dbo.Test1' -- 38 72
 


EXEC sp_execute_external_script
				@language = N'R' ,
				@script = N'OutputDataSet<-InputDataSet'
			   , @input_data_1 = N'SELECT TOP(1) colvchar1, colvchar2 FROM dbo.Test1' -- 70, 104  --69

EXEC sp_execute_external_script
				@language = N'R' ,
				@script = N'OutputDataSet<-InputDataSet'
			   , @input_data_1 = N'SELECT TOP(1) colvchar1, colvchar2, colvchar3 FROM dbo.Test1' -- 105, 142 --87

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet;cat("Hello")'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' -- 8120 2023

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' --2051
WITH RESULT SETS ((rand1 int NOT NULL));  

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(820) rand1  FROM dbo.rand_1M'

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(2000) rand1  FROM dbo.rand_1M'

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(16360) rand1  FROM dbo.rand_1M'

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(16370) rand1  FROM dbo.rand_1M'

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(16374) rand1  FROM dbo.rand_1M' 

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(16375) rand1  FROM dbo.rand_1M'

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(16376) rand1  FROM dbo.rand_1M'

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(16377) rand1  FROM dbo.rand_1M'

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(16400) rand1  FROM dbo.rand_1M' 

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(32800) rand1  FROM dbo.rand_1M' 

SELECT 16400 * 4
65600
SELECT 65536 + 128

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(16800) rand1  FROM dbo.rand_1M' 


SELECT (1460 - 32) / 4 = 357

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(357) rand1  FROM dbo.rand_1M'

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(16735) rand1 FROM dbo.rand_1M'

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(20000) rand1 FROM dbo.rand_1M'



EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(2) rand1 FROM dbo.rand_1M'

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(16400) rand1  FROM dbo.rand_1M'


EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) colint  FROM [dbo].[test1]'

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(32800) rand1  FROM dbo.rand_1M'

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(2) rand1, rand2 FROM dbo.rand_1M'

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M'

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) colint FROM dbo.Test1'

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) colint2 FROM dbo.Test1'

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) colint2, colint3 FROM dbo.Test1'


58021
