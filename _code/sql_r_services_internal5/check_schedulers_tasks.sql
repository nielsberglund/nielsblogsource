

--check tasks and workers
DECLARE @spid int = 54;
SELECT t.session_id, t.scheduler_id, t.task_address, t.worker_address 
FROM sys.dm_os_tasks t
WHERE t.session_id = @spid;