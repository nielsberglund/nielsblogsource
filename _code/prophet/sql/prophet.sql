EXECUTE sp_execute_external_script  
                    @language = N'R'
                  , @script = N'
                      # load prophet
                      library(prophet)
                      # load dplyr, needed for mutate()
                      library(dplyr)

                      # read in the csv data into a data frame
                      df <- read.csv("W:\\nielsb-work\\GitHub-Repos\\prophet\\examples\\example_wp_peyton_manning.csv")

                      # convert the y variable to a natural logarithm
                      df <- mutate(df, y = log(y))

                      # create the model
                      m <- prophet(df)

                      # create a dataframe to fit a forecast into
                      future <- make_future_dataframe(m, periods = 365)

                      # do the forecast
                      forecast <- predict(m, future)

                      # output the resuly of the forecast
                      OutputDataSet <- data.frame(forecast[c("ds", "yhat", "yhat_lower", "yhat_upper")])'
WITH RESULT SETS ((ds datetime, yhat varchar(50), yhat_lower varchar(50), yhat_upper varchar(50)) );

GO