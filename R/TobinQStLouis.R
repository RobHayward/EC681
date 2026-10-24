# TobinQStLouis.R
# This takes the data from St Louis Fed database
# The data are taken from the Fred database
# The codes are market value relative to accounting value 
# See the value below. 
da <- read.csv('../Data/NCBEILQ027S_TNWMVBSNNCB.csv')
head(da)
str(da)
names(da) <- c("Date", "Q")
da$Date <- as.Date(da$Date, format = "%Y-%m-%d")
Qmean <- mean(da$Q, na.rm = TRUE)
plot(da$Date, da$Q, type = 'l', main = "Tobin-Q Ratio", 
     xlab = "Date", ylab = "Ratio")
abline(h = Qmean, col = 'red', lty = 2)
text(as.Date("1980-12-01"), 0.0009, 
     labels = "Expensive", cex = 0.8)
text(as.Date("1980-10-01"), 0.0008, 
     labels = "Cheap", cex = 0.8)
legend('topright', inset = 0.01, 
       legend = c("Tobin's Q", "Average Q value"), 
       col = c('black', 'red'), 
       lty = c(1, 2), cex = 0.8)

