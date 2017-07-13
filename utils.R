TAQtoXTS <- function(dat) {
  # USAGE: Function to convert data.frame of TAQ trades to XTS object

  library(xts)

  if (all(c('bid_exchange','ask_exchange') %in% colnames(dat))) {
    type <- 'quotes'
  } else {
    type <- 'trades'
  }

  if (type=='trades') {
    dat.x <- xts(dat[,c('symbol.value','exchange','price','quantity','sale_condition','correction_indicator','g127_indicator')], order.by=dat$Time)
    names(dat.x) <- c('SYMBOL','EX','PRICE','SIZE','COND','CORR','G127')
  } else if (type=='quotes') {
    dat.x <- xts(dat[,c('symbol.value','exchange','bid','bid_size','ask','ask_size','quote_condition')], order.by=dat$Time)
    names(dat.x) <- c('SYMBOL','EX','BID','BIDSIZ','OFR','OFRSIZ','MODE')
  }

  return(dat.x)
}
