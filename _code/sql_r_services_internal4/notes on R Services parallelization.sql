
/* Create sample data with tables of random data */

SELECT COUNT_BIG(*) -- 181,063,936 rows (add more cross joins if this isn't large enough for your needs)
FROM sys.objects o1
CROSS JOIN sys.objects o2
CROSS JOIN sys.objects o3
CROSS JOIN sys.objects o4


SELECT TOP 1000000
	CAST(ABS(CHECKSUM(NEWID())) % 14 AS INT) y 
	, CAST(ABS(CHECKSUM(NEWID())) % 20 AS INT) rand1
	, CAST(ABS(CHECKSUM(NEWID())) % 25 AS INT) rand2
	, CAST(ABS(CHECKSUM(NEWID())) % 14 AS INT) rand3
	, CAST(ABS(CHECKSUM(NEWID())) % 50 AS INT) rand4
	, CAST(ABS(CHECKSUM(NEWID())) % 100 AS INT) rand5
	INTO dbo.rand_1M
FROM sys.objects o1
CROSS JOIN sys.objects o2
CROSS JOIN sys.objects o3
CROSS JOIN sys.objects o4
GO -- 2 seconds


SELECT TOP 10000000
	CAST(ABS(CHECKSUM(NEWID())) % 14 AS INT) y 
	, CAST(ABS(CHECKSUM(NEWID())) % 20 AS INT) rand1
	, CAST(ABS(CHECKSUM(NEWID())) % 25 AS INT) rand2
	, CAST(ABS(CHECKSUM(NEWID())) % 14 AS INT) rand3
	, CAST(ABS(CHECKSUM(NEWID())) % 50 AS INT) rand4
	, CAST(ABS(CHECKSUM(NEWID())) % 100 AS INT) rand5
	INTO dbo.rand_10M
FROM sys.objects o1
CROSS JOIN sys.objects o2
CROSS JOIN sys.objects o3
CROSS JOIN sys.objects o4
GO -- 26 seconds

SELECT TOP 50000000
	CAST(ABS(CHECKSUM(NEWID())) % 14 AS INT) y 
	, CAST(ABS(CHECKSUM(NEWID())) % 20 AS INT) rand1
	, CAST(ABS(CHECKSUM(NEWID())) % 25 AS INT) rand2
	, CAST(ABS(CHECKSUM(NEWID())) % 14 AS INT) rand3
	, CAST(ABS(CHECKSUM(NEWID())) % 50 AS INT) rand4
	, CAST(ABS(CHECKSUM(NEWID())) % 100 AS INT) rand5
	INTO dbo.rand_50M
FROM sys.objects o1
CROSS JOIN sys.objects o2
CROSS JOIN sys.objects o3
CROSS JOIN sys.objects o4
GO -- 230 seconds


SET STATISTICS TIME ON
GO

/*
	There are 2 "main" ways to trigger parallelization for MRS.

		1) Using @parallel / @r_rowsPerRead with sp_execute_external_script (Enterprise Edition required)
			a) MRS will create N processes where N is the MAXDOP setting (SQL Server won't always respect MAXDOP)
			b) InputDataSet (default dataset name) will contain all rows given to that SQL Server thread if @r_rowsPerRead is not set.
			   If @r_rowsPerRead is set, InputDataSet will be of length <= @r_rowsPerRead

			The example below of using rxLinMod does not make a lot of sense. This is running lots and lots of linear regressions and
			you aren't able to finely control the data in each call. The real use for something like this should be for something
			that is trivially parallelizable / related to data simulation.
*/

/****************************************/
-- Launch multiple processes by using @parallel=1 and changing MAXDOP

EXEC sp_execute_external_script
	@language = N'R'
	, @script = N'
		pid <- Sys.getpid()
		cat(paste0("ProcessId: ", pid))
		cat("\n")
		
		r <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, data=InputDataSet, verbose=1)
		# print(r)
		
		coef <- r$coefficients
		OutputDataSet <- data.frame(pid=pid, nRows=r$nValidObs, intercept=coef[1])
	'
	, @parallel=1
	, @input_data_1 = N'
			SELECT * FROM rand_50M OPTION (MAXDOP 4)
		'
	-- , @params = N'@r_rowsPerRead int'
	-- , @r_rowsPerRead = 100000
WITH RESULT SETS (
	(pid INT NOT NULL,
		nRows INT NOT NULL,
		intercept FLOAT NULL
	)
); 
-- 13,542 ms (MAXDOP 4); 4 rows returned
--  9,068 ms (MAXDOP 8); 8 rows returned

/****************************************/
-- Launch multiple processes by using @parallel=1 and changing MAXDOP
-- Also set @r_rowsPerRead to stream the data in batches

EXEC sp_execute_external_script
	@language = N'R'
	, @script = N'
		pid <- Sys.getpid()
		cat(paste0("ProcessId: ", pid))
		cat("\n")
		
		r <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, data=InputDataSet, verbose=1)
		# print(r)
		
		coef <- r$coefficients
		OutputDataSet <- data.frame(pid=pid, nRows=r$nValidObs, intercept=coef[1])
	'
	, @parallel=1
	, @input_data_1 = N'
			SELECT * FROM rand_50M OPTION (MAXDOP 4)
		'
	, @params = N'@r_rowsPerRead int'
	 , @r_rowsPerRead = 100000
