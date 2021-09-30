# Financial Chart(UBER)

# library
library(forecast)
library(tidyverse)
library(quantmod)

# fetch data(Uber Eats)
getSymbols("UBER", src = "yahoo", from="2019-1-1")
UBER

# plot
# candlestick
candleChart(UBER, multi.col = TRUE, theme = "white")

# Simple Moving Average
chartSeries(UBER,
  TA="addSMA(n=5, col='white'); addSMA(n=25, col='green');addSMA(n=75, col='blue')")

# MACD, BolingerBand, EMA
chartSeries(UBER)
addMACD()  # MACD
addBBands()  # BolingerBand
addEMA()
