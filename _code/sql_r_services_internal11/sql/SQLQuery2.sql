EXEC sp_execute_external_script  
               @language =N'R',
               @script=N'
               Sys.sleep(90)
               pid <- Sys.getpid()
               d <- getwd()
               cat(paste0("ProcessId: ", pid))
               cat("\n")
               cat(paste0("WorkDir: ", d))
               cat("\n")
               OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT name, database_id, compatibility_level FROM sys.databases'
WITH RESULT SETS ((DBName nvarchar(50), [DBId] int, CompLevel int));



                  