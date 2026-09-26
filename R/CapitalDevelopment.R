# CapitalDevelopment.R
#==================================================
# This will provide the example pf capital development, 
# rising capital share and still increasing wages
# This comes from 24 August 2026 and there is an 
# accompanying file called Capital_labour_share.Rmd
# Set up the opening quantities of capital and labour 
# Total capital
TC <- 100
# Total labour
TL <- 100
# Growth rates - 5 percent capital, 2 percent labour
GC <- 1.05
GL <- 1.01
# Now create the timeseries of labour and capital 
# given sartingt points and growth rates
TCts <- 100 * cumprod(c(1, rep(GC, 10)))
plot(1:11, TCts, type = 'l', main = "Capital growth")
TLts <- 100 * cumprod(c(1, rep(GL, 10)))
plot(1:11, TLts, type = 'l', main = "Labour growth")
GDP <- TCts + TLts
plot(1:11, GDP, type = 'l', main = "GDP growth")
#================================================
# The income for capital and labour at teh end of 10 years
TCts[length(TCts)]
TLts[length(TLts)]
# So capital has increased 62 percent and labour 10 percent
(TCts[length(TCts)]/TCts[1])^(1/11) - 1
# So compound 4.5 percent
(TLts[length(TLts)]/TLts[1])^(1/11) - 1
# So 1.0% Labour growth. 
#=========================================
# The share of Capital and labour
plot(1:11, TCts/GDP, type = 'l', main = "Share of Capital")
plot(1:11, TLts/GDP, type = 'l', main = "Share of Labour")
TCts[length(TCts)]/GDP[length(GDP)]
TLts[length(TLts)]/GDP[length(GDP)]
# So the share of capital increases to 57 percent and 
# the share of labour falls to 42 percent
# Create a re-based function (it is not yet in mypackage)
myrebase <- function(x, index = 1, value = 100){
  tempdata <- x/x[index] * value
  return(tempdata)
}
TCts_rebased <- myrebase(TCts)
TLts_rebased <- myrebase(TLts)
GDP_rebased <- myrebase(GDP)
plot(1:11, TCts_rebased, type = 'l', main = "Rebased levels")
lines(1:11, GDP_rebased, col = 'red', lty = 2)
lines(1:11, TLts_rebased, col = 'blue', lty = 3)
legend('topleft', inset = 0.08, legend = c("Capital", 
                                           "Labour", 
                                           "GDP"), 
       col = c("black", "red", "blue"), 
       lty = 1:3, cex = 0.88)
#==================================================
# Maybe the counterfactual where economy grows at 2 percent 
# and shares remain the same. 

GDP_counterfactual <- 100 * cumprod(c(1, rep(1.02, 10)))
GDP_counterfactual[length(GDP)]
lines(1:11, GDP_counterfactual, col = 'green', lty = 4)
# The counterfactual is not in the picture

