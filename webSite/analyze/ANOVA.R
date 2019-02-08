rm(list=ls())

require(graphics)

### Randomized Block Design ANOVA
#### Source : http://www.r-tutor.com/elementary-statistics/analysis-variance/randomized-block-design

df = read.csv("total_water.csv", header = TRUE)
rownames(df) <- c("2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018")
df
r = c(t(as.matrix(df)))
f = c("climate", "conventional", "irrigate")
k = 3
n = 9
tm = gl(k, 1, n*k, factor(f))
blk = gl(n, k, k*n)
av = aov(r ~ tm + blk)
summary(av)

### paired t-test
#### Source : https://kmrho1103.tistory.com/entry/2%EC%9E%A5-%EC%A7%9D%EC%A7%80%EC%96%B4%EC%A7%84-%EB%B9%84%EA%B5%90-Paired-TTest

datafile <- read.csv("add_water.csv", header = TRUE)
rownames(datafile) <- c("2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018")
datafile
with(datafile, shapiro.test(irrigate-hand))
with(datafile, t.test(irrigate-hand))
