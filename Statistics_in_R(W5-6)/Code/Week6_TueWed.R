rm(list=ls())

d<-read.table("../Data/SparrowSize.txt", header=TRUE)
str(d)
names(d)
hist(d$Tarsus, main="", xlab="Sparrow tarsus length (mm)", col="grey")

hist(d$Tarsus, main="", xlab="Sparrow tarsus length (mm)", col="grey",
     prob=TRUE) # this argument tells R to plot density instead of frequency,
lines(density(d$Tarsus,na.rm=TRUE), # density plot
      lwd = 2)
abline(v = mean(d$Tarsus, na.rm = TRUE), col = "red",lwd = 2)
abline(v = mean(d$Tarsus, na.rm = TRUE)-sd(d$Tarsus, na.rm = TRUE), col = "blue",lwd = 2, lty=5)
abline(v = mean(d$Tarsus, na.rm = TRUE)+sd(d$Tarsus, na.rm = TRUE), col = "blue",lwd = 2, lty=5)

t.test(d$Tarsus~d$Sex)
par(mfrow=c(2,1))
hist(d$Tarsus[d$Sex==1], main="", xlab="Male sparrow tarsus length (mm)", col
     ="grey", prob=TRUE)
lines(density(d$Tarsus[d$Sex==1],na.rm=TRUE), lwd = 2)
abline(v = mean(d$Tarsus[d$Sex==1], na.rm = TRUE), col = "red",lwd = 2)
abline(v = mean(d$Tarsus[d$Sex==1], na.rm = TRUE)-sd(d$Tarsus[d$Sex==1], na.rm = TRUE), col = "blue",lwd = 2, lty=5)
abline(v = mean(d$Tarsus[d$Sex==1], na.rm = TRUE)+sd(d$Tarsus[d$Sex==1], na.rm = TRUE), col = "blue",lwd = 2, lty=5)
hist(d$Tarsus[d$Sex==0], main="", xlab="Female sparrow tarsus length (mm)", col="grey", prob=TRUE)
lines(density(d$Tarsus[d$Sex==0],na.rm=TRUE), lwd = 2)
abline(v = mean(d$Tarsus[d$Sex==0], na.rm = TRUE), col = "red",lwd = 2)
abline(v = mean(d$Tarsus[d$Sex==0], na.rm = TRUE)-sd(d$Tarsus[d$Sex==0], na.rm = TRUE), col = "blue",lwd = 2, lty=5)
abline(v = mean(d$Tarsus[d$Sex==0], na.rm = TRUE)+sd(d$Tarsus[d$Sex==0], na.rm = TRUE), col = "blue",lwd = 2, lty=5)
dev.off()

d1 <- d %>% filter(!is.na(Tarsus)) %>% filter(!is.na(Wing))
sumz<-var(d1$Tarsus)+var(d1$Wing)+2*cov(d1$Tarsus,d1$Wing)
test<-var(d1$Tarsus+d1$Wing)

#####
uni<-read.table("../Data/RUnicorns.txt", header=T)
str(uni)

hist(uni$Bodymass)
hist(uni$Hornlength)
hist(uni$Height)

par(mfrow=c(2,1))
boxplot(uni$Bodymass~uni$Pregnant)
plot(uni$Hornlength[uni$Pregnant==0],uni$Bodymass[uni$Pregnant==0], pch=19, xlab="Horn length", ylab="Body mass", xlim=c(2,10), ylim=c(6,19))
points(uni$Hornlength[uni$Pregnant==1],uni$Bodymass[uni$Pregnant==1], pch=19,col="red")

#######################
library(lme4)
library(lmtest)
d<-read.csv("../Data/ObserverRepeatability.csv", header=T)
str(d)

d<-subset(d, d$Tarsus<=40)
d<-subset(d, d$Tarsus>=10)

mT1<-lmer(Tarsus~1+(1|StudentID), data=d)
mT2<-lmer(Tarsus~1+(1|StudentID)+(1|GroupN), data=d)
lrtest(mT1,mT2)

summary(mT2)

mB1 <- lmer(BillWidth~1+(1|StudentID), data=d)
mB2 <- lmer(BillWidth~1+(1|StudentID) + (1|GroupN), data=d)
lrtest(mB1,mB2)

summary(mB1)
