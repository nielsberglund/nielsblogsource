# load in the ODBC library for R
library(RODBC)

# set up a connection
conn <- odbcDriverConnect(connection = "Driver={SQL Server native Client 11.0};server=server_name;database=MortgageDb;uid=user_id;pwd=secret_password")

# read the data into a dataframe - mydata - this will take a while
mydata <- sqlQuery(conn, "SELECT CreditScore, HouseAge, YearsEmp, CreditCardDebt, Year, DidDefault FROM dbo.tb_MortgageData")

# treat HouseAge and Year as a categorical variable
mydata$HouseAge <- factor(mydata$HouseAge)
mydata$Year <- factor(mydata$Year)


logit <- glm(DidDefault ~ HouseAge + Year + CreditScore + YearsEmp + CreditCardDebt, data = mydata, family = "binomial")