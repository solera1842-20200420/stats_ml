#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Apr 26 15:43:41 2021
exmaple: k-meanで、ワイン分類

@author: nk
"""

# ライブラリ・インポート
import pandas as pd
import streamlit as st
import plotly.express as px
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import accuracy_score

# データ・セット読み込み
data_dir = './data/'
data = pd.read_csv(data_dir + 'winequality_white.csv')
df = data

## Knn

# 目的変数と説明変数に分割
# 目的変数
y = df['quality']

# 説明変数
X = df[['fixed acidity', 'citric acid', 'residual sugar', 'density', 'pH', 'alcohol']]

# 訓練データと学習データに分割
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=1)

knn = KNeighborsClassifier(n_neighbors=5)
knn.fit(X_train, y_train)
y_pred = knn.predict(X_test)

# print(knn.predict_proba(newloan))
# st.write(metrics.accuracy_score(y_test, y_pred))
st.write('accuracy_score:', accuracy_score(y_test, y_pred))

# plot
# sns.scater
st.write('winequality_white')

#st.write(
#    px.scatter(data_frame=loan200, x='payment_inc_ratio' ,y='dti',
#               color=loan200.outcome)
#    )

st.write(
    px.scatter(data_frame=data, x='fixed acidity', y=y, title='fixed_acidity and quality')
    )

st.write(
    px.scatter(data_frame=data, x='density', y=y, title='density and quality')
    )
st.write(
    px.scatter(data_frame=data, x='alcohol', y=y, title='alcohol and quality')
    )

st.write(
    px.scatter(data_frame=data, x='residual sugar', y=y, title='residual sugar and quality')
    )

# end...

