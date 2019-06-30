EXECUTE sp_execute_external_script  
           @language = N'R'
         , @script = N'OutputDataSet <- data.frame(.libPaths());'
WITH RESULT SETS (([DefaultLibraryName] VARCHAR(MAX) NOT NULL));
GO

C:/Program Files/Microsoft SQL Server/MSSQL14.INST2K17CTP20/R_SERVICES/library


EXECUTE sp_execute_external_script  
           @language = N'R'
         , @script = N'
              library("rstan")
              fx <- inline::cxxfunction( signature(x = "integer", y = "numeric" ) , 
            ''return ScalarReal( INTEGER(x)[0] * REAL(y)[0] ) ;'')

            res <-fx(2L, 5)
            cat(paste0("Result: ", res))
		        cat("\n")'
WITH RESULT SETS (([DefaultLibraryName] VARCHAR(MAX) NOT NULL));
GO


EXECUTE sp_execute_external_script  
           @language = N'R'
         , @script = N'
              library("rstan")
              fx <- inline::cxxfunction( signature(x = "integer", y = "numeric" ) , 
            ''return ScalarReal( INTEGER(x)[0] * REAL(y)[0] ) ;'')

            res <-fx(2L, 5)
            cat(paste0("Result: ", res))
		        cat("\n")'



EXECUTE sp_execute_external_script  
                    @language = N'R'
                  , @script = N'
                      # load prophet
                      library(prophet)
                      # load dplyr, needed for mutate()
                      library(dplyr)

                      # read in the csv data into a data frame
                      df <- read.csv("W:\\nielsb-work\\GitHub-Repos\\prophet\\examples\\example_wp_peyton_manning.csv")

                      df <- mutate(df, y = log(y))

                      m <- prophet(df)

                      future <- make_future_dataframe(m, periods = 365, freq = "d")

                      # do the forecast
                      forecast <- predict(m, future)

                      OutputDataSet <- data.frame(forecast[c("ds", "yhat", "yhat_lower", "yhat_upper")])'
             
WITH RESULT SETS ((ds datetime, yhat varchar(50), yhat_lower varchar(50), yhat_upper varchar(50)) );

GO