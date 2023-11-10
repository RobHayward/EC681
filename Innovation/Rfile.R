# get exchange rate and interest rate data
da <- read.csv('./Innovation/TB3MS.csv')
# remove the unwanted marks
da$DATE <- gsub('\\+AC0', "", da$DATE)
da$DATE <- as.Date(da$DATE, format = '%Y-%m-%d')
head(da)
str(da)
plot(da$DATE, da$TB3MS, type = 'l', main = "US 3m Tbill", 
     xlab = "Date", ylab = "Percentage")
#------------------------------------
da <- read.csv('./Innovation/EXUSUK.csv')
# remove the unwanted marks
da$DATE <- gsub('\\+AC0', "", da$DATE)
da$DATE <- as.Date(da$DATE, format = '%Y-%m-%d')
head(da)
str(da)
plot(da$DATE, da$EXUSUK, type = 'l', main = "US 3m Tbill", 
     xlab = "Date", ylab = "Percentage")
#========================
da <- read.csv('./Innovation/USDGBP.csv')
head(da)
plot(da$Date, da[,2], type = 'l')
