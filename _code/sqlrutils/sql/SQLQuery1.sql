

EXEC sp_TestFunc @parallel_outer = NULL,
                 @multiplier_outer = 5

DECLARE @out_val float;

exec sp_execute_external_script
      @language = N'R',
      @script = N'
        iris_dataset <- iris
        iris_dataset$Sepal.Length <- iris_dataset$Sepal.Length * multiplier
        out <- 5.1
      ',
      @params = N'@multiplier float, @out float OUTPUT',
      @multiplier = 5,
      @out = @out_val OUTPUT

      SELECT @out_val
GO

DECLARE @out_val float;

exec sp_execute_external_script
      @language = N'R',
      @script = N'
        iris_dataset <- iris

        setosa <- iris[iris$Species == "setosa",]

        menSepWidth <- mean(setosa$Sepal.Width)

        iris_dataset$Sepal.Length <- iris_dataset$Sepal.Length * multiplier
        OutputDataSet <- data.frame(iris_dataset$Sepal.Length)      
      ',
      @params = N'@multiplier float, @menSepWidth float OUTPUT',
      @multiplier = 5,
      @menSepWidth = @out_val OUTPUT
      WITH RESULT SETS ((SepalLength float));  

SELECT @out_val AS MeanSepWidth