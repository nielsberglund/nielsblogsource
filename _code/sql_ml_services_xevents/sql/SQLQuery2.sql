
SELECT xp.name PackageName, xp.Description PackageDesc, 
       lm.name ModuleName, lm.description ModuleDesc
FROM sys.dm_xe_packages xp
JOIN sys.dm_os_loaded_modules lm
  ON xp.module_address = lm.base_address



SELECT xo.name EventName, xo.description EventDescn, 
       xp.name PackageName 
FROM sys.dm_xe_objects xo
JOIN sys.dm_xe_packages xp
  ON xo.package_guid = xp.guid
WHERE object_type = 'event'
  AND xo.name LIKE '%completed%'



SELECT xo.name [Action], xo.description ActionDesc
FROM sys.dm_xe_objects xo
WHERE object_type = 'action'

SELECT xo.name [Target], xo.description TargetDesc
FROM sys.dm_xe_objects xo
WHERE object_type = 'target'

SELECT * FROM sys.dm_xe_session_event_actions

WHERE object_type = 'event'
  AND name LIKE '%satellite%'

SELECT xp.name PackageName, xp.Description, lm.name ModuleName, lm.description ModuleDesc
FROM sys.dm_xe_packages xp
JOIN sys.dm_os_loaded_modules lm
  ON xp.module_address = lm.base_address




SELECT oc.name ColumnName, oc.column_id,
       oc.object_name Event 
FROM sys.dm_xe_object_columns oc
JOIN sys.dm_xe_objects xo
  ON oc.object_name = xo.name
WHERE xo.object_type = 'event'
  AND oc.object_name = 'sql_statement_completed'


SELECT *
FROM sys.dm_xe_object_columns oc


SELECT * FROM sys.dm_os_loaded_modules



SELECT * FROM sys.dm_xe_session_events



IF EXISTS(SELECT 1 
          FROM sys.server_event_sessions 
          WHERE name='SimpleTest')
BEGIN
  DROP EVENT SESSION SimpleTest ON SERVER;
END
GO

CREATE EVENT SESSION SimpleTest ON SERVER
  ADD EVENT sqlserver.sql_statement_completed
  ADD TARGET package0.event_file
             (
               SET filename = 'C:\ExtLogs\SimpleTest.xel',
               max_file_size = 5
             );
GO

ALTER EVENT SESSION SimpleTest
ON SERVER STATE = START 
GO 


SELECT * FROM sys.databases


SELECT CAST(stargets.target_data AS XML) AS targetdata
--INTO #capture_launchpad
FROM sys.dm_xe_session_targets stargets 
INNER JOIN sys.dm_xe_sessions sessions 
ON sessions.address = stargets.event_session_address 
WHERE sessions.name = 'SimpleTest' 
  AND stargets.target_name = 'ring_buffer'

ALTER EVENT SESSION SimpleTest
ON SERVER STATE = STOP 
GO 

ALTER EVENT SESSION SimpleTest ON SERVER
  DROP TARGET package0.ring_buffer

ALTER EVENT SESSION SimpleTest ON SERVER
  ADD TARGET package0.event_file
             (
               SET filename = 'C:\ExtLogs\SimpleTest.xel',
               max_file_size = 5
             );
GO


ALTER EVENT SESSION SimpleTest
ON SERVER STATE = START 
GO

SELECT * FROM sys.databases