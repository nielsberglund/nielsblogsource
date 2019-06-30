


USE ResultData;
GO

SELECT RowID, 1 / ISNULL(ColIntN, 0) AS Calc FROM dbo.tb_Tab1 WHERE RowID = 2;

SELECT * FROM dbo.tb_Tab1 WHERE RowID = 2;

exec sp_execute_external_script
                @language = N'R' ,
                @script = N'Sys.sleep(10)
                d<-42';



exec sp_execute_external_script
                @language = N'R' ,
                @script = N'Sys.sleep(10)
                d<-InputDataSetX',
                @input_data_1 = N'SELECT RowID, ColInt FROM dbo.tb_Tab1';


exec sp_execute_external_script
                @language = N'R' ,
                @script = N'Sys.sleep(10)
                d<-InputDataSet',
                @input_data_1 = N'SELECT RowID, 1 / ISNULL(ColIntN, 0) AS Calc FROM dbo.tb_Tab1';


@input_data_1 = N'SELECT RowID, 1 / ISNULL(ColIntN, 0) AS Calc FROM dbo.tb_Tab1';

SELECT TOP(5) rand1, rand2 FROM dbo.rand_50M

sp_executesql N'SELECT TOP(5) rand1, rand2 FROM dbo.rand_50M'
