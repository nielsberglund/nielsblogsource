# load in the ODBC library for R
library(RODBC)
library(biglm)
install.packages("biglm")



# set up a connection
conn <- odbcDriverConnect(connection = "Driver={SQL Server native Client 11.0};server=server_name;database=MortgageDb;uid=user_id;pwd=secret_password")

# read the data into a dataframe - mydata - this will take a while
system.time(mydata <- sqlQuery(conn, "SELECT CreditScore, HouseAge, YearsEmp, CreditCardDebt, Year, DidDefault FROM dbo.tb_MortgageData"))

#user  system elapsed 
#8.45    0.50    8.95 


# treat HouseAge and Year as a categorical variable
mydata$HouseAge <- factor(mydata$HouseAge)
mydata$Year <- factor(mydata$Year)


#logit <- glm (DidDefault ~ HouseAge + Year + CreditScore + YearsEmp + CreditCardDebt, data = mydata, family = "binomial")

logit <- bigglm(DidDefault ~ HouseAge + Year + CreditScore + YearsEmp + CreditCardDebt, mydata, family = binomial(link='logit'), chunksize = 10000)
