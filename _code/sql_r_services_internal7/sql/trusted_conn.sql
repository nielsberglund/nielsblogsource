

SELECT * FROM sys.tables

SELECT TOP(1) * FROM dbo.tb_CountryExport


EXEC sp_execute_external_script
        @language = N'R'
        , @script = N'
        con <- "Server=win10-dev;Database=RTest;Trusted_Connection=true";
        sql <- RxInSqlServer(connectionString = con, shareDir = "c:\\TMP");
        local <- RxLocalSeq(sql);
        rxSetComputeContext(local)
        ff <- RxSqlServerData(sqlQuery = "select top(1) * FROM dbo.tb_CountryExport", connectionString = con);
        t = rxImport(ff);
        OutputDataSet <- data.frame(SUCCESS = TRUE);
        '
    WITH RESULT SETS (([SUCCESS] BIT))