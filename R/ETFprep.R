# Prepare the ETF data
mylist <- c('SPY', 'TLT', 'BTC', 'GLD')
for(i in mylist){
  mypath <- (paste('./Data/', i, '.csv', sep = ""))
  # assign( the name, what you want to assign to that name)
assign(i, read.csv(mypath, stringsAsFactors = FALSE))
}
mydata <-  merge(SPY, TLT,  by = intersect('Date', 'Date'), all = TRUE, 
                suffixes = c('SPY', 'TLT'))  
mydata <- merge(mydata, GLD,  by = intersect('Date', 'Date'), all = TRUE, 
                suffixes = c('SPY', 'TLT'))
mydata <- merge(mydata, BTS,  by = intersect('Date', 'Date'), all = TRUE, 
                suffixes = c('SPY', 'TLT'))

plot(GLD$Date, GLD$Close)
