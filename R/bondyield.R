## Bond yield
# Download data and make a barplot
require(quantmod)
da <- getSymbols(Symbols = 'DGS10', src = 'FRED', auto.assign = FALSE) 
head(da)
tail(da)
plot(da$DGS10, type = 'l', subset = "2020-12-01/2021-02-19", 
     main = "10-year yield")
# remove NA
da <- (da[!is.na(da)])

        