# mortgage.R
# this will chart UK mortgages
# Data is from the bank of england database. 
# mortgages are levels of deposit
da <- read.csv('../Data/UKMortgageData.csv')
head(da)
da$Date <- as.Date(da$Date, format = "%d %b %y")
names(da)
colnames(da) <- c("Date", "2-yr Mortgage (95%)", 
                  "2-yr Mortgage (90%)", "2-yr Mortgage (75%)")
head(da)
tail(da)
# it appears that the 75% mortgage starts at April 1998. Start here? 
da2 <- subset(da, subset = da$Date >= as.Date("1998-04-30"), 
              select = c(1,4))
head(da2)
tail(da2)
plot(da2$Date, da2$`2-yr Mortgage (75%)`, type = 'l')
#=========================================================
#Base rate
da3 <- read.csv('../Data/BoEBaseRateTotal.csv')
head(da3)
tail(da3)
da3$Date <- as.Date(da3$Date, format = "%d %b %y")
da3 <- da3[, -2]
colnames(da3) <- c("Date", "Base rate")
head(da3)
tail(da3)
#=================================================
# merge with other database
da4 <- merge(da2, da3, by = "date")
head(da4)
tail(da4)
plot(da4$date, da4$`2-yr mortgage (75%)`, type = 'l', ylim = c(0, 6.5), 
     main = "uk base and mortgage rates")
lines(da4$date, da4$`base rate`, type = 'l', col = 'red')
#==========================================================
#Spread
plot(da4$Date, da4$`2-yr Mortgage (75%)` - da4$`Base rate`, type = 'l',
     main = "UK mortgage rate to base rate spread", xlab = "Date", 
     ylab = "Spread")
