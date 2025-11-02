# TobinQ
# This is the download and import of Tobin's q data from 
# https://smithers.co.uk/q_faqs/us-cape-and-q-chart/
da <- read.csv('../Data/TobinQSmithers.csv', skip = 6, nrows = 500)
head(da)
tail(da)
require(zoo)
da$Date <- as.yearqtr(1900 + seq(0, 499)/4)
plot(da$Date, da$Value, type = 'l', col = 'lightgreen', 
     xlab = 'Year', ylab = "Tobin's Q", main = "Tobin's Q for US stocks")
lines(da$Date, da[, 22], col = 'darkgreen', lty = 2)
legend('top', inset = 0.01, legend = c("Q", "Q-ex IP"), 
       col = c("lightgreen", "darkgreen"), lty = c(1, 2), cex = 0.8)
