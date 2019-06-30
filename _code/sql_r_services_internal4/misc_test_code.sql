

EXEC sp_execute_external_script 
                    @language =N'R',
                    @script=N'OutputDataSet<-InputDataSet;
                              Sys.sleep(120);',
                    @input_data_1 =N'SELECT 42'
WITH RESULT SETS (([TheAnswer] int not null));




EXEC sp_execute_external_script  @language =N'R',
                                 @script=N'
                                 pid <- Sys.getpid()
                                 cat(paste0("ProcessId: ", pid))
		                             cat("\n")
                                 Sys.sleep(120);
                                 d <- getwd();
                                 OutputDataSet<-data.frame(WorkingDir=d, ProcessId=pid)'
WITH RESULT SETS (([WorkingDirectory] nvarchar(1024) not null, ProcessId int));


EXEC sp_execute_external_script  @language =N'R',
                                 @script=N'
                                 pid <- Sys.getpid()
                                 cat(paste0("ProcessId: ", pid))
		                             cat("\n")
                                 Sys.sleep(30);
                                 d <- getwd();
                                 OutputDataSet<-data.frame(WorkingDir=d, ProcessId=pid)'
WITH RESULT SETS (([WorkingDirectory] nvarchar(1024) not null, ProcessId int));


EXEC sp_execute_external_script 
                    @language =N'R',
                    @script=N'
                    pid <- Sys.getpid()
                    wd <- getwd()
                    data<-InputDataSet
                    data$pid <- pid
                    data$wd <- wd
                    OutputDataSet<-data;
                    Sys.sleep(120);',
                    @input_data_1 =N'SELECT 42'
WITH RESULT SETS (([TheAnswer] int not null, ProcessID int, WorkingDirectory nvarchar(1024)));