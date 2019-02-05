rm(list=ls())

# library, setup
library(ggplot2)
library(UsingR)
library(car)
library(gridExtra)
par("mar")
par(mar=c(1,1,1,1))

test = read.csv("feeds.csv",header = TRUE)
acc = read.csv("tem_hum_com.csv", header = TRUE)


test[,4] <- test[,4] * 0.01
test[,5] <- test[,5] / 950
data = test[,3:5]
time = test[,1]
data$time = time
data <- na.omit(data)
str(data)
acc <- na.omit(acc)
colnames(data) = c("temperature", "humidity", "soil_humidity", "time")
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
ggplot(data = data, aes(x=temperature, y=humidity))+geom_count()+geom_smooth(method="lm") + 
  annotate("text", label = fit_text, x = 8, y = 0.35)

### ggplot for accurate data
ggplot(data = acc, aes(x=temperature_com, y=humidity_com))+geom_count()+geom_smooth(method="lm") + 
  annotate("text", label = fit_com_text, x = 35, y = 0.3)

### fit current data and draw for linear regression
fit <- lm(humidity~temperature, data = data)
summary(fit)
fit_text <- paste0("y = ", substr(fit$coefficients[1],1,7), " + ", substr(fit$coefficients[2],1,7), "x")

### fit accurate data and draw for linear regression
fit_com <- lm(humidity_com~temperature_com, data = acc)
summary(fit_com)
fit_com_text <- paste0("y = ", substr(fit_com$coefficients[1],1,7), " + ", substr(fit_com$coefficients[2],1,7), "x")

### graph with current data and linear regression line
plot(humidity~temperature, data=data)
text(8,0.35, labels=fit_text)
abline(fit, col="blue")

### graph with accurate data and linear regression line
plot(humidity_com~temperature_com, data=acc)
text(35,0.3, labels=fit_com_text)
abline(fit_com, col="red")

### graph with current data and linear regression line with accurate data
plot(humidity~temperature, data=data)
text(8,0.35, labels=fit_com_text)
abline(fit_com, col="red")

### fit current data and draw for 2nd polynomial regression
fit2 <- lm(humidity~temperature+I(temperature^2), data=data)
summary(fit2)
fit2_text <- paste0("y = ", substr(fit2$coefficients[1],1,7), " + ", substr(fit2$coefficients[2],1,7), "x", " + ", substr(fit2$coefficients[3],1,7), "x^2")

### fit accurate data and draw for 2nd polynomial regression
fit2_com <- lm(humidity_com~temperature_com+I(temperature_com^2), data=acc)
summary(fit2_com)
fit2_com_text <- paste0("y = ", substr(fit2_com$coefficients[1],1,7), " + ", substr(fit2_com$coefficients[2],1,7), "x", " + ", substr(fit2_com$coefficients[3],1,7), "x^2")

### graph with current data and 2nd polynomial regression line
plot(humidity~temperature, data=data)
text(8,0.35, labels=fit2_text)
lines(data$temperature, fitted(fit2), col="blue")

### graph with accurate data and 2nd polynomial regression line
plot(humidity_com~temperature_com, data=acc)
text(35,0.3, labels=fit2_com_text)
lines(acc$temperature_com, fitted(fit2_com), col="red")

### graph with current data and 2nd polynomial regression line with accurate data
plot(humidity~temperature, data=data)
text(8,0.35, labels=fit2_com_text)
lines(acc$temperature_com, fitted(fit2_com), col="red")

### fit current data and draw for 3rd polynomial regression
fit3 <- lm(humidity~temperature + I(temperature^2) + I(temperature^3), data=data)
summary(fit3)
fit3_text <- paste0("y = ", substr(fit3$coefficients[1],1,7), " + ", substr(fit3$coefficients[2],1,7), "x", " + ", substr(fit3$coefficients[3],1,7), "x^2", " + ", substr(fit3$coefficients[4],1,7), "x^3")

