rm(list=ls())

# library
library(ggplot2)
library(UsingR)
library(car)
par("mar")
par(mar=c(1,1,1,1))

# Open data
test = read.csv("test.csv",header = TRUE)
test

test1 = test[,3:4]
test1
View(test1)

# Made Graph with temperature and humidity data 
## Source : http://www.dodomira.com/2016/03/18/ggplot2-%EA%B8%B0%EC%B4%88/

temperature <- test1[,1]
humidity <- test1[,2]

g <- ggplot(data=test1, aes(x = temperature, y = humidity))

g+geom_point() # made Scatterplot

## Source : http://www.dodomira.com/2016/03/24/r%EC%9D%84-%EC%82%AC%EC%9A%A9%ED%95%9C-%EA%BA%BD%EC%9D%80%EC%84%A0%ED%98%95-%EC%9B%90%ED%98%95-%EC%98%81%EC%97%AD%ED%98%95-%EB%B6%84%EC%82%B0%ED%98%95-%EA%B7%B8%EB%9E%98%ED%94%84-%EA%B7%B8%EB%A6%AC/

bar <- ggplot(test1, aes(x=temperature, y=humidity))+geom_line()+xlim(23,27)
bar # made deflection graph

# Correlation, Regression with temperature and humidity data
# Source : http://rstudio-pubs-static.s3.amazonaws.com/189354_277dfb3a83a34a2abaae855b90fcf269.html

str(test1)

par(mfrow=c(1,2))
hist(temperature, col="blue", breaks=100)
hist(humidity, col="blue", breaks=100)
par(mfrow=c(1,1)) # histogram

cor.test(temperature, humidity) # Pearson's product-moment correlation

xtabs(~temperature+humidity, data=test1) # table

ggplot(data = test1, aes(x=temperature, y=humidity))+geom_count()+geom_smooth(method="lm")
# made graph

fit <- lm(temperature~humidity, data = test1)
summary(fit) # linear regression

plot(temperature~humidity, data=test1)
abline(fit, col="blue") # graph


fit2 <- lm(temperature~humidity+I(humidity^2), data=test1)
summary(fit2) # polynomial regression(2)

plot(temperature~humidity, data=test1)
lines(temperature, fitted(fit2), col="red") # graph

fit3 <- lm(temperature~humidity + I(humidity^2) + I(humidity^3), data=test1)
# polynomial regression(3)
scatterplot(temperature~humidity, data=test1)
scatterplot(temperature~humidity, data=test1, pch=19,
            spread=FALSE, smoother.args=list(lty=2),
            main="Test data",
            xlab="Temperature(Celsius)", ylab="Humidity(mm)")
