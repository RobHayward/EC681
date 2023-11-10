require(zoo)
require(xts)
require(Quandl)
Quandl.auth("mUCjthkJFQDsYVrFh4Gh")
#==================================================
IND = Quandl("QUANDL/INRUSD", start_date="1995-01-01",end_date="2013-06-07", type="xts")
pdf("./Figures/IND.pdf", paper = "a4r", title = "Indeonesian Rupiah",
    width = 10)
plot(IND, main = "Indonesian Rupiah")
dev.off()
RUB = Quandl("IMF/EXCH_USD_RUB", start_date="1995-01-01",end_date="2013-06-07", type="xts")
tail(RUB)
plot(1/RUB, main = "Russian Ruble in 2008")
#==================================================
USloans <- read.csv("./Data/FRB_G19.csv", 
                  stringsAsFactors = FALSE, skip = 1, 
                    col.names = c("Date", "Credit"))
# Use as.yearmon because no day in data. Requires zoo
USloans$Date <- as.yearmon(USloans$Date, format = "%Y-%m")
str(USloans)
head(USloans)
pdf("./Figures/USLoans.pdf", paper = "a4r", title = "USloans",
    width = 10)
plot(USloans[744:803,], type = 'l', main = "US Credit to Households")
dev.off()
#==============================
GBPDEM <- read.csv("./Data/GBPDEM.csv", stringsAsFactors = FALSE, 
                   header = TRUE, col.names = c("Date", "GBPDEM"), 
                   skip = 4)
GBPDEM$Date <- as.Date(GBPDEM$Date, format = "%d/%m/%Y")
str(GBPDEM)
pdf("./Figures/GBPDEM.pdf", paper = "a4r", title = "GBPDEM and the ERM",
    width = 10)
plot(GBPDEM, type = 'l', main = "GBPDEM and the ERM exit")
dev.off()
#========================================
UShouse <- read.csv("./Data/USHousePriceData.csv", stringsAsFactors = FALSE, 
                   header = TRUE, skip = 1)
UShouse$Date <- as.yearmon(UShouse$YEAR, format = "%B %Y")
UShouset <- as.ts(UShouse, start = c(1987,01), frequency = 12)
str(UShouset)
plot(UShouse$CSXR, main = "US house prices", type = 'l', ylab = "House price")
#---------------------------
