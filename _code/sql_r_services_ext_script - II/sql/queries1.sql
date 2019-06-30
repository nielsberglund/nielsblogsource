

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(3)
                             d <- 42' ;

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(3)
                             d <- 42
							  cat("hello World")' ;

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'#Sys.sleep(5)
                             d <- 42
							 OutputDataSet <- InputDataSet',
                 @input_data_1 = N'SELECT 42';

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'#Sys.sleep(5)
                             d <- 42',
                 @input_data_1 = N'SELECT 42';



EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(3)
                             d <- 42
                             #the function below does not exist
                             nonExistFunc(d)';

SELECT message_id, text FROM sys.messages
WHERE message_id BETWEEN 39000 AND 39999
AND language_id = 1033;

EXEC sp_execute_external_script
                 @language = N'C#' ,
                 @script = N'Sys.sleep(3)
                             d <- 42
                             #the function below does not exist
                             nonExistFunc(d)';



EXECUTE sp_execute_external_script
                 @language=N'R'
               , @script=N'
			               #Sys.sleep(10)
						   d<-42
						    stop("A Very, Very, Very, Very Long Error Happened")'; -- launchpad!CSatelliteCargoContext::SendLogMessage
						                                                           -- launchpad!CSQLSatelliteCommunication::SendAckMessage

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(5)
                             d <- 42',
                 @input_data_1 = N'SELECT 1/ 0';



EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(5)
                             d <- 42',
                 @input_data_1 = N'SELECT 42';


DECLARE @p1 int;
EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd<-42
                     a <- as.integer(3)
                     #myFunc(a)'
               , @params = N'@a int OUTPUT'
               , @a = @p1 OUTPUT
               
SELECT @p1 As OutParam1





SELECT * FROM sys.messages
WHERE message_id = 39004
AND language_id = 1033;

SELECT message_id, text FROM sys.messages
WHERE message_id BETWEEN 39000 AND 39999
AND language_id = 1033;

An external script error occurred: %.*ls%.*ls

An external script error occurred: %.*ls%.*ls

A '%s' script error occurred during execution of 'sp_execute_external_script' with HRESULT 0x%x.


DECLARE @max decimal(18, 8) = 50000000.000000;

DECLARE @min decimal(18, 8) = 0;

DECLARE @val decimal(18, 8) = 12354.50

SELECT (0 / @max)





50000000.000000





DECLARE @errMsg1 nvarchar(max) = N'Error in eval(expr, envir, enclos) : 
  could not find function "nonExistFunc"
Calls: source -> withVisible -> eval -> eval'

RAISERROR('An external script error occurred: %.*ls%.*ls', 16, -1, 100,  @errMsg1, null)

'Error in ScaleR.  Check the output for more information.
Error in eval(expr, envir, enclos) : 
  Error in ScaleR.  Check the output for more information.
Calls: source -> withVisible -> eval -> eval -> .Call
Execution halted'



EXEC sp_executesql N'waitfor delay ''00:00:05''; EXEC myProc;'

sp_helptext sp_executesql
 


