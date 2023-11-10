## get US savings data from Fred and make a graph
require(quantmod)
getSymbols('PSAVERT', src = 'FRED')
head(PSAVERT)
tail(PSAVERT)
#calculate the change in payrollls
plot(PSAVERT, subset = "2019::", main = "US Savings Rate")

