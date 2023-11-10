# ETF charts
require(quantmod)
ETFlist <- c('SPY', 'TLT', 'GLD', 'USO', 'EEM')
getSymbols(ETFlist)
mydata <- merge(SPY, TLT)
mydata <- merge(GLD, mydata)
mydata <- merge(USO, mydata)
mydata <- merge(EEM, mydata)
head(mydata)
plot(mydata$SPY.Close, subset = "2021", main = "SPY")
plot(mydata$TLT.Close, subset = "2021", main = "TLT")
plot(mydata$EEM.Close, subset = "2021", main = "EEM")
plot(mydata$GLD.Close, subset = "2021", main = "GLD")
plot(mydata$USO.Close, subset = "2021", main = "USO")
par(mfrow = c(2,2))
getSymbols('DGS10', src = 'FRED')
plot(DGS10, main = "US 10 year bond yield")
# To calculate the change since beginning of November. 
mydata["2020-12-04", "EEM.Close"]

mydata["2020-11-02", "EEM.Close"] 
50.85/45.28-1
plot(mydata$SPY.Close, subset = "2020-12-01::2020-12-11", main = "SPY in Dec")
plot(mydata$TLT.Close, subset = "2020-12-01::2020-12-11", main = "TLT in Dec")
plot(mydata$GLD.Close, subset = "2020-12-01::2020-12-11", main = "GLD in Dec")
plot(mydata$USO.Close, subset = "2020-12-01::2020-12-11", main = "USO in Dec")
plot(mydata$EEM.Close, subset = "2020-12-01::2020-12-11", main = "EEM in Dec")
plot(mydata$TLT.Close, subset = "2020-12-01::2020-12-11", main = "TLT in Dec")
par(mfrow = c(2,2))
