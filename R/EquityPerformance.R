# EquityPerformance.R
# This will look at the latest equity performance
require(quantmod)
require(PerformanceAnalytics)
mysymbols <- c("IVE", "IVW", "SPY", "TLT")
getSymbols(mysymbols)
plot(Cl(IVE)/Cl(IVW), main = "Growth / Value")
plot(Cl(IVE)["2026-06/"]/Cl(IVW)["2026-06/"], main = "Growth / Value")
plot(Cl(SPY)/Cl(TLT), main = "SPY/TLT")
plot(Cl(SPY)["2026-06/"]/Cl(TLT)["2026-06/"], main = "SPY/TLT")
#================
getSymbols('QQQ', from = as.Date("1990-01-01"))
head(QQQ)
da <- as.data.frame(QQQ)
da$Date <- as.Date(row.names(da))
head(da)
colnames(da) <- c('Open', 'High', 'Low', 'Close', 'Vol', 'Ad', 
                  'Date')
myda <- subset(da, da$Date < as.Date("2001-12-31"))
plot(myda$Date, myda$Close, 
     main = "NASDAQ Technology Index", 
     type = 'l', xlab = "Date", ylab = "Price")
mydrawdown <- round(max(Cl(QQQ))/min(Cl(QQQ)) - 1, 1)
mytext <- paste("Drawdown is", mydrawdown, "percent")
text(as.Date("2000-08-01"), 40, mytext, cex = 0.8)
mytext

