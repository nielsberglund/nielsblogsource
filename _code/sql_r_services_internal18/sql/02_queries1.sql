

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
                 @script = N'd<-42
				             OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' --2051    --51

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(30)
				             OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' --2051    --51


EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'#Sys.sleep(40)
				             OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' --2051    --51
WITH RESULT SETS((Column1 int));

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'#Sys.sleep(40)
				             OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' --2051    --51
WITH RESULT SETS((Column1 int, ExtraColumn int));


EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(40)
				             OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' --2051    --51
WITH RESULT SETS UNDEFINED

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'#Sys.sleep(40)
				             OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' --2051    --51
WITH RESULT SETS NONE

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'#Sys.sleep(40) 
				             OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' --2051    --51
WITH RESULT SETS((rand1 int, rand2 varchar(50)));


EXEC sp_executesql N'SELECT TOP(1) rand1 FROM dbo.rand_1M' 
WITH RESULT SETS((Column1 int, rand2 varchar(50)));

sp_executesql N'SELECT 1/0 FROM dbo.rand_1M' 


EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-42
				             OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' --2051    --51

DECLARE @p1 float;
EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-42
				             a <- 3
				             OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' --2051    --51  --61
               , @params = N'@a float OUTPUT'
               , @a = @p1 OUTPUT
WITH RESULT SETS((ResultSet1 int));
SELECT @p1 As OutParam1




DECLARE @p1 int;
EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-42
				             a <- as.integer(3)
				             OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' --2051    --51  --61
               , @params = N'@a int OUTPUT'
               , @a = @p1 OUTPUT
WITH RESULT SETS((ResultSet1 int));
SELECT @p1 As OutParam1


DECLARE @p2 int 
DECLARE @p3 varchar(10);
EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-42
				             #outParam <- d
							 a <- as.integer(3)
							 b <- "abcd"
				             OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' --2051    --51 --94
               , @params = N'@a int OUTPUT, @b varchar(10) OUTPUT'
               , @a = @p2 OUTPUT
			   , @b = @p3 OUTPUT
WITH RESULT SETS((ResultSet1 int));
SELECT @p2 AS IntParam, @p3 AS StringParam

DECLARE @p4 int; 
DECLARE @p5 int;
DECLARE @p6 int;
EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-42
				             #outParam <- d
							 o <- as.integer(3)
							 p <- as.integer(5)
							 q <- as.integer(7)
				             OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' --2051    --51 --127
               , @params = N'@o int OUTPUT, @p int OUTPUT, @q int OUTPUT'
               , @o = @p4 OUTPUT
			   , @p = @p5 OUTPUT
			   , @q = @p6 OUTPUT

SELECT @p4, @p5, @p6




DECLARE @p2 varchar(50);
EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-42
				             a <- "ab"
				             OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' --2051    --51
               , @params = N'@a varchar(50) OUTPUT'
               , @a = @p2 OUTPUT
WITH RESULT SETS((ResultSet1 int));
SELECT @p2 As OutParam1





EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-42
				             stop("an error happened")
				             OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' --2051    --51


EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-42
				             print("an error happened")
				             #OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' --2051    --51




...C.4.............8.r.a.n.d.1.Ñ....ÿ..Á.........y....þ..à.........


...%.4........... .4.Ñ4.ý..Á.........


EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(15)
				             d<-42
				             OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' --2051    --51

DECLARE @p1 float;
EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(10)
				             d<-42
				             a <- 3
				             OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' --2051    --51  --61
               , @params = N'@a float OUTPUT'
               , @a = @p1 OUTPUT
WITH RESULT SETS((ResultSet1 int));
SELECT @p1 As OutParam1

DECLARE @p2 int 
DECLARE @p3 int;
EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(15)
				             d<-42
				             #outParam <- d
							 a <- as.integer(3)
							 b <- as.integer(5)
				             OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M' --2051    --51 --94
               , @params = N'@a int OUTPUT, @b int OUTPUT'
               , @a = @p2 OUTPUT
			   , @b = @p3 OUTPUT
WITH RESULT SETS((ResultSet1 int));
SELECT @p2 AS IntParam1, @p3 AS IntParam2