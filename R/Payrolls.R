## Payrolls data
# Download data and make a barplot
da <- read.csv('../Data/USPayrolls.csv', stringsAsFactors = FALSE)
head(da)
tail(da)
#calculate the change in payrollls
da$Nonfarm <- c(NA, da$PAYEMS[2:length(da$PAYEMS)] - da$PAYEMS[1:(length(da$PAYEMS)-1)])
da$MANonfstm <- c(NA, NA, zoo::rollmean(da$Nonfarm, k = 3))
dau <- subset(da, da$DATE >= "2018-01-01" & da$DATE < "2019-12-31")
head(dau)
tail(dau)
date <- seq.Date(as.Date("2018-01-01"), as.Date("2019-12-31"), "quarter")
# might try to use axis but need to specific the location. 
#axis(side = 1, labels = YearMon[at])
YearMon <- zoo::as.yearmon(dau$DATE)
# use las to change the direction of the labels. This is good as is. 
barplot(dau$Nonfarm, names.arg = format(YearMon, "%b-%Y"), 
        main = "US non-farm payrolls", col = 'light blue')
lines(c(NA, NA, NA, NA, dau$MANonfstm), col = 'black')
# cex will reduce the size of the legend
# Can't fix the legend
legend(x = "2019-09-30", y = 250, legend = c('Change in payrolls', '3-month average'),
       lwd = c(2, 2), cex = 0.60, col = c('light blue', 'black'))  

