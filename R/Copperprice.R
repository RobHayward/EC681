## Copper price chart
require(quantmod)
da <- getSymbols(Symbols = 'PCOPPUSDM', src = 'FRED', auto.assign = FALSE) 
head(da)
tail(da)
plot(da$PCOPPUSDM, type = 'l', subset = "2019-01-01/2021-01-19", 
     main = "Copper price")

        