rm(list=ls())
# library, setup


library(ggplot2)
library(UsingR)
library(car)
library(gridExtra)
par("mar")
par(mar=c(1,1,1,1))

test = read.csv("data.csv", header = TRUE)
acc = read.csv("tem_hum_com.csv", header = TRUE)
test <- na.omit(test)

test[,4] <- test[,4] * 0.01

data = test[,3:4]
time = test[,1]
data$time = time

temperature <- data[,1]
humidity <- data[,2]
temperature_com <- acc[,1]
humidity_com <- acc[,2]

## View data

### information of current data
str(data)

### information of accurate data
str(acc)

### summarize of current data
summary(data)

### summarize of accurate data
summary(acc)


### histogram of current data
par(mfrow=c(1,2))
p = ggplot(data = data, aes(x=time, y=temperature))+geom_count()+geom_smooth(method="lm")
p1 = ggplot(data = data, aes(x=time, y=humidity))+geom_count()+geom_smooth(method="lm")
grid.arrange(p,p1,ncol=2)
par(mfrow=c(1,1))

## Correlation with temperature and humidity data
##### Source : http://rstudio-pubs-static.s3.amazonaws.com/189354_277dfb3a83a34a2abaae855b90fcf269.html


### correlation test for current data
cor.test(temperature, humidity)

### correlation test for accurate data
cor.test(temperature_com, humidity_com)

### ggplot for current data
ggplot(data = data, aes(x=temperature, y=humidity))+geom_count()+geom_smooth(method="lm")

### ggplot for accurate data
ggplot(data = acc, aes(x=temperature_com, y=humidity_com))+geom_count()+geom_smooth(method="lm")

### fit current data and draw for linear regression
fit <- lm(temperature~humidity, data = data)
summary(fit)

### fit accurate data and draw for linear regression
fit_com <- lm(temperature_com~humidity_com, data = acc)
summary(fit_com)

### graph with current data and linear regression line
plot(temperature~humidity, data=data)
abline(fit, col="blue")


### graph with accurate data and linear regression line
plot(temperature_com~humidity_com, data=acc)
abline(fit_com, col="red")

### graph with current data and linear regression line with accurate data
plot(temperature~humidity, data=data)
abline(fit_com, col="red")

### fit current data and draw for 2nd polynomial regression
fit2 <- lm(temperature~humidity+I(humidity^2), data=data)
summary(fit2)

### fit accurate data and draw for 2nd polynomial regression
fit2_com <- lm(temperature_com~humidity_com+I(humidity_com^2), data=acc)
summary(fit2_com)

### graph with current data and 2nd polynomial regression line
plot(temperature~humidity, data=data)
lines(data$humidity, fitted(fit2), col="blue")

### graph with accurate data and 2nd polynomial regression line
plot(temperature_com~humidity_com, data=acc)
lines(acc$humidity, fitted(fit2_com), col="red")

### graph with current data and 2nd polynomial regression line with accurate data
plot(temperature~humidity, data=data)
lines(acc$humidity, fitted(fit2_com), col="red")

### fit current data and draw for 3rd polynomial regression
fit3 <- lm(temperature~humidity + I(humidity^2) + I(humidity^3), data=data)
summary(fit3)

### fit accurate data and draw for 3rd polynomial regression
fit3_com <- lm(temperature_com~humidity_com + I(humidity_com^2) + I(humidity_com^3), data=acc)
summary(fit3_com)

### graph with current data and 3rd polynomial regression line
plot(temperature~humidity, data=data)
lines(data$humidity, fitted(fit3), col="blue")

### graph with accurate data and 3rd polynomial regression line(It's close same as linear regression line)
plot(temperature_com~humidity_com, data=acc)
lines(acc$humidity, fitted(fit3_com), col="red")

### graph with current data and 3rd polynomial regression line with accurate data
plot(temperature~humidity, data=data)
lines(acc$humidity, fitted(fit3_com), col="red")

### made scatterplot with current data
scatterplot(temperature~humidity, data=data, pch=19,
            spread=FALSE, smoother.args=list(lty=2),
            main="current data",
            xlab="Temperature(Celsius)", ylab="Humidity(mm)")

### made scatterplot with accurate data
scatterplot(temperature_com~humidity_com, data=acc, pch=19,
            spread=FALSE, smoother.args=list(lty=2),
            main="Compare data",
            xlab="Temperature(Celsius)", ylab="Humidity(mm)")
