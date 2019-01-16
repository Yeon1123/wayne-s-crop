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
library(gridExtra)
par("mar")
par(mar=c(1,1,1,1))

# Open data
test = read.csv("feed.csv",header = TRUE)
test
acc = read.csv("..//compare//tem_hum_com.csv", header = TRUE)
acc
test1 = test[,3:4]
test1
View(test1)

# Made Graph with temperature and humidity data 
## Source : http://www.dodomira.com/2016/03/18/ggplot2-%EA%B8%B0%EC%B4%88/
temperature <- test1[,1]
humidity <- test1[,2]
temperature_com <- acc[,1]
humidity_com <- acc[,2]

g <- ggplot(data=test1, aes(x = temperature, y = humidity))
g+geom_point() ### made Scatterplot

# Correlation, Regression with temperature and humidity data
## Source : http://rstudio-pubs-static.s3.amazonaws.com/189354_277dfb3a83a34a2abaae855b90fcf269.html

### histogram of test data
str(test1)
par(mfrow=c(1,2))
hist(temperature, col="blue", breaks=100)
hist(humidity, col="blue", breaks=100)

### histogram of accurate data
str(acc)
hist(temperature_com, col="red", breaks = 100)
hist(humidity_com, col="red", breaks = 100)
par(mfrow=c(1,1))

### correlation test for test and accurate data
cor.test(temperature, humidity)
cor.test(temperature_com, humidity_com)

### frequency table of test data
xtabs(~temperature+humidity, data=test1)

### ggplot
ggplot(data = test1, aes(x=temperature, y=humidity))+geom_count()+geom_smooth(method="lm") ### made graph
ggplot(data = acc, aes(x=temperature_com, y=humidity_com))+geom_count()+geom_smooth(method="lm") ### made graph


### fit data and draw for linear regression
fit <- lm(temperature~humidity, data = test1)
summary(fit)
fit_com <- lm(temperature_com~humidity_com, data = acc)
summary(fit_com)

plot(temperature~humidity, data=test1)
abline(fit, col="blue")
plot(temperature_com~humidity_com, data=acc)
abline(fit_com, col="red")

#### graph with test data and line with accurate data
plot(temperature~humidity, data=test1)
abline(fit_com, col="red")

### fit data and draw for 2nd polynomial regression
fit2 <- lm(temperature~humidity+I(humidity^2), data=test1)
summary(fit2)
fit2_com <- lm(temperature_com~humidity_com+I(humidity_com^2), data=acc)
summary(fit2_com)

plot(temperature~humidity, data=test1)
lines(test1$humidity, fitted(fit2), col="blue")
plot(temperature_com~humidity_com, data=acc)
lines(acc$humidity, fitted(fit2_com), col="red")

### graph with test data and line with accurate data
plot(temperature~humidity, data=test1)
lines(acc$humidity, fitted(fit2_com), col="red")

### fit data and draw for 3rd polynomial regression
fit3 <- lm(temperature~humidity + I(humidity^2) + I(humidity^3), data=test1)
summary(fit3)
fit3_com <- lm(temperature_com~humidity_com + I(humidity_com^2) + I(humidity_com^3), data=acc)
summary(fit3_com)

plot(temperature~humidity, data=test1)
lines(test1$humidity, fitted(fit3), col="blue")
plot(temperature_com~humidity_com, data=acc)
lines(acc$humidity, fitted(fit3_com), col="red")

### graph with test data and line with accurate data
plot(temperature~humidity, data=test1)
lines(acc$humidity, fitted(fit3_com), col="red")

### made scatterplot with test data and accurate data
scatterplot(temperature~humidity, data=test1)
sc <- scatterplot(temperature~humidity, data=test1, pch=19,
            spread=FALSE, smoother.args=list(lty=2),
            main="Test data",
            xlab="Temperature(Celsius)", ylab="Humidity(mm)")
scatterplot(temperature_com~humidity_com, data=acc)
sc_com <- scatterplot(temperature_com~humidity_com, data=acc, pch=19,
            spread=FALSE, smoother.args=list(lty=2),
            main="Compare data",
            xlab="Temperature(Celsius)", ylab="Humidity(mm)")