
SELECT * FROM sys.databases

EXECUTE sp_execute_external_script @language = N'Python',
                                   @script = N'print(42)'

EXEC sp_configure 'external scripts enabled', 1
RECONFIGURE WITH OVERRIDE

EXEC sp_configure 'external scripts enabled'
