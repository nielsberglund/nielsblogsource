

# set up a connection string
sqlServerConnString <- "Driver=SQL Server;server=server_name;database=MortgageDb;uid=user_id;pwd=secret_password"

# generate a data frame - notice the data won't be read into the frame until it is needed
mydata <- RxSqlServerData(sqlQuery = "SELECT CreditScore, HouseAge, YearsEmp, CreditCardDebt, Year, DidDefault FROM dbo.tb_MortgageData", 
						  connectionString = sqlServerConnString,
						  rowsPerRead = 1000000)

# create a histogram, this will take a while, as the data is read into the data frame at this stage
rxHistogram( ~ CreditScore, data = mydata);

# get some info about the data
rxGetInfo(mydata, numRows = 5);

# do the logistic regression
system.time(
	logit <- rxLogit(DidDefault ~ F(HouseAge) + F(Year) + CreditScore + YearsEmp + CreditCardDebt,
		              data = mydata, blocksPerRead = 2, reportProgress = 1))
	
