IF (OBJECT_ID('sp_TestFunc') IS NOT NULL)
DROP PROCEDURE sp_TestFunc
GO
CREATE PROCEDURE sp_TestFunc
  @parallel_outer bit = 0,
  @multiplier_outer float,
  @out_outer float output
AS
  BEGIN TRY
    exec sp_execute_external_script
      @language = N'R',
      @script = N'
        testfunc <- function (multiplier) 
        {
            iris_dataset <- iris
            iris_dataset$Sepal.Length <- iris_dataset$Sepal.Length * 
                multiplier
            out <- 5.1
            return(iris_dataset)
        }
        result <- testfunc(multiplier = multiplier)
        if (is.list(result)) {
          OutputDataSet <- result$iris_dataset
          out <- result$out
        } else stop("the R function must return a list")
      ',
      @parallel = @parallel_outer,
      @params = N'@multiplier float, @out float output',
      @multiplier = @multiplier_outer,
      @out = @out_outer output
  END TRY
  BEGIN CATCH
    THROW;
  END CATCH;
GO
