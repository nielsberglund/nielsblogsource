



DECLARE @out_val float;

DECLARE @scriptP nvarchar(max) = N'
        iris_dataset <- iris
        setosa <- iris[iris$Species == "setosa",]
        OutputDataSet <- data.frame(iris_dataset$Sepal.Length)'

exec sp_execute_external_script @language = N'R',
                                @script = @scriptP
                             

exec sp_execute_external_script
      @language = N'R',
      @script = N'
        iris_dataset <- iris
        setosa <- iris[iris$Species == "setosa",]
        OutputDataSet <- data.frame(iris_dataset$Sepal.Length)'

exec sp_execute_external_script
      @language = N'R',
      @script = N'

        OutputDataSet <- iris'
        

SELECT @out_val AS MeanSepWidth


exec sp_execute_external_script
      @language = N'R',
      @script = N'source("C:\\rscripts\\iris.r")'


      EXEC sys.sp_execute_external_script
     @language = N'R'
    ,@script = N'
       b <- data.frame(Num_V1 = c(1,2,3))
       OutputDataSet <- b'
    ,@input_data_1 = N'SELECT 1 AS Nmbrs_From_R'

WITH RESULT SETS ((Numbers_From_R INT));



C:\\rscripts\\iris.r

exec sp_execute_external_script
      @language = N'R',
      @script = N'
        iris_dataset <- iris
        setosa <- iris[iris$Species == "setosa",]

        menSepWidth <- mean(setosa$Sepal.Width)

        #iris_dataset$Sepal.Length <- iris_dataset$Sepal.Length * multiplier
        OutputDataSet <- data.frame(iris_dataset$Sepal.Length)      
      ',
      @params = N'@multiplier float, @menSepWidth float OUTPUT',
      @multiplier = 5,
      @menSepWidth = @out_val OUTPUT
      WITH RESULT SETS ((SepalLength float));  

SELECT @out_val AS MeanSepWidth


SELECT TOP 1000 number FROM master..spt_values

SELECT TOP 1
 (SELECT TOP 1 number FROM master..spt_values WHERE type IN ('EOB') ORDER BY NEWID()) AS V1
FROM master..spt_values
GO 50

SELECT TOP 1000000 * FROM master..spt_values 


exec sp_execute_external_script
                      @language = N'R',
                      @script = N'
                        iris_dataset <- iris
                        setosa <- iris[iris$Species == "setosa",]
                        meanSepWidth <- mean(setosa$Sepal.Width)
                        cat(paste("Seposa sepal mean width: ", meanSepWidth))';

DECLARE @scriptParam nvarchar(max) =  N'iris_dataset <- iris
                        setosa <- iris[iris$Species == "setosa",]
                        meanSepWidth <- mean(setosa$Sepal.Width)
                        cat(paste("Seposa sepal mean width: ", meanSepWidth))';

Exec sp_execute_external_script
                      @language = N'R',
                      @script = @scriptParam;

EXEC sp_execute_external_script
                      @language = N'R',
                      @script = N'source("c:\\rscripts\\iris.r")';



EXEC sp_execute_external_script
                      @language = N'R',
                      @script = N'source("c:\\rscripts\\iris.r")',
                      @input_data_1_name = N'In',
                      @output_data_1_name = N'Out';


EXECUTE sp_executesql  
          @stmt = 'SELECT * FROM sys.databases  
          WHERE database_id > @dbId',  
          @params = N'@dbId tinyint',  
          @dbId = 1;  


SELECT * FROM sys.databases

CREATE PROCEDURE dbo.pr_TestProc @inParam nvarchar(50)
AS
SET NOCOUNT ON;

SELECT @inParam AS InParameter;



EXEC dbo.pr_TestProc @inParam = 


EXEC sp_execute_external_script
                      @language = N'R',
                      @script = N'iris_dataset <- iris',
                      @output_data_1_name = N'iris_dataset'


ALTER FUNCTION dbo.fn_GetIris(@species nvarchar(15))
RETURNS TABLE
AS

RETURN (SELECT * FROM dbo.tb_irisdata_full WHERE Species = @species);


SELECT * FROM dbo.fn_GetIris()

DECLARE @spec nvarchar(15) = N'setosa'
exec sp_execute_external_script
                @language = N'R',
                @script = N'
                    iris_dataset <- iris_data_set
                    OutputDataSet = iris_dataset',
                @input_data_1 = N'SELECT * FROM dbo.fn_GetIris(@species1)',
                @input_data_1_name = N'iris_data_set',
                @params = N'@species1 nvarchar(15)',
                @species1 = @spec

DECLARE @spec nvarchar(15) = N'setosa'
exec sp_execute_external_script
                @language = N'R',
                @script = N'
                    iris_dataset <- iris_data_set
                    OutputDataSet = iris_dataset',
                @input_data_1 = N'SELECT * FROM dbo.fn_GetIris(@species1) UNION ALL SELECT * FROM dbo.fn_GetIris(@species1)',
                @input_data_1_name = N'iris_data_set',
                @params = N'@species1 nvarchar(15)',
                @species1 = @spec


