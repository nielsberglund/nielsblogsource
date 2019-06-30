

# set up the connection string
sqlServerConnString <- "Driver=SQL Server;server=.\\inst2k17;database=testParallel;uid=sa;pwd=sapwd"

# set up a compute context
sqlCtx <- RxInSqlServer(connectionString = sqlServerConnString, numTasks = 1)
# set the compute context to be the sql context
rxSetComputeContext(sqlCtx)

mydata <- RxSqlServerData(sqlQuery = "SELECT y, rand1, rand2, rand3, rand4, rand5 FROM dbo.tb_Rand_50M",
                          connectionString = sqlServerConnString);

system.time(print(
myModel <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, data = mydata)));

# user system elapsed
# 0.91    0.03   32.58
