# SPYTLT.R will measure the performance of US stocks and bonds
require(quantmod)
getSymbols('SPY')
getSymbols('TLT')
# combine and turn into dataframe
da <- data.frame(cbind(SPY$SPY.Adjusted, TLT$TLT.Adjusted))
colnames(da) <- c("SPY", "TLT")
# Create a variables for the dates
Dates <- as.Date(rownames(da), format = "%Y-%m-%d")
head(da)
str(da)

graphics::plot(Dates, da$SPY, main = "Performance of US stocks", type = 'l',
               xlab = "Date", ylab = "Price")
graphics::plot(Dates, da$TLT, main = "Performance of US Bonds", type = 'l', 
               xlab = 'Date', ylab = 'Price')
require(mypackage)
da$TLTR <- c(NA, da$TLT[2:length(da$TLT)]/ da$TLT[1:length(da$TLT) - 1] -1)
da$SPYR <- c(NA, da$SPY[2:length(da$SPY)]/ da$SPY[1:length(da$SPY) - 1] -1)
head(da)
str(da$SPY)
da 