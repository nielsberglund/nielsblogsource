---
layout: demopage
title: "XACT_ABORT Demo Code"
date: 2017-01-08T11:41:55+02:00
---

This is demo code for XACT_ABORT.
### Instructions

1. run the script 01_create_db.sql
2. run the script 02_setup_tables_and_insert_data.sql
3. run the script 03_tx_with_fk_exception.sql
    * notice how an exception happens, but we still have data in the table
4. run the script 04_tx_with_fk_exception_and_XACT_ABORT_ON.sql which introduces `XACT_ABORT`
    * at this stage there won't be any data in the table
5. run the script 05_create_procedures.sql to create some procedures not using any error handling
6. run the script Execute_procedures.sql, and see the output, as well as the result from the `SELECT` statement
7. run the script 06_create__error_handling_procedures.sql to create some procedures using "old" style error handling
8. run the script Execute_procedures.sql, and see the output, as well as the result from the `SELECT` statement
9. run the script 07_edit_pr_1_to use XACT_ABORT.sql to let `dbo.pr_1` use `XACT_ABORT`.
10. run the script Execute_procedures.sql, and see the output, as well as the result from the `SELECT` statement
11. run the script 08_raiserror.sql to edit `dbo.pr_3` to use `RAISERROR`.
12. run the script Execute_procedures.sql, and see the output, as well as the result from the `SELECT` statement
13. run the script 09_pr_3_with_try_catch.sql to edit `dbo.pr_3` to use `TRY ... CATCH`.
14. run the script Execute_procedures.sql, and see the output, as well as the result from the `SELECT` statement
15. run the script 10_edit_pr_1_to_use_try_catch_and pr_3_to back_to_original.sql to let `dbo.pr_1` use `try ... catch` and edit `dbo.pr_3` back to original.
16. run the script Execute_procedures.sql, and see the output, as well as the result from the `SELECT` statement

