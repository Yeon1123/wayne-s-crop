rm(list=ls())

require(graphics)

### Randomized Block Design ANOVA
#### Source : http://www.r-tutor.com/elementary-statistics/analysis-variance/randomized-block-design

df = read.csv("total_water.csv", header = TRUE)
rownames(df) <- c("2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018")
df
r = c(t(as.matrix(df)))
f = c("climate", "hand", "irrigrate")
k = 3
n = 9
tm = gl(k, 1, n*k, factor(f))
blk = gl(n, k, k*n)
av = aov(r ~ tm + blk)
summary(av)

datafile <- read.csv("add_water.csv", header = TRUE)
colnames(datafile) <- c("system", "add_water")
datafile
datafile$system <- as.factor(datafile$system)
tapply(datafile$add_water, datafile$system, mean)
tapply(datafile$add_water, datafile$system, sd)
bartlett.test(add_water~system, data=datafile)
data.lm3 <- lm(add_water~system, data=datafile)
anova(data.lm3)
data.res3<-resid(data.lm3)
shapiro.test(data.res3)
par(mfrow=c(3,2))
plot(data.lm3, which=1:6, las=1)
av3=aov(data.lm3)
TukeyHSD(av3)
