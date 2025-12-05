# Nvidia.R
# This will compare the performance of Nvidia and BTC
# Who benefits from BTC?
require(quantmod)
getSymbols(c('NVDA', 'BTC-USD'))
da <- merge(Cl(NVDA), Cl(`BTC-USD`))
str(da)
head(da)
tail(da)
daf <- as.data.frame(da)
str(daf)
daf$Date <- index(da)
head(daf)
dafc <- daf[complete.cases(daf), ]
head(dafc)
tail(dafc)
dafc$NVDArb <- dafc$NVDA.Close/dafc$NVDA.Close[1] * 100
dafc$BTCrb <- dafc$BTC.USD.Close/dafc$BTC.USD.Close[1] * 100
plot(as.Date(rownames(dafc)), dafc$NVDArb, type = 'l', 
     main = "Nvidia vs BTC", xlab = "Year", ylab = 
       "Price (Sep 2019 = 100)") 
lines(as.Date(rownames(dafc)), dafc$BTCrb, lty = 2, col = 'red')
legend('topleft', inset = 0.01, legend = c('Nvidia', 'BTC'),
       lty = c(1, 2), col = c('black', 'red'), cex = 0.7)
