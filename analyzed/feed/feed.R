##########################################################################################
######### S  u b j e c  t : Collect Temperatue and Humidity data and Analyze #############
######### Collection Date : January 14, 2019                                 #############
######### Data  collector : Wayne's Crop                                     #############
##########################################################################################
rm(list=ls())

# library
library(ggplot2)
library(UsingR)
library(car)
par("mar")
par(mar=c(1,1,1,1))

# Open data
test = read.csv("feed.csv",header = TRUE)
test
test1 = test[,3:4]
test1
View(test1)

# Made Graph with temperature and humidity data 
## Source : http://www.dodomira.com/2016/03/18/ggplot2-%EA%B8%B0%EC%B4%88/
temperature <- test1[,1]
humidity <- test1[,2]

g <- ggplot(data=test1, aes(x = temperature, y = humidity))
g+geom_point() ### made Scatterplot

# Correlation, Regression with temperature and humidity data
## Source : http://rstudio-pubs-static.s3.amazonaws.com/189354_277dfb3a83a34a2abaae855b90fcf269.html

str(test1)
par(mfrow=c(1,2))
hist(temperature, col="blue", breaks=100)
hist(humidity, col="blue", breaks=100)
par(mfrow=c(1,1)) ### histogram

cor.test(temperature, humidity) ### Pearson's product-moment correlation

xtabs(~temperature+humidity, data=test1) ### table

ggplot(data = test1, aes(x=temperature, y=humidity))+geom_count()+geom_smooth(method="lm") ### made graph


fit <- lm(temperature~humidity, data = test1)
summary(fit) ### linear regression

plot(temperature~humidity, data=test1)
abline(fit, col="blue") ### graph


fit2 <- lm(temperature~humidity+I(humidity^2), data=test1)
summary(fit2) ### polynomial regression(2)

plot(temperature~humidity, data=test1)
lines(temperature, fitted(fit2), col="red") ### graph


fit3 <- lm(temperature~humidity + I(humidity^2) + I(humidity^3), data=test1)
summary(fit3) ### polynomial regression(3)

scatterplot(temperature~humidity, data=test1)
scatterplot(temperature~humidity, data=test1, pch=19,
            spread=FALSE, smoother.args=list(lty=2),
            main="Test data",
            xlab="Temperature(Celsius)", ylab="Humidity(mm)") ### graph