WITH RESULT SETS (
	(pid INT NOT NULL,
		nRows INT NOT NULL,
		intercept FLOAT NULL
	)
);
-- 16,096 ms (MAXDOP 4; rowsPerRead=100,000); 502 rows returned

-- Viewing the *actual* execution plan here is very interesting.
-- You can see the "UDX" (sp_execute_external_script) is *before* the parallelism gather streams operator

/****************************************/
/****************************************/
/****************************************/


/*
	There are 2 "main" ways to trigger parallelization for MRS.

		2) Using RxInSqlServer and setting numTasks (note: this will also change the query passed to RxSqlServerData and add in OPTION (MAXDOP #numTasks#) at the end)
			a) This is indirectly creating a local MPI context and passing chunks of data to each launched R process
*/

EXEC sp_execute_external_script
	@language = N'R'
	, @script = N'
		sqlConnString <- "Driver=SQL Server;Server=.;Database=MrCalcDb;Trusted_Connection=True"

		sqlComputeTrace <- RxInSqlServer(   
			 connectionString = sqlConnString,
			 numTasks = 1)  
		rxSetComputeContext( sqlComputeTrace)

		ds <- RxSqlServerData(connectionString=sqlConnString, sqlQuery="SELECT * FROM rand_50M", rowsPerRead=100000)

		r <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, data=ds, verbose=1, reportProgress=3)
		print(r)
	' -- 44,905 ms (MAXDOP 1)
	-- No real changes when MAXDOP=1


EXEC sp_execute_external_script
	@language = N'R'
	, @script = N'
		sqlConnString <- "Driver=SQL Server;Server=.;Database=MrCalcDb;Trusted_Connection=True"

		sqlComputeTrace <- RxInSqlServer(   
			 connectionString = sqlConnString,
			 numTasks = 2)  
		rxSetComputeContext( sqlComputeTrace)

		ds <- RxSqlServerData(connectionString=sqlConnString, sqlQuery="SELECT * FROM rand_50M", rowsPerRead=100000)

		r <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, data=ds, verbose=1, reportProgress=3)
		print(r)
	' -- 24,062 ms (MAXDOP 2)
	-- Note: you'll see that a local MPI context was setup (mpiexec.exe)
	/*
	C:\Program Files\Microsoft MPI\Bin\mpiexec.exe
		Command line:   -n 2 "E:\SQL\SQL\MSSQL13.MSSQLSERVER\R_SERVICES\bin\x64\rterm.exe" --no-restore --no-save -q -e "stopifnot(require(RevoScaleR) || stop(.libPaths())); rxRemoteCall()" --args "rxCommArgs(rxCommType='MPI',rxComputeWhere='masterNode',rxNetworkShareJobDirectory='E:/SQL/SQL/MSSQL13.MSSQLSERVER/MSSQL/ExtensibilityData/MSSQLSERVER01/A6027C3F-0D11-4A57-9493-0C8D6EE41459/work',sessionId='70C7E9D2-5020-4776-B402-E5681FCE4593',port=57402,sqlSatellitePath='E:\\SQL\\SQL\\MSSQL13.MSSQLSERVER\\MSSQL\\Binn\\sqlsatellite.dll',pipeName='DataSet1_1Col_Int_1Row',logPath='',rxClusterTarget='sqlserver')"
		Current dir: E:\SQL\SQL\MSSQL13.MSSQLSERVER\MSSQL\ExtensibilityData\MSSQLSERVER01\A6027C3F-0D11-4A57-9493-0C8D6EE41459\

		C:\Program Files\Microsoft MPI\Bin\smpd.exe (Microsoft MPI Process Manager)
			Command line: "C:\Program Files\Microsoft MPI\bin\smpd.exe" -p 8677 -d 0 -mgr 216 "job" -localonly
			Current dir: E:\SQL\SQL\MSSQL13.MSSQLSERVER\MSSQL\ExtensibilityData\MSSQLSERVER01\B8843461-D074-47AA-BCEB-64E4BB973092\

			2 Rterm.exe (+BxlServer, +conhost.exe sub-processes)
	*/

EXEC sp_execute_external_script
	@language = N'R'
	, @script = N'
		sqlConnString <- "Driver=SQL Server;Server=.;Database=MrCalcDb;Trusted_Connection=True"

		sqlComputeTrace <- RxInSqlServer(   
			 connectionString = sqlConnString,
			 numTasks = 4)  
		rxSetComputeContext( sqlComputeTrace)

		ds <- RxSqlServerData(connectionString=sqlConnString, sqlQuery="SELECT * FROM rand_50M", rowsPerRead=100000)

		r <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, data=ds, verbose=1, reportProgress=3)
		print(r)
	' -- 14,870 ms (MAXDOP 4)
	-- 4 workers created below mpiexec.exe

EXEC sp_execute_external_script
	@language = N'R'
	, @script = N'
		sqlConnString <- "Driver=SQL Server;Server=.;Database=MrCalcDb;Trusted_Connection=True"

		sqlComputeTrace <- RxInSqlServer(   
			 connectionString = sqlConnString,
			 numTasks = 8)  
		rxSetComputeContext( sqlComputeTrace)

		ds <- RxSqlServerData(connectionString=sqlConnString, sqlQuery="SELECT * FROM rand_50M", rowsPerRead=100000)

		r <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, data=ds, verbose=1, reportProgress=3)
		print(r)
	' -- 11,946 ms (MAXDOP 8)
	-- 8 workers created below mpiexec.exe

