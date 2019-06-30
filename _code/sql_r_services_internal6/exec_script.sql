EXEC sp_execute_external_script  @language =N'R',
                                 @script=N'
                                 pid <- Sys.getpid()
                                 d <- getwd()
                                 cat(paste0("WorkDir: ", d))
                                 cat("\n")
                                 #Sys.sleep(10)
                                 OutputDataSet<-data.frame(ProcessId=pid,WorkingDir=d)'
WITH RESULT SETS ((ProcessID int, [WorkingDirectory] nvarchar(1024) not null));

