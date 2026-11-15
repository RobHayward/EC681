# SwissShock.R
# This will show the swiss franc shock
# Read data
da1 <- read.csv('../Data/CHFPLN.csv', na.strings = "n/a")
da1$Date <- as.Date(da1$Date, format = "%d %b %y")
# Create a date
head(da1)
da2 <- read.csv('../Data/CHFHUF.csv', na.strings = "n/a")
da2$Date <- as.Date(da2$Date, format = "%d %b %y")
head(da2)
tail(da2)
str(da2)
# Merge the two files
da <- merge(da1, da2, by = "Date")
head(da)
str(da)
# Create the Swiss rates
da$PLNCHF <- da$PLN/da$CHF.x
da$HUFCHF <- da$HUF/da$CHF.y
da <- da[complete.cases(da), ]
head(da)
tail(da)
str(da)
da <- da[, c(1, 6, 7)]
head(da)
enddate <- as.Date("2015-12-31") 
startdate <- as.Date("2014-01-01")
shockdate <- as.Date("2015-01-15")
dasubset <- da[da$Date > startdate &
                 da$Date < enddate, ]
dabefore <- da[da$Date > startdate & da$Date < shockdate, ]
daafter <- da[da$Date > shockdate & da$Date < enddate, ]
plot(dasubset$Date, dasubset$PLNCHF, type = 'l', 
     main = "CHF rises 14 percent vs PLN", 
     xlab = "Date", ylab = "PLN/CHF")
PLNbeforeaverage <- mean(dabefore$PLNCHF)
PLNafteraverage <- mean(daafter$PLNCHF)
lines(dabefore$Date, rep(PLNbeforeaverage, length(dabefore$Date)), 
                         col = 'red')
lines(daafter$Date, rep(PLNafteraverage, length(daafter$Date)), 
      col = 'red')
mybefore <- paste("Average", round(PLNbeforeaverage, 2))
text(shockdate + 90, PLNbeforeaverage, mybefore, cex = 0.8)
lines(daafter$Date, rep(PLNafteraverage, length(daafter$Date)), 
                         col = 'red')
lines(daafter$Date, rep(PLNafteraverage, length(daafter$Date)), 
      col = 'red')
myafter <- paste("Average", round(PLNafteraverage, 2))
text(shockdate - 90, PLNafteraverage, myafter, cex = 0.8)

#=======================
plot(dasubset$Date, dasubset$HUFCHF, type = 'l')
enddate <- as.Date("2015-12-31") 
startdate <- as.Date("2014-01-01")
shockdate <- as.Date("2015-01-15")
dasubset <- da[da$Date > startdate &
                 da$Date < enddate, ]
dabefore <- da[da$Date > startdate & da$Date < shockdate, ]
daafter <- da[da$Date > shockdate & da$Date < enddate, ]
plot(dasubset$Date, dasubset$HUFCHF, type = 'l', 
     main = "CHF rises 14 percent vs HUF", 
     xlab = "Date", ylab = "HUF/CHF")
HUFbeforeaverage <- mean(dabefore$HUFCHF)
HUFafteraverage <- mean(daafter$HUFCHF)
lines(dabefore$Date, rep(HUFbeforeaverage, length(dabefore$Date)), 
                         col = 'red')
lines(daafter$Date, rep(HUFafteraverage, length(daafter$Date)), 
      col = 'red')
mybefore <- paste("Average", round(HUFbeforeaverage, 2))
text(shockdate + 100, HUFbeforeaverage, mybefore, cex = 0.8)
lines(daafter$Date, rep(HUFafteraverage, length(daafter$Date)), 
                         col = 'red')
lines(daafter$Date, rep(HUFafteraverage, length(daafter$Date)), 
      col = 'red')
myafter <- paste("Average", round(HUFafteraverage, 2))
text(shockdate - 100, HUFafteraverage, myafter, cex = 0.8)
#======================================

