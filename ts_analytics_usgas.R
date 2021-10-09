# 時系列分析
# dataset: UKgas
# library
library(TSstudio)
library(MLmetrics)
library(forecast)

# データセット
data("USgas")

names(data)
ts_info(USgas)

# plot
# 時系列推移
ts_plot(USgas, 
        title = "USgas",
        Ytitle = "value")

# heatmap
ts_heatmap(USgas)

# トレンド・季節性の分解
ts_decompose(USgas)

# 季節性やトレンドなどの視覚化
ts_seasonal(USgas, type = "normal")
ts_seasonal(USgas, type = "box")
ts_seasonal(USgas, type = "cycle")
ts_heatmap(USgas)

# forecast simulation
fit_USgas <- auto.arima(USgas)
forecast_sim(model=fit_USgas, h = 60, n = 100)  # simulate100%possible, 60month

# ホールドアウト法で予測モデル構築

# 学習データとテストデータに分割
USgas_s <- ts_split(ts.obj = USgas,
                       sample.out = 12)
train <- USgas_s$train #学習データ
test <- USgas_s$test   #テストデータ（新しい方から12カ月分）

# ARIMAモデルの構築と予測
md <- auto.arima(train)    #学習データでモデル構築
fc <- forecast(md, h = 12) #12カ月間を予測

# 予測期間の予測値プロット
plot_forecast(fc)

# 予測値と実測値のプロット
test_forecast(actual = USgas, 
              forecast.obj = fc, 
              test = test)

# 精度評価
MAPE(fc$mean,test)     #MAPE
RMSE(fc$mean,test)     #RMSE
R2_Score(fc$mean,test) #R2