### fit accurate data and draw for 3rd polynomial regression
fit3_com <- lm(humidity_com~temperature_com + I(temperature_com^2) + I(temperature_com^3), data=acc)
summary(fit3_com)
fit3_com_text <- paste0("y = ", substr(fit3_com$coefficients[1],1,7), " + ", substr(fit3_com$coefficients[2],1,7), "x", " + ", substr(fit3_com$coefficients[3],1,7), "x^2", " + ", substr(fit3_com$coefficients[4],1,7), "x^3")

### graph with current data and 3rd polynomial regression line
plot(humidity~temperature, data=data)
text(8,0.35, labels=fit3_text)
lines(data$temperature, fitted(fit3), col="blue")

### graph with accurate data and 3rd polynomial regression line
plot(humidity_com~temperature_com, data=acc)
text(35,0.3, labels=fit3_com_text)
lines(acc$temperature_com, fitted(fit3_com), col="red")

### graph with current data and 3rd polynomial regression line with accurate data
plot(humidity~temperature, data=data)
text(8,0.35, labels=fit3_com_text)
lines(acc$temperature_com, fitted(fit3_com), col="red")

### made scatterplot with current data
scatterplot(temperature~humidity, data=data, pch=19,
            spread=FALSE, smoother.args=list(lty=2),
            regLine=TRUE,
            main=fit_text,
            xlab="Temperature(Celsius)", ylab="Humidity(%)")

### made scatterplot with accurate data
scatterplot(temperature_com~humidity_com, data=acc, pch=19,
            spread=FALSE, smoother.args=list(lty=2),
            regLine=TRUE,
            main=fit_com_text,
            xlab="Temperature(Celsius)", ylab="Humidity(%)")

## Process R data
Process_hum <- function(num_tem, num_hum){
  for(ac in acc){
    temper <- acc[ac, "temperature_com"]
    temper <- na.omit(temper)
    for(i in temper){
      if((num_tem <= (i + 0.5)) && (num_tem > (i - 0.5))){
        i = 
        hum <- acc[ac, "humidity_com"][i] - num_hum
        return(hum)
      }
    }
  }
}

num <- nrow(data)
List_hum <- function()
  {
  list_hum <- c()
  red <- c()
  for(i in 1:num){
    list_hum<-rbind(list_hum, c(Process_hum(data[i,1], data[i,2]),i))
  }
  return(list_hum)
}

data$process <- List_hum()[,1]
data$acc <- data$process + data$humidity

colnames(data) = c("temperature", "humidity", "soil_humidity", "time", "process", "acc")
plot(data$time, data$humidity, col="red", ylim=range(0,1))
points(data$time, data$acc, col="blue")

plot(data$time, data$humidity, col="red", ylim=range(0,1))
points(data$time, data$soil_humidity, col="blue")
str(data)

plot(data$humidity, data$soil_humidity, col="red",xlim=range(0,0.5), ylim=range(0,0.5))

ggplot(data = data, aes(x=humidity, y=soil_humidity))+geom_count()+geom_smooth(method="lm")

# Basic Scatterplot Matrix
pairs(~temperature+humidity+soil_humidity+process+acc, data=data,
      main="Simple Scatterplot Matrix")

# Scatterplot Matrixes from the car Package
scatterplotMatrix(~temperature+humidity+soil_humidity+process+acc, data=data, main="Three Cylinder Options")

# Panel Correlation
panel.cor <- function(x, y, digits = 2, cex.cor, ...)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  # correlation coefficient
  r <- cor(x, y)
  txt <- format(c(r, 0.123456789), digits = digits)[1]
  txt <- paste("r= ", txt, sep = "")
  text(0.5, 0.6, txt)
  
  # p-value calculation
  p <- cor.test(x, y)$p.value
  txt2 <- format(c(p, 0.123456789), digits = digits)[1]
  txt2 <- paste("p= ", txt2, sep = "")
  if(p<0.001) txt2 <- paste("p= ", "<0.001", sep = "")
  text(0.5, 0.4, txt2)
}

pairs(data, upper.panel = panel.cor)

scatterplotMatrix(~temperature_com+humidity_com, data=acc, main="Three Cylinder Options")
