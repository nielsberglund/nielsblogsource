DROP EVENT SESSION [LaunchpadStart] ON SERVER 

CREATE EVENT SESSION [LaunchpadStart] ON SERVER 
ADD EVENT SQLSatellite.launchpad_launch_start(
    ACTION(sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.sql_text)),
ADD EVENT SQLSatellite.launchpad_resume_sent(
    ACTION(sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.sql_text)),
ADD EVENT SQLSatellite.satellite_authentication_completion(
    ACTION(sqlserver.client_hostname,sqlserver.database_name,sqlserver.sql_text)),
ADD EVENT SQLSatellite.satellite_authorization_completion(
    ACTION(sqlserver.client_hostname,sqlserver.sql_text,sqlserver.username)),
ADD EVENT SQLSatellite.satellite_data_send_start(
    ACTION(sqlserver.client_hostname,sqlserver.sql_text,sqlserver.username))
ADD TARGET package0.ring_buffer
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=OFF)
GO

ALTER EVENT SESSION LaunchpadStart
ON SERVER STATE = START 
GO 


EXEC sp_execute_external_script   @language = N'R'
                                , @script = N'OutputDataSet <- InputDataSet' 
                                , @input_data_1 = N'SELECT 42'

SELECT *

FROM sys.dm_os_ring_buffers
WHERE record LIKE '%LaunchPad%'


SELECT CAST(stargets.target_data AS XML) AS targetdata
--INTO #capture_launchpad
FROM sys.dm_xe_session_targets stargets 
INNER JOIN sys.dm_xe_sessions sessions 
ON sessions.address = stargets.event_session_address 
WHERE sessions.name = 'LaunchpadStart' 
  AND stargets.target_name = 'ring_buffer'
GO

SELECT * FROM  #capture_launchpad


SELECT o.name AS event_name, o.description
FROM sys.dm_xe_objects o
JOIN sys.dm_xe_packages p
ON o.package_guid = p.guid
WHERE o.object_type = 'event'
AND p.name = 'SQLSatellite';



SELECT xed.event_data.value('(@timestamp)[1]', 'datetime2') AS [timestamp],
  xed.event_data.value('(data[@name="wait_type"]/text)[1]', 'varchar(25)') AS wait_type, 
  xed.event_data.value('(data[@name="duration"]/value)[1]', 'int') AS wait_type_duration_ms, 
  xed.event_data.value('(data[@name="signal_duration"]/value)[1]', 'int') AS wait_type_signal_duration_ms 
FROM #capture_launchpad
  CROSS APPLY targetdata.nodes('//RingBufferTarget/event') AS xed (event_data);

SELECT xed.event_data.value('(@timestamp)[1]', 'datetime2') AS [timestamp],
       xed.event_data.value('(action[@name="sql_text"]/value)[1]', 'varchar(4000)') AS sql_text
FROM #capture_launchpad
  CROSS APPLY targetdata.nodes('//RingBufferTarget/event') AS xed (event_data);




CREATE EVENT SESSION [LaunchpadStart] ON SERVER 
ADD EVENT SQLSatellite.launchpad_launch_start(
    ACTION(sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.sql_text)),
ADD EVENT SQLSatellite.launchpad_resume_sent(
    ACTION(sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.sql_text)),
ADD EVENT SQLSatellite.satellite_authentication_completion(
    ACTION(sqlserver.client_hostname,sqlserver.database_name,sqlserver.sql_text)),
ADD EVENT SQLSatellite.satellite_authorization_completion(
    ACTION(sqlserver.client_hostname,sqlserver.sql_text,sqlserver.username)),
ADD EVENT SQLSatellite.satellite_data_send_start(
    ACTION(sqlserver.client_hostname,sqlserver.sql_text,sqlserver.username))
ADD TARGET package0.ring_buffer
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=OFF)
GO