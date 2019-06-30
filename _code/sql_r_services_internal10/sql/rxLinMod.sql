EXEC sp_execute_external_script
          @language = N'R'
        , @script = N'
             Sys.sleep(30)
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
              SELECT TOP(1) y, rand1, rand2, rand3, 
                      rand4, rand5 
              FROM dbo.rand_1M'
       
WITH RESULT SETS ((pid BIGINT NOT NULL, nRows BIGINT NOT NULL, intercept FLOAT NULL)
); 


exec sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(10); d<-42'
               , @input_data_1 = N'SELECT TOP(1) y, rand1, rand2, rand3, rand4, rand5 FROM dbo.rand_1M'

exec sp_execute_external_script
    @language = N'R' ,
    @script = N'Sys.sleep(10); 
          d<-42'

exec sp_execute_external_script
    @language = N'R' ,
    @script = N'Sys.sleep(10) 
           d<-42'
  , @input_data_1 = N'SELECT 42'


exec sp_execute_external_script
    @language = N'R' ,
    @script = N'Sys.sleep(10) 
           d<-42'
  , @input_data_1 = N'
  SELECT TOP(1) y, rand1, rand2, rand3, 
            rand4, rand5 
  FROM dbo.rand_1M'


exec sp_execute_external_script
    @language = N'R' ,
    @script = N'Sys.sleep(10) 
           d<-42'
  , @input_data_1 = N'
  SELECT TOP(1) rand1, rand2, rand3 FROM dbo.rand_1M'


exec sp_execute_external_script
    @language = N'R' ,
    @script = N'Sys.sleep(10) 
           d<-42'
  , @input_data_1 = N'SELECT 42, 100, 200'

exec sp_execute_external_script
    @language = N'R' ,
    @script = N'Sys.sleep(10); d<-42'
  , @input_data_1 = N'SELECT 1'



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
  @script = N'Sys.sleep(30)
             d<-42
             a<-d
             c<-a
             print(R.Version()$version)'

exec sp_execute_external_script
  @language = N'R' ,
  @script = N'Sys.sleep(30)
            d<-42'

EXEC sp_execute_external_script  @language =N'R',
                                 @script=N'
                                 Sys.sleep(10)
                                 pid <- Sys.getpid()
                                 d <- getwd()
                                 cat(paste0("ProcessId: ", pid))
                                 cat("\n")
                                 cat(paste0("WorkDir: ", d))
                                 cat("\n")'



DECLARE @s nvarchar(max) = N'
             Sys.sleep(30)
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

SELECT datalength(@s)

SELECT 1480 - 1094


EXEC sp_execute_external_script 
                    @language =N'R',
                    @script=N'Sys.sleep(10)
                       d<-42
                       OutputDataSet<-InputDataSet',
                    @input_data_1 =N'SELECT 42 as col1, 666 AS col2'
WITH RESULT SETS (([TheAnswer] int, [TheDevil] int));
GO

DROP TABLE IF EXISTS dbo.tb_Test1
CREATE TABLE dbo.tb_Test1(ID int, col1 int, col2 bigint, col3 bigint)

DROP TABLE IF EXISTS dbo.tb_Test2
CREATE TABLE dbo.tb_Test2(ID int NOT NULL, col1 int NOT NULL, col2 bigint NOT NULL, col3 bigint NOT NULL)

INSERT INTO dbo.tb_Test1
VALUES (1, 5, 100, 10000000),
       (2, 6, 101, 10000001),
       (3, 7, 102, 10000002),
       (4, 8, 103, 10000003),
       (5, 9, 104, 10000004),
       (6, 10, 105, 10000005),
       (7, 11, 106, 10000006);

INSERT INTO dbo.tb_Test2
VALUES (1, 5, 100, 10000000),
       (2, 6, 101, 10000001),
       (3, 7, 102, 10000002),
       (4, 8, 103, 10000003),
       (5, 9, 104, 10000004),
       (6, 10, 105, 10000005),
       (7, 11, 106, 10000006);


exec sp_execute_external_script
    @language = N'R' ,
    @script = N'Sys.sleep(10) 
           d<-42'
  , @input_data_1 = N'
  SELECT TOP(2) col2 FROM dbo.tb_Test1'

  exec sp_execute_external_script
    @language = N'R' ,
    @script = N'Sys.sleep(10) 
           d<-42'
  , @input_data_1 = N'
  SELECT TOP(1) col2, NULL as colx FROM dbo.tb_Test2'



exec sp_execute_external_script
    @language = N'R' ,
    @script = N'Sys.sleep(10) 
           d<-42'
  , @input_data_1 = N'
  SELECT TOP(1) rand1, rand2 FROM dbo.rand_1M'


SELECT TOP(1) rand1, rand2, rand3 FROM dbo.rand_1M