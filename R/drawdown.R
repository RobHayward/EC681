# drawdown.R
# This will show the effects of drawdown
# It takes the data from the slides already shown and shuffles the 
BAC <- read.csv("./EMH/Data/BAC.csv")
BAC$Date <- as.Date(BAC$Date, format = "%d/%m/%Y")
colnames(BAC) <- c("Date", "Close")
BAC <- BAC[rev(rownames(BAC)),]
BACR <- diff(BAC$Close) / BAC$Close[-length(BAC$Close)]
BAC <- cbind(BAC[-1,], BACR)
plot(BAC$Date, BAC$Close, type = 'l', xlab = "Date", ylab = "Price", 
     main = "Bank of America share price")
plot(BAC$Date, BAC$BACR, type = 'l', xlab = "Date", ylab = "Return", 
     main = "Bank of America return")
abline(h = 0, col = 'darkgreen', lty = 2)
#set.seed(129)
set.seed(252)
BAC$BACRsh <- sample(BAC$BACR, length(BAC$BACR), replace = FALSE)
plot(BAC$Date, BAC$BACRsh, type = 'l')
plot(BAC$Date, 15.4 * cumprod(1 + BAC$BACRsh), type = 'l')
mean(BAC$BACR)
sd(BAC$BACR)
mean(BAC$BACRsh)
sd(BAC$BACRsh)
#================================================================
require(PerformanceAnalytics)
table.Drawdowns(as.xts(BAC$BACR, order.by = BAC$Date))
table.Drawdowns(as.xts(BAC$BACRsh, order.by = BAC$Date))
