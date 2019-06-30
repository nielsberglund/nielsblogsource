
SELECT * FROM sys.databases


EXEC sp_execute_external_script  @language =N'R',
                                 @script=N'a<-42;
								 b<-a*2;
								 OutputDataSet<-InputDataSet;',
								 @input_data_1 =N'SELECT 42, 666'
WITH RESULT SETS (([TheAnswer] int not null, TheDevil int));
GO

EXEC sp_execute_external_script  @language =N'R',
                                 @script=N'
								 Sys.sleep(20)
                 OutputDataSet<-InputDataSet
                 Sys.Sleepx(5)
								 ',
                                 @input_data_1 =N'SELECT 42'
      WITH RESULT SETS (([TheAnswer] int not null));
GO

sp_helptext sp_execute_external_script

select * from sys.extended_procedures

SELECT * FROM sys.dm_external_script_requests;

SELECT * FROM sys.dm_external_script_execution_stats

SELECT * FROM sys.dm_exec_sessions

SELECT * FROM sys.dm_os_performance_counters 

SELECT * from sys.dm_os_performance_counters WHERE object_name LIKE '%Extended%'




DECLARE @counter int = 0;
DECLARE @maxLoops int = 20;

WAITFOR DELAY '00:00:03'

WHILE (@counter < @maxLoops)
BEGIN

EXEC sp_execute_external_script  @language =N'R',
                                 @script=N'OutputDataSet<-InputDataSet',
                                 @input_data_1 =N'SELECT 42'
WITH RESULT SETS (([TheAnswer] int not null));


SET @counter += 1;
END



EXEC sp_execute_external_script  @language =N'R',
                                 @script=N'
                                 pid <- Sys.getpid()
                                 #Sys.sleep(45)
                                 cat(paste0("ProcessId: ", pid))
                                 cat("\n")
                                 #Sys.sleep(150)
                                 d <- getwd()
                                 OutputDataSet<-data.frame(ProcessId=pid,WorkingDir=d)'
WITH RESULT SETS ((ProcessID int, [WorkingDirectory] nvarchar(1024) not null));