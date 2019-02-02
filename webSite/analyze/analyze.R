# library, setup
library(ggplot2)
library(UsingR)
library(car)
library(gridExtra)
par("mar")
par(mar=c(1,1,1,1))

test = read.csv("testing5.csv",header = TRUE)
acc = read.csv("tem_hum_com.csv", header = TRUE)
test <- na.omit(test)

test[,4] <- test[,4] * 0.01
data = test[,3:4]
time = test[,1]
data$time = time
colnames(data) = c("temperature", "humidity", "time")
colnames(acc) = c("temperature_com", "humidity_com")

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
current = data[seq(nrow(data), nrow(data)-45),]
current = current[c(order(current$time)),]

p = ggplot(data = current, aes(x=time, y=temperature))+geom_point()
p1 = ggplot(data = current, aes(x=time, y=humidity))+geom_point()
grid.arrange(p,p1,ncol=2)

## Correlation with temperature and humidity data
##### Source : http://rstudio-pubs-static.s3.amazonaws.com/189354_277dfb3a83a34a2abaae855b90fcf269.html


### correlation test for current data
cor.test(data$temperature, data$humidity)

### correlation test for accurate data
cor.test(acc$temperature_com, acc$humidity_com)

### ggplot for current data
ggplot(data = data, aes(x=temperature, y=humidity))+geom_count()+geom_smooth(method="lm")

### ggplot for accurate data
ggplot(data = acc, aes(x=temperature_com, y=humidity_com))+geom_count()+geom_smooth(method="lm")

### fit current data and draw for linear regression
fit <- lm(humidity~temperature, data = data)
summary(fit)

### fit accurate data and draw for linear regression
fit_com <- lm(humidity_com~temperature_com, data = acc)
summary(fit_com)

### graph with current data and linear regression line
plot(humidity~temperature, data=data)
abline(fit, col="blue")

### graph with accurate data and linear regression line
plot(humidity_com~temperature_com, data=acc)
abline(fit_com, col="red")

### graph with current data and linear regression line with accurate data
plot(humidity~temperature, data=data)
abline(fit_com, col="red")

### fit current data and draw for 2nd polynomial regression
fit2 <- lm(humidity~temperature+I(temperature^2), data=data)
summary(fit2)

### fit accurate data and draw for 2nd polynomial regression
fit2_com <- lm(humidity_com~temperature_com+I(temperature_com^2), data=acc)
summary(fit2_com)

### graph with current data and 2nd polynomial regression line
plot(humidity~temperature, data=data)
lines(data$temperature, fitted(fit2), col="blue")

### graph with accurate data and 2nd polynomial regression line
plot(humidity_com~temperature_com, data=acc)
lines(acc$temperature_com, fitted(fit2_com), col="red")

### graph with current data and 2nd polynomial regression line with accurate data
plot(humidity~temperature, data=data)
lines(acc$temperature_com, fitted(fit2_com), col="red")

### fit current data and draw for 3rd polynomial regression
fit3 <- lm(humidity~temperature + I(temperature^2) + I(temperature^3), data=data)
summary(fit3)

### fit accurate data and draw for 3rd polynomial regression
fit3_com <- lm(humidity_com~temperature_com + I(temperature_com^2) + I(temperature_com^3), data=acc)
summary(fit3_com)

### graph with current data and 3rd polynomial regression line
plot(humidity~temperature, data=data)
lines(data$temperature, fitted(fit3), col="blue")

### graph with accurate data and 3rd polynomial regression line
plot(humidity_com~temperature_com, data=acc)
lines(acc$temperature_com, fitted(fit3_com), col="red")

### graph with current data and 3rd polynomial regression line with accurate data
plot(humidity~temperature, data=data)
lines(acc$temperature_com, fitted(fit3_com), col="red")

### made scatterplot with current data
scatterplot(temperature~humidity, data=data, pch=19,
            spread=FALSE, smoother.args=list(lty=2),
            main="current data",
            xlab="Temperature(Celsius)", ylab="Humidity(%)")

### made scatterplot with accurate data
scatterplot(temperature_com~humidity_com, data=acc, pch=19,
            spread=FALSE, smoother.args=list(lty=2),
            main="Compare data",
            xlab="Temperature(Celsius)", ylab="Humidity(%)")

## Process R data

data

Process_hum <- function(num_tem, num_hum){
  for(ac in acc){
    temper <- acc[ac, "temperature_com"]
    temper <- na.omit(temper)
    for(i in temper){
      if((num_tem <= (i + 0.5)) && (num_tem > (i - 0.5))){
        hum <- acc[ac, "humidity_com"][i] - num_hum
        return(hum)
      }
    }
  }
}

for(ac in acc){
  num_tem <- 20
  num_hum <- 0.25
  temper <- acc[ac, "temperature_com"]
  for(i in temper){
    if((num_tem <= (i + 0.5)) && (num_tem > (i - 0.5))){
      hum <- acc[ac, "humidity_com"][i] - num_hum
      print(hum)
      break
    }
  }
  break
}
List_hum <- function()
  {
  list_hum <- list()
  for(i in data[2]){
    i <- 23
    list_hum <- append(list_hum, Process_hum(data[i, "temperature"][i], data[i, "humidity"][i]))
  }
  return(list_hum)
}


for(i in data[2]){
  i <- 23
  print(Process_hum(data[23, "temperature"][23], data[23, "humidity"][23]))
}


Process_hum(30, 0.26)

List_hum()
