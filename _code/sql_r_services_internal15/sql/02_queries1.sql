

USE ResultData;
GO

sp_executesql N'SELECT TOP(820) rand1  FROM dbo.rand_1M' == 4170 2 packets


sp_executesql N'SELECT TOP(200) rand1, rand2  FROM dbo.rand_1M' == 1880 1 packet

sp_executesql N'SELECT TOP(400) rand1, rand2  FROM dbo.rand_1M' == 3680 (80 + 3200 + 400) 1 packet

sp_executesql N'SELECT TOP(500) rand1, rand2  FROM dbo.rand_1M' == 4588 (80 + 4000 + 500 + 8) 2 packets


sp_executesql N'SELECT TOP(1640) rand1  FROM dbo.rand_1M' == 8278 (62 + 6560 + 1640) == 8262  


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
               , @input_data_1 = N'SELECT TOP(16360) rand1  FROM dbo.rand_1M' 65472

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(16370) rand1  FROM dbo.rand_1M' 65512

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(16374) rand1  FROM dbo.rand_1M' 65528

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(16375) rand1  FROM dbo.rand_1M' 65532

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(16376) rand1  FROM dbo.rand_1M' 65536 + 32

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(16377) rand1  FROM dbo.rand_1M' 65536 + 36

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(16400) rand1  FROM dbo.rand_1M' 65536 + 128

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
               , @input_data_1 = N'SELECT TOP(16800) rand1  FROM dbo.rand_1M' 65536 + 36


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

SELECT 9 * 1460

SELECT 13140 + 164 + 52224 + 232 = 65760
SELECT 14528 + 65536 = 80064

SELECT 32800 * 4


SELECT 65760 + 65536 = 131296

131296

SELECT 1296 + 164

SELECT 16376 + 357 = 16733

SELECT 16735 * 4

SELECT 65536 / 1460


65536 164 1304


EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(2) rand1 FROM dbo.rand_1M'

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(16400) rand1  FROM dbo.rand_1M' 65536 + 128


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