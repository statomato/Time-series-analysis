hw3.1 <- read.csv("C:/���п�/2018-2/1. ����/�ð迭�м�/hw3.1.csv")
colnames(hw3.1) <- c("t","at","phi__0.8","phi_0","phi_0.8")

acf(hw3.1$phi__0.8[-c(1:2)],lag.max=20)
pacf(hw3.1$phi__0.8[-c(1:2)],lag.max=20)

acf(hw3.1$phi_0[-c(1:2)],lag.max=20)
pacf(hw3.1$phi_0[-c(1:2)],lag.max=20)

acf(hw3.1$phi_0.8[-c(1:2)],lag.max=20)
pacf(hw3.1$phi_0.8[-c(1:2)],lag.max=20)


hw3.2 <- read.csv("C:/���п�/2018-2/1. ����/�ð迭�м�/hw3.2.csv")
library(moments)
summary(hw3.2)
cbind(sd(hw3.2$pt), sd(hw3.2$rt[-1]), sd(hw3.2$RVt))
cbind(skewness(hw3.2$pt), skewness(hw3.2$rt[-1]), skewness(hw3.2$RVt))
cbind(kurtosis(hw3.2$pt), kurtosis(hw3.2$rt[-1]), kurtosis(hw3.2$RVt))

acf(hw3.2$RVt,lag.max=20)
acf(hw3.2$pt,lag.max=20)
acf(hw3.2$rt[-1],lag.max=20)

#pt
forecast(Arima(hw3.2$pt,order=c(1,0,0)),h=1)
forecast(Arima(hw3.2$pt,order=c(5,0,0)),h=1)
forecast(Arima(hw3.2$pt,order=c(22,0,0)),h=1)

#rt
forecast(Arima(hw3.2$rt,order=c(1,0,0)),h=1)
forecast(Arima(hw3.2$rt,order=c(5,0,0)),h=1)
forecast(Arima(hw3.2$rt,order=c(22,0,0)),h=1)

#RVt
forecast(Arima(hw3.2$RVt,order=c(1,0,0)),h=1)
forecast(Arima(hw3.2$RVt,order=c(5,0,0)),h=1)
forecast(Arima(hw3.2$RVt,order=c(22,0,0)),h=1)

library(fUnitRoots); library(forecast)
#adf test for RVt
arima.aic1 <- c()
for(i in 0:8){
  arima.aic1[i+1] <- Arima(hw3.2$RVt, order=c(i,0,0), method="ML")$aic
}
which.min(arima.aic1)
arima.aic1 = arima.fit1$aic
adfTest(hw3.2$RVt, lags = 6, type = "c") 

adf.test1 = adfTest(hw3.2$RVt, lags = 6, type = "c") 

# type : "c" = ������ �ִ� ������� ���� 

# type :  "nc" = ������ ���� ������� ����

# type : "ct" = �߼����� ���� 

adf.stat1 = adf.test1@test$statistic           # ADF ��

adf.p.value1 = adf.test1@test$p.value          # p-value

#adf test for pt
arima.aic2 <- c()
for(i in 0:8){
  arima.aic2[i+1] <- Arima(hw3.2$pt, order=c(i,0,0), method="ML")$aic
}
which.min(arima.aic2)
adfTest(hw3.2$pt, lags = 3, type = "c") 
adfTest(hw3.2$pt, lags = 3, type = "ct") 

#adf test for rt
arima.aic3 <- c()
for(i in 0:8){
  arima.aic3[i+1] <- Arima(hw3.2$rt, order=c(i,0,0), method="ML")$aic
}
which.min(arima.aic3)
adfTest(hw3.2$rt, lags = 3, type = "c") 