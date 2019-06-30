EXEC sp_execute_external_script
          @language = N'R'
        , @script = N'
             Sys.sleep(60)
             pid <- Sys.getpid()
             d <- getwd()
             cat(paste0("ProcessId: ", pid))
             cat("\n")
             cat(paste0("WorkDir: ", d))
             cat("\n")
             r <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, 
                           data=InputDataSet)
 
             coef <- r$coefficients
             icept <- coef[1];
             OutputDataSet <- data.frame(pid=pid, nRows=r$nValidObs, 
                                          intercept=icept)'
       , @input_data_1 = N'
              SELECT y, rand1, rand2, rand3, 
                      rand4, rand5 
              FROM dbo.rand_1M'
       
WITH RESULT SETS ((pid BIGINT NOT NULL, nRows BIGINT NOT NULL, intercept FLOAT NULL)
); 


EXEC sp_execute_external_script  @language =N'R',
                                 @script=N'
                                 Sys.sleep(10)
                                 pid <- Sys.getpid()
                                 d <- getwd()
                                 cat(paste0("ProcessId: ", pid))
                                 cat("\n")
                                 cat(paste0("WorkDir: ", d))
                                 cat("\n")
                                 #OutputDataSet<-data.frame(ProcessId=pid,WorkingDir=d)'
--WITH RESULT SETS ((ProcessID int, [WorkingDirectory] nvarchar(1024) not null));


exec sp_execute_external_script
  @language = N'R' ,
  @script = N'print(R.Version()$version)'