

SELECT xp.name PackageName, xp.Description PackageDesc, 
       lm.name ModuleName, lm.description ModuleDesc
FROM sys.dm_xe_packages xp
JOIN sys.dm_os_loaded_modules lm
  ON xp.module_address = lm.base_address
WHERE xp.name LIKE '%satellite%'

SELECT xp.name PackageName, xp.Description PackageDesc
FROM sys.dm_xe_packages xp
JOIN sys.dm_os_loaded_modules lm
  ON xp.module_address = lm.base_address
WHERE xp.name LIKE '%satellite%'

SELECT xo.name EventName, xo.description EventDesc, 
       xp.name PackageName 
FROM sys.dm_xe_objects xo
JOIN sys.dm_xe_packages xp
  ON xo.package_guid = xp.guid
WHERE object_type = 'event'
  AND xp.name = 'SQLSatellite'

SELECT xo.*
FROM sys.dm_xe_objects xo
JOIN sys.dm_xe_packages xp
  ON xo.package_guid = xp.guid
WHERE object_type = 'event'
  AND xp.name = 'SQLSatellite'

IF EXISTS(SELECT 1 
          FROM sys.server_event_sessions 
          WHERE name='SatelliteTest1')
BEGIN
  DROP EVENT SESSION SatelliteTest1 ON SERVER;
END
GO
           

CREATE EVENT SESSION [SatelliteTest1] ON SERVER 
  ADD EVENT SQLSatellite.satellite_authentication_completion,
  ADD EVENT SQLSatellite.satellite_authorization_completion,
  ADD EVENT SQLSatellite.satellite_schema_sent,
  ADD EVENT SQLSatellite.satellite_schema_received,
  ADD EVENT SQLSatellite.satellite_data_send_start,
  ADD EVENT SQLSatellite.satellite_data_send_completion,
  ADD EVENT SQLSatellite.satellite_data_receive_completion,
  ADD EVENT SQLSatellite.satellite_data_chunk_sent,
  ADD EVENT SQLSatellite.satellite_service_start_posted,
  ADD EVENT SQLSatellite.satellite_message_summary,
  ADD EVENT SQLSatellite.satellite_abort_sent,
  ADD EVENT SQLSatellite.satellite_abort_received,
  ADD EVENT SQLSatellite.satellite_abort_connection,
  ADD EVENT SQLSatellite.extensibility_session_snapshot,
  ADD EVENT SQLSatellite.satellite_error,
  ADD EVENT SQLSatellite.trace_event,
  ADD EVENT SQLSatellite.satellite_outputArgument_received
  ADD TARGET package0.ring_buffer
GO




ALTER EVENT SESSION SatelliteTest1
ON SERVER STATE = STOP 
GO 

EXEC sp_execute_external_script 
              @language = N'R'
            , @script = N'd <- 42'

SELECT CAST(stargets.target_data AS XML) AS targetdata
FROM sys.dm_xe_session_targets stargets 
INNER JOIN sys.dm_xe_sessions sessions 
ON sessions.address = stargets.event_session_address 
WHERE sessions.name = 'SatelliteTest1' 
  AND stargets.target_name = 'ring_buffer';

ALTER EVENT SESSION SatelliteTest1
ON SERVER STATE = START
GO 

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'd <- 42
                             cat("Hello World")';

EXECUTE sp_execute_external_script
                 @language=N'R'
               , @script=N'
			               Sys.sleep(10)
						   d<-42
						    stop("A Very, Very, Very, Very Long Error Happened")';

EXEC sp_execute_external_script 
              @language = N'R'
            , @script = N'OutputDataSet <- InputDataSet'
            , @input_data_1 = N'SELECT TOP(5) * FROM dbo.tb_Rand_3M'

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(1)
                             d <- 42',
                 @input_data_1 = N'SELECT 1/ 0';


EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'#Sys.sleep(10)
                             d <- 42
                             #the function below does not exist
                             nonExistFunc(d)';

WITH cte
AS
(
SELECT CAST(stargets.target_data AS XML) AS targetdata
FROM sys.dm_xe_session_targets stargets 
INNER JOIN sys.dm_xe_sessions sessions 
ON sessions.address = stargets.event_session_address 
WHERE sessions.name = 'SatelliteTest1' 
  AND stargets.target_name = 'ring_buffer'
)
SELECT T.c.value('@name[1]', 'varchar(128)') AS [name],
       T.c.value('@timestamp[1]', 'datetime') AS [timestamp]
FROM cte
CROSS APPLY targetdata.nodes('/RingBufferTarget/event') AS T(c)

ALTER EVENT SESSION SatelliteTest1
ON SERVER STATE = STOP 
GO 

ALTER EVENT SESSION SatelliteTest1
ON SERVER STATE = START
GO 


IF EXISTS(SELECT 1 
          FROM sys.server_event_sessions 
          WHERE name='SatelliteTest1')
BEGIN
  DROP EVENT SESSION SatelliteTest1 ON SERVER;
END
GO

CREATE EVENT SESSION [SatelliteTest1] ON SERVER 
  ADD EVENT SQLSatellite.satellite_authentication_completion,
  ADD EVENT SQLSatellite.satellite_authorization_completion,
  ADD EVENT SQLSatellite.satellite_cleanup,
  ADD EVENT SQLSatellite.launchpad_launch_start,
  ADD EVENT SQLSatellite.launchpad_resume_sent
  ADD TARGET package0.event_file
             (
               SET filename = 'C:\ExtLogs\SatelliteTest1.xel',
               max_file_size = 5
             )
WITH(MAX_DISPATCH_LATENCY = 2 SECONDS);

ALTER EVENT SESSION SatelliteTest1
ON SERVER STATE = START
GO 

EXEC sp_execute_external_script 
              @language = N'R'
            , @script = N'd <- 42'


IF EXISTS(SELECT 1 
          FROM sys.server_event_sessions 
          WHERE name='SatelliteTest2')
BEGIN
  DROP EVENT SESSION SatelliteTest2 ON SERVER;
END
GO
           

CREATE EVENT SESSION [SatelliteTest2] ON SERVER 
  ADD EVENT SQLSatellite.satellite_authentication_completion,
  ADD EVENT SQLSatellite.satellite_authorization_completion,
  ADD EVENT SQLSatellite.connection_accept,
  ADD EVENT SQLSatellite.external_resource_pool,
  ADD EVENT SQLSatellite.extensibility_error_ring_buffer_record,
  ADD EVENT SQLSatellite.satellite_unexpected_message_received,
  ADD EVENT SQLSatellite.stack_trace,
  ADD EVENT SQLSatellite.satellite_message_ring_buffer_record,
  ADD EVENT SQLSatellite.satellite_sessionId_mismatch,
  ADD EVENT SQLSatellite.satellite_invalid_sized_message,
  ADD EVENT SQLSatellite.satellite_message_version_mismatch,
  ADD EVENT SQLSatellite.satellite_partial_message,
  ADD EVENT SQLSatellite.satellite_message_coalesced,
  ADD EVENT SQLSatellite.extensibility_session_snapshot,
  ADD EVENT SQLSatellite.failed_launching,
  ADD EVENT SQLSatellite.satellite_messaging,
  ADD EVENT SQLSatellite.trace_event
  ADD TARGET package0.event_file
             (
               SET filename = 'C:\ExtLogs\SatelliteTest2.xel',
               max_file_size = 5
             )
WITH(MAX_DISPATCH_LATENCY = 2 SECONDS);
GO

ALTER EVENT SESSION SatelliteTest2
ON SERVER STATE = START 
GO 


EXEC sp_execute_external_script 
              @language = N'R'
            , @script = N'd <- 42'

EXEC sp_execute_external_script 
              @language = N'R'
            , @script = N'OutputDataSet <- InputDataSet'
            , @input_data_1 = N'SELECT * FROM sys.databases'

EXEC sp_execute_external_script
      @language = N'R' ,
      @script = N'Sys.sleep(1)
                  d <- 42',
      @input_data_1 = N'SELECT 1/ 0';

EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'#Sys.sleep(10)
                             d <- 42
                             #the function below does not exist
                             nonExistFunc(d)';

IF EXISTS(SELECT 1 
          FROM sys.server_event_sessions 
          WHERE name='SatelliteTest1')
BEGIN
  DROP EVENT SESSION SatelliteTest1 ON SERVER;
END
GO

CREATE EVENT SESSION [SatelliteTest1] ON SERVER
  ADD EVENT SQLSatellite.failed_launching,
  ADD EVENT SQLSatellite.satellite_authentication_completion,
  ADD EVENT SQLSatellite.satellite_authorization_completion,
  ADD EVENT SQLSatellite.satellite_service_start_posted,
  ADD EVENT SQLSatellite.trace_event,
  ADD EVENT SQLSatellite.satellite_data_send_start,
  ADD EVENT SQLSatellite.satellite_data_chunk_sent,
  ADD EVENT SQLSatellite.satellite_data_send_completion,
  ADD EVENT SQLSatellite.satellite_schema_received,
  ADD EVENT SQLSatellite.satellite_outputArgument_received,
  ADD EVENT SQLSatellite.satellite_abort_sent,
  ADD EVENT SQLSatellite.satellite_abort_received,
  ADD EVENT SQLSatellite.satellite_abort_connection
  ADD TARGET package0.event_file
             (
               SET filename = 'C:\ExtLogs\SatelliteTest1.xel',
               max_file_size = 5
             )
WITH(MAX_DISPATCH_LATENCY = 2 SECONDS);
GO

ALTER EVENT SESSION SatelliteTest1
ON SERVER STATE = START 
GO


ALTER EVENT SESSION SatelliteTest1
ON SERVER STATE = STOP 
GO 

 

EXEC sp_execute_external_script 
              @language = N'R'
            , @script = N'OutputDataSet <- InputDataSet'
            , @input_data_1 = N'SELECT name, database_id 
                                FROM sys.databases'



CREATE TABLE #xeventsflow(RowID int identity primary key,
                          Process nvarchar(25),
                          XEvent nvarchar(128),
                          EventTime datetime2)

INSERT INTO #xeventsflow
VALUES ('SQL Server', 'satellite_authentication_completion', '2018-04-07 09:13:02.2280239')
, ('SQL Server', 'satellite_authorization_completion',	'2018-04-07 09:13:02.2280560')
, ('SQL Server', 'satellite_service_start_posted', '2018-04-07 09:13:02.2281049')
, ('SQL Server', 'satellite_authentication_completion',	'2018-04-07 09:13:03.5802255')
, ('SQL Server', 'satellite_authorization_completion',	'2018-04-07 09:13:03.5802517')
, ('SQL Server', 'satellite_data_send_start',	'2018-04-07 09:13:03.5814295')
, ('SQL Server', 'satellite_data_chunk_sent',	'2018-04-07 09:13:03.5814306')
, ('SQL Server', 'satellite_data_chunk_sent',	'2018-04-07 09:13:03.5814373')
, ('SQL Server', 'satellite_data_send_completion',	'2018-04-07 09:13:03.5814378')
, ('SQL Server', 'satellite_schema_received',	'2018-04-07 09:13:03.5848922')
, ('SQL Server', 'satellite_outputArgument_received',	'2018-04-07 09:13:03.5851280')
, ('SQL Server', 'satellite_abort_sent',	'2018-04-07 09:13:03.5851613')
, ('SQL Server', 'satellite_abort_connection',	'2018-04-07 09:13:03.5851753')
, ('SQL Server', 'satellite_abort_sent',	'2018-04-07 09:13:03.5852001')
, ('SQL Server', 'satellite_abort_connection',	'2018-04-07 09:13:03.5852685')
, ('SQL Server', 'satellite_abort_connection',	'2018-04-07 09:13:03.6004637')
, ('SQL Server', 'satellite_abort_connection',	'2018-04-07 09:13:03.6005040')


, ('Launchpad', 'trace_event', '2018-04-07 09:12:44.3213994')
, ('Launchpad', 'trace_event', '	2018-04-07 09:12:44.7249928')
, ('Launchpad', 'satellite_authentication_completion', '2018-04-07 09:13:02.2279279')
, ('Launchpad', 'satellite_messaging', '2018-04-07 09:13:02.2283337')
, ('Launchpad', 'satellite_messaging', '2018-04-07 09:13:02.2283356')
, ('Launchpad', 'launchpad_launch_start', '2018-04-07 09:13:02.2283377')
, ('Launchpad', 'satellite_messaging', '2018-04-07 09:13:02.2429006')
, ('Launchpad', 'satellite_messaging', '2018-04-07 09:13:02.2429028')
, ('Launchpad', 'launchpad_resume_sent', '2018-04-07 09:13:02.2429145')
, ('Launchpad', 'satellite_messaging', '2018-04-07 09:13:03.5853871')
, ('Launchpad', 'satellite_messaging', '2018-04-07 09:13:03.5853892')
, ('Launchpad', 'satellite_messaging', '2018-04-07 09:13:03.6004677')


, ('BxlServer', 'trace_event', '2018-04-07 09:13:03.5710696')
, ('BxlServer', 'satellite_authentication_completion', '2018-04-07 09:13:03.5801975')
, ('BxlServer', 'satellite_data_receive_completion', '2018-04-07 09:13:03.5816356')
, ('BxlServer', 'satellite_schema_sent', '2018-04-07 09:13:03.5848755')
, ('BxlServer', 'satellite_outputArgument_sent', '2018-04-07 09:13:03.5851200')
, ('BxlServer', 'satellite_abort_connection', '2018-04-07 09:13:03.5853630')
, ('BxlServer', 'satellite_cleanup', '2018-04-07 09:13:03.5853645')
, ('BxlServer', 'satellite_abort_connection', '2018-04-07 09:13:03.5854188')


SELECT * FROM #xeventsflow ORDER BY EventTime

TRUNCATE TABLE #xeventsflow




