

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(5)
                             d <- 42';



EXEC sp_execute_external_script
                @language = N'R' ,
                @script = N'Sys.sleep(5)
                            d<-42
							cat("Hello World")';




EXEC sp_execute_external_script
                @language = N'R' ,
                @script = N'Sys.sleep(10)
                            d<-42
							cat("A very, very, very long string to see if the packet sizes differ")';

							
EXEC sp_execute_external_script
                @language = N'R' ,
                @script = N'Sys.sleep(10)
                            d<-42

							e <- 1/0

							cat("Hello World")
							d<-59';
EXECUTE sp_execute_external_script
                 @language=N'R'
               , @script=N'
			               Sys.sleep(10)
						   d<-42
						   nonFunction()'

EXECUTE sp_execute_external_script
                 @language=N'R'
               , @script=N'
			               Sys.sleep(10)
						   d<-42
						    stop("A Very, Very, Very, Very Long Error Happened")'; -- launchpad!CSatelliteCargoContext::SendLogMessage
						                                                           -- launchpad!CSQLSatelliteCommunication::SendAckMessage

						   
EXECUTE sp_execute_external_script
                 @language=N'R'
               , @script=N'
			               #Sys.sleep(10)
						   d<-42'; -- launchpad!CSQLSatelliteCommunication::SendAckMessage

EXECUTE sp_execute_external_script
                 @language=N'R'
               , @script=N'
			               #Sys.sleep(10)
						   cat("Hello World")
						   d<-42'; -- launchpad!CSatelliteCargoContext::SendLogMessage
						           -- launchpad!CSQLSatelliteCommunication::SendAckMessage


EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'#Sys.sleep(10)
                             d <- 42
                             #the function below does not exist
                             nonExistFunc(d)';

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(1)
                             d <- 42',
                 @input_data_1 = N'SELECT 1/ 0';
