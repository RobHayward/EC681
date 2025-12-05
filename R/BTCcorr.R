# BTCcorr.R
# This will measure the correlation between BTC and some other 
# assets such as GLD and VIX
require(quantmod)
mySymbols <- c("BTC-USD", "GLD", "VIX")
getSymbols(mySymbols)
da <- merge(Cl(`BTC-USD`), Cl(GLD), Cl(VIX))
