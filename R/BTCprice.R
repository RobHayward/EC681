## Copper price chart
require(quantmod)
da <- getSymbols(Symbols = 'BTC-USD', auto.assign = FALSE) 
head(da)
tail(da)
plot(da$`BTC-USD.Close`, type = 'l', subset = "2019-01-01/2021-01-19", 
     main = "BTC price")

        