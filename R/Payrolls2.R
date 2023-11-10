## Payrolls data
# Download data and make a barplot
require(quantmod)
da <- getSymbols(Symbols = 'PAYEMS', src = 'FRED', auto.assign = FALSE) 
head(da)
tail(da)
#calculate the change in payrollls
da$Nonfarm <- diff(da$PAYEMS)
da$MANonfstm <- c(NA, NA, zoo::rollmean(da$Nonfarm, k = 3))
dau <- da["2019-01-01/2020-11-30"]
head(dau)
tail(dau)
date <- seq.Date(as.Date("2019-01-01"), as.Date("2020-11-30"), "quarter")
# might try to use axis but need to specific the location. 
#axis(side = 1, labels = YearMon[at])
YearMon <- as.yearmon(index(dau))
YearMon
# use las to change the direction of the labels. This is good as is. 
barplot(dau$Nonfarm, names.arg = format(YearMon, "%b-%Y"), 
        main = "US non-farm payrolls Dec 2020", col = 'light blue')
lines(c(NA, NA, NA, NA, dau$MANonfstm), col = 'black', pch = 2)
# cex will reduce the size of the legend
# Can't fix the legend
legend('bottomleft', inset = 0.05, legend = c('Change in payrolls', '3-month average'), lwd = c(2, 2), cex = 0.90, col = c('light blue', 'black'))  

