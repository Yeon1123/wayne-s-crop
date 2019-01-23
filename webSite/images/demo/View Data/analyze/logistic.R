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
library(nnet)
library(glm2)
par("mar")
par(mar=c(1,1,1,1))

# Open data
test = read.csv("data.csv",header = TRUE)
acc = read.csv("tem_hum_com.csv", header = TRUE)
test <- na.omit(test)
test[,4] <- test[,4] * 0.01
data = test[,3:4]

temperature <- data[,1]
humidity <- data[,2]
temperature_com <- acc[,1]
humidity_com <- acc[,2]

### Fit the logistic regression with binary outcome
g0 <- glm(humidity~., family=quasibinomial(), data=data) # if many explantory variables, chain it with +. ex) X+Z+X1
summary(g0)

g1 <- glm(humidity_com~., family=quasibinomial(), data=acc) # if many explantory variables, chain it with +. ex) X+Z+X1
summary(g1)

### predict the probability
B <- g0$coefficients
x.vec <- data$field1

B1 <- g1$coefficients
x.vec1 <- acc$temperature

hY <- exp(B[1] + B[2]*x.vec) / (1+exp(B[1] + B[2]*x.vec))
g0$fitted.values[1:10]
hY[1:10]

hY1 <- exp(B1[1] + B1[2]*x.vec1) / (1+exp(B1[1] + B1[2]*x.vec1))
g1$fitted.values[1:10]
hY1[1:10]

### Figure 4.2
plot(x.vec,hY,xlab="Width",ylab="Predicted probability",ylim=c(0,1),cex=.5,col="red")
points(x.vec,data$humidity,col="gray50")
EL <- -B[1]/B[2]
abline(v=EL,col="gray50",lty=2)
abline(h=0.5, col="gray50", lty=2)


plot(x.vec1,hY1,xlab="Width",ylab="Predicted probability",ylim=c(0,1),cex=.5,col="red")
points(x.vec1,acc$temperature,col="gray50")
EL1 <- -B1[1]/B1[2]
abline(v=EL1,col="gray50",lty=2)
abline(h=0.5, col="gray50", lty=2)

### Odds ratio: page 114
exp(B[2]) # log odds effect

### LR test 
ratio <- g0$null.deviance-g0$deviance    
p.value <- 1-pchisq(ratio,df=161)

# correlation
cor(data$field1,data$field2)

### LR test 
ratio1 <- g1$null.deviance-g1$deviance    
p.value1 <- 1-pchisq(ratio,df=44)

# correlation
cor(acc$temperature,acc$humidity)

# fit the multinomial logit model
fit0 <- multinom(humidity~temperature,data=data) # model 1 (our interest)
fit1 <- multinom(humidity~1,data=data) # model 0 (uner H_0)

fit2 <- multinom(humidity_com~temperature_com,data=acc) # model 1 (our interest)
fit3 <- multinom(humidity_com~1,data=acc) # model 0 (uner H_0)

ratio.likelihood <- fit0$deviance - fit1$deviance
p.value <- pchisq(ratio.likelihood, df=161, lower.tail=F)

ratio.likelihood1 <- fit2$deviance - 