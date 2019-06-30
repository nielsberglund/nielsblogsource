

USE TestParallel;
GO

SET NOCOUNT ON;
GO

EXEC sp_execute_external_script
	@language = N'R'
	, @script = N'
    #Sys.sleep(15)
		pid <- Sys.getpid()
		r <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, data=InputDataSet, verbose=1)
    #r <- lm(y ~ rand1 + rand2 + rand3 + rand4 + rand5, data=InputDataSet)
		# print(r)
		
		coef <- r$coefficients
    icept <- r$coefficients[1]
		OutputDataSet <- data.frame(pid=pid, intercept=icept)
	'
	--, @parallel=1
	, @input_data_1 = N'
			SELECT  y, rand1, rand2, rand3, rand4, rand5 FROM dbo.rand_30M'
	--, @params = N'@r_rowsPerRead int'
	--, @r_rowsPerRead = 10000000
WITH RESULT SETS (
	(pid INT NOT NULL,
		--nRows INT NOT NULL,
		intercept FLOAT NULL
	)
); 

DECLARE @start datetime2 = SYSUTCDATETIME();
EXEC sp_execute_external_script
          @language = N'R'
        , @script = N'
            #Sys.sleep(30)
             pid <- Sys.getpid()
             r <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, 
                           data=InputDataSet)
 
             coef <- r$coefficients
             icept <- coef[1];
              OutputDataSet <- data.frame(pid=pid, nRows=r$nValidObs, 
                                          intercept=icept)'
        , @input_data_1 = N'
              SELECT  y, rand1, rand2, rand3, 
                      rand4, rand5 
              FROM dbo.rand_30M'
        , @parallel=1
        --, @params = N'@r_rowsPerRead int'
	      --, @r_rowsPerRead = 100000
WITH RESULT SETS ((pid INT NOT NULL, nRows INT NOT NULL, intercept FLOAT NULL)
); 
SELECT DATEDIFF(ms, @start, SYSUTCDATETIME()) AS ElapsedTime;
GO

DECLARE @start datetime2 = SYSUTCDATETIME();
EXEC sp_execute_external_script
          @language = N'R'
        , @script = N'
            #Sys.sleep(30)
             pid <- Sys.getpid()

             sqlConnString <- "Driver=SQL Server;Server=.;Database=TestParallel2;uid=sa;pwd=sapwd"

		         sqlComputeTrace <- RxInSqlServer(connectionString = sqlConnString, numTasks = 4)  
		         rxSetComputeContext( sqlComputeTrace)
             ds <- RxSqlServerData(connectionString=sqlConnString, sqlQuery="SELECT * FROM rand_30M", rowsPerRead=100000)

             r <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, 
                           data=ds)
 
             coef <- r$coefficients
             icept <- coef[1];
              OutputDataSet <- data.frame(pid=pid, nRows=r$nValidObs, 
                                          intercept=icept)'
        --, @input_data_1 = N'
             -- SELECT  y, rand1, rand2, rand3, 
                      --rand4, rand5 
              --FROM dbo.rand_30M'
        --, @parallel=1
        --, @params = N'@r_rowsPerRead int'
	      --, @r_rowsPerRead = 100000
WITH RESULT SETS ((pid INT NOT NULL, nRows INT NOT NULL, intercept FLOAT NULL)
); 
SELECT DATEDIFF(ms, @start, SYSUTCDATETIME()) AS ElapsedTime;