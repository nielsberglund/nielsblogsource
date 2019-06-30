


EXEC sp_execute_external_script   @language = N'R'
                                , @script = N'

".test" <- function(maxVal)
{i <- 0
  while(i < maxVal)
  {
    i = i + 1
                                          
  }
  return(i)   
}

res <- rxExec(.test, 75000000)

OutputDataSet <- data.frame(res)'
GO

EXEC sp_execute_external_script   @language = N'R'
                                , @script = N'

".test" <- function(maxVal)
{i <- 0
  while(i < maxVal)
  {
    i = i + 1
                                          
  }
  return(i)   
}
sqlConnString <- "Driver=SQL Server;Server=.\\inst2k17; Database=master;uid=sa;pwd=sapwd"
sqlCtx <- RxInSqlServer(connectionString = sqlConnString, numTasks = 4) 
rxSetComputeContext(sqlCtx)

res <- rxExec(.test, 75000000)

OutputDataSet <- data.frame(res)'


