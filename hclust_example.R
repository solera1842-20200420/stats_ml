# 階層クラスタリング
# サンプルデータ(cars)の読み込み
data(cars)
# データ間の距離を算出
dist.cars <- dist(cars)

# 階層的クラスタリングの実行
# hclust.cars <- hclust(dist.cars)
hclust_wardd2 <- hclust(dist_cars, method = "ward.D2")

# クラスタリングの結果をプロット
# plot(hclust.cars)
plot(hclust_wardd2)

hclust_wardd2
hclust_wardd2$call