exec sp_execute_external_script
                @language = N'R',
                @script = N'
                    iris_dataset <- iris_data_set
                    setosa <- iris[iris$Species == "setosa",]
                    meanSepWidth <- mean(setosa$Sepal.Width)
                    cat(paste("Seposa sepal mean width: ", meanSepWidth))',
                @input_data_1 = N'SELECT * FROM dbo.fn_GetIris()',
                @input_data_1_name = N'iris_data_set'

EXEC sp_execute_external_script
            @language = N'R',
            @script = N'
                iris_dataset <- InputDataSet
                setosa <- iris_dataset[iris_dataset$Species == "setosa",]
                meanSepWidth <- mean(setosa$SepalWidth)
                cat(paste("Seposa sepal mean width: ", meanSepWidth))',
            @input_data_1 = N'SELECT * FROM dbo.tb_irisdata_full';

EXEC sp_execute_external_script
            @language = N'R',
            @script = N'
                iris_dataset <- InputDataSet
                setosa <- iris_dataset[iris_dataset$Species == "setosa",]
                meanSepWidth <- mean(setosa$SepalWidth)
                cat(paste("Seposa sepal mean width: ", meanSepWidth))',
            @input_data_1 = N'SELECT * FROM dbo.tb_irisdata_even; SELECT * FROM dbo.tb_irisdata_uneven';

EXEC sp_execute_external_script
            @language = N'R',
            @script = N'
                iris_dataset <- InputDataSet
                setosa <- iris_dataset[iris_dataset$Species == "setosa",]
                meanSepWidth <- mean(setosa$SepalWidth)
                cat(paste("Seposa sepal mean width: ", meanSepWidth))',
            @input_data_1 = N'SELECT * FROM dbo.tb_irisdata_even UNION SELECT * FROM dbo.tb_irisdata_uneven';

EXEC sp_execute_external_script
        @language = N'R',
        @script = N'
          # set up connection string       
          sqlConnString <- "Driver=SQL Server;server=win10-dev;
                            database=IrisTestDb;uid=<some_uid>;pwd=<some_pwd>"
          
          # define the data
          mydata <- RxSqlServerData(table = NULL, 
                                    sqlQuery = "SELECT * 
                                    FROM dbo.tb_irisdata_uneven", 
                                    connectionString = sqlConnString)

          # open the dataset
          rxOpen(mydata)

          # read the data
          iris_uneven <- rxReadNext(mydata)
          versicolor <- iris_uneven[iris_uneven$Species == "versicolor",]
          meanSepWidthVersi <- mean(versicolor$SepalWidth)
          
          # get the data from the inout data set
          iris_dataset <- InputDataSet
          setosa <- iris_dataset[iris_dataset$Species == "setosa",]
          meanSepWidth <- mean(setosa$SepalWidth)

          # output the data
          cat(paste("Seposa sepal mean width:", meanSepWidth, ".", 
                     "Versicolor sepal mean width:", meanSepWidthVersi))',
        @input_data_1 = N'SELECT * FROM dbo.tb_irisdata_even';
 
 
EXEC sp_execute_external_script
            @language = N'R',
            @script = N'
                iris_dataset <- InputDataSet
                setosa <- iris_dataset[iris_dataset$Species == "setosa",]
                meanSepWidth <- mean(setosa$SepalWidth)
                cat(paste("Seposa sepal mean width: ", meanSepWidth))',
            @input_data_1 = N'SELECT * FROM dbo.tb_irisdata_full';                

EXEC sp_execute_external_script
            @language = N'R',
            @script = N'
                iris_dataset <- MyDataSet
                setosa <- iris_dataset[iris_dataset$Species == "setosa",]
                meanSepWidth <- mean(setosa$SepalWidth)
                cat(paste("Seposa sepal mean width: ", meanSepWidth))
                
                multiplier <- 5
                iris_dataset$SepalLength <- iris_dataset$SepalLength * multiplier
                OutputDataSet <- data.frame(iris_dataset$SepalLength)   
                
                ',
            @input_data_1 = N'SELECT * FROM dbo.tb_irisdata_full',
            @input_data_1_name = N'MyDataSet'



EXEC sp_execute_external_script
      @language = N'R',
      @script = N'
          iris_dataset <- MyDataSet
          setosa <- iris_dataset[iris_dataset$Species == "setosa",]
          meanSepWidth <- mean(setosa$SepalWidth)
          cat(paste("Seposa sepal mean width: ", meanSepWidth))
          multiplier <- 5
          iris_dataset$SepalLength <- iris_dataset$SepalLength * multiplier
          SepalLengthMult <- data.frame(iris_dataset$SepalLength)',
      @input_data_1 = N'SELECT * FROM dbo.tb_irisdata_full',
      @input_data_1_name = N'MyDataSet',
      @output_data_1_name = N'SepalLengthMult'
WITH RESULT SETS ((LengthMultiplied float));  