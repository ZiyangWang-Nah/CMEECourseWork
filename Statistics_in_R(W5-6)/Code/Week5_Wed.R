rm(list = ls())
# create three data sets y with different variances (1, 10, 100)
# rnorm() requires sample size (20), mean and sd
y1<-x + rnorm(10, mean=0, sd=sqrt(1))
var(y1)
y2<-x + rnorm(10, mean=0, sd=sqrt(10))
var(y2)
y3<-x + rnorm(10, mean=0, sd=sqrt(100))
var(y3)

# create x variable for plotting
x<-seq(1,10)
# making a 1x3 plot using mfrow() (look it up if you don't know what that does)
par(mfrow = c(1, 3))
plot(x, y1, xlim=c(-0.1,0.1), ylim=c(-12,12), pch=19, cex=0.8, col="red")
abline(v=0)
abline(h=0)
plot(x, y2, xlim=c(-0.1,0.1), ylim=c(-12,12), pch=19, cex=0.8, col="blue")
abline(v=0)
abline(h=0)
plot(x, y3, xlim=c(-0.1,0.1), ylim=c(-12,12), pch=19, cex=0.8,, col="darkgreen")
abline(v=0)
abline(h=0)

cov(x,y1)
cov(x,y2)
cov(x,y3)
cor(x,y1)
cor(x,y2)
cor(x,y3)

#########################
daphnia <- read.delim("../Data/daphnia.txt")
summary(daphnia)
seFun <- function(x) {
  sqrt(var(x)/length(x))
}
detergentMean <- with(daphnia, tapply(Growth.rate, INDEX = Detergent,
                                      FUN = mean))
detergentSEM <- with(daphnia, tapply(Growth.rate, INDEX = Detergent,
                                     FUN = seFun))
cloneMean <- with(daphnia, tapply(Growth.rate, INDEX = Daphnia, FUN = mean))
cloneSEM <- with(daphnia, tapply(Growth.rate, INDEX = Daphnia, FUN = seFun))

#1
rm(list=ls())
timber <- read.delim("../Data/timber.txt")
summary(timber)

results <- lm(volume ~ girth + height, data = timber)
summary(results)
plot(results)
dev.off()

dev.new()
timber_rmoutlier <- timber[-31,]
results_1 <- lm(volume~ girth + height, data = timber_rmoutlier)
summary(results_1)
plot(results_1)

#2
plantGrowth <- read.delim("../Data/ipomopsis.txt")
summary(plantGrowth)
result_plant <- lm(Fruit ~ Root + Grazing, data = plantGrowth)
summary(result_plant)
anova(result_plant)
# Find out what are null,max and final model

#3
