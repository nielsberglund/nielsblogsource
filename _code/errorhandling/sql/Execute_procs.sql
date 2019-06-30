USE ErrTestDB;
GO

SET NOCOUNT ON;
GO
--instructions
-- 1. run the script 01_create_db.sql
-- 2. run the script 02_create_old_style_procs.sql
-- 3. execute the statement below:
EXEC dbo.pr_Caller;

-- 4. look what the output is in the message tab
-- 5. run the script 03_edit_pr_1_to_new_errorhandling.sql to change one of the procs to use the new error handling
-- 6. execute the statement below:
EXEC dbo.pr_Caller;

--as you can see some of the cleanup code was not executed, and it seems the error-handling in pr_Caller
--is not working properly

-- 7. run the script 04_edit_pr_1_to_use_RETURN.sql to fix the issue with pr_Caller
-- 8. make sure it works by executing:
EXEC dbo.pr_Caller;

-- 9. run the script 05_edit_pr_3_to_use_THROW.sql. This script changes pr_3 to use new error handling and THROW
--    it also changes pr_1 to SELECT out ERROR_MESSAGE and ERROR_NUMBER

-- 10. execute the statement below:
EXEC dbo.pr_Caller;

-- 11. run the script 06_edit_pr_1_to_use_THROW.sql. This edits pr_1 to use THROW

-- 12. execute the statement below:
EXEC dbo.pr_Caller;

-- notice how nothing appears from pr_caller. If THROW is used and no calling proc uses BEGIN TRY, execution will just stop.

