
# set up the connection string
sqlServerConnString <- "Driver=SQL Server;server=.\\inst2k17;database=testParallel;uid=sa;pwd=sapwd"

mydata <- RxSqlServerData(sqlQuery = "SELECT y, rand1, rand2, rand3, rand4, rand5 FROM dbo.tb_Rand_50M",
                          connectionString = sqlServerConnString);

system.time(print(
myModel <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, data = mydata)));

# user system elapsed
# 0.01 0.00   42

