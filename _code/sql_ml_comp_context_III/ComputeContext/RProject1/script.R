library("RODBC")

odbcConnString <- "Driver=SQL Server;server=.;database=TestParallel;uid=sa;pwd=sapwd"

conn <- odbcDriverConnect(connection = odbcConnString)

mydata <- sqlQuery(conn, "SELECT TOP(1) y, rand1, rand2, rand3, rand4, rand5 FROM dbo.tb_Rand_50M")

