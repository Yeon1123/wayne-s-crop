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
par("mar")
par(mar=c(1,1,1,1))

# Open data
test = read.csv("feed.csv",header = TRUE)
acc = read.csv("..//compare//tem_hum_com.csv", header = TRUE)
test1 = test[,3:4]
View(test1)

temperature <- test1[,1]
humidity <- test1[,2]
temperature_com <- acc[,1]
humidity_com <- acc[,2]

fit1 <- multinom(humidity_com~temperature_com,data=acc) # model 1 (our interest)
fit0 <- multinom(humidity_com~1,data=acc) # model 0 (uner H_0)

ratio.likelihood <- fit0$deviance - fit1$deviance
p.value <- pchisq(ratio.likelihood, df=2, lower.tail=F)

pred <- fit1$fitted.values # fitted probabilty for each category
plot(temperature_com,pred[,1],col="red",ylim=c(0,1),xlim=range(temperature_com),xlab="Size of alligator",ylab="Predicted probability")
points(temperature_com,pred[,2],col="blue")
points(temperature_com,pred[,3],col="black")
