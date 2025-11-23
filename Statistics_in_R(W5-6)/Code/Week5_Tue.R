rm(list=ls())
install.packages("WebPower")
library(WebPower)

res.1<-wp.t(n1=seq(20,300,20), n2=seq(20,300,20), d=0.25, type="two.sample", alternative="two.sided")
res.1
plot(res.1, xvar='n1', yvar='power')

#1
bac_power <- wp.t(n1 = 300, n2 = 300, d = 0.11, type = "two.sample", alternative = "two.sided")
bac_power #Power is too low to conclude a significant diff

###############

#1 Ans:12
#2 Ans:80
#3
x <- seq(0,50, by = 0.1)
y <- -1+2*x-0.15*x^2 
plot(x,y)
segments(0,-1000,0,500,lty = 3)
segments(-60,0,60,0,lty = 3)
# Peak year when x = -b/2a = 6.6 years old. Putting this x value back to the formula we got y = 5.67 offsprings at their peak ages
#4
x <- seq(100,500, by = 50)
y <- -1+2*x-0.08*x^2
plot(x,y)

###############
library(graphics)

#1
## Annette Dobson (1990) "An Introduction to Generalized Linear Models".
## Page 9: Plant Weight Data.
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)
lm.D9 <- lm(weight ~ group)
lm.D90 <- lm(weight ~ group - 1) # omitting intercept

anova(lm.D9)
summary(lm.D90)

opar <- par(mfrow = c(2,2), oma = c(0, 0, 1.1, 0))
plot(lm.D9, las = 1)      # Residuals, Fitted, ...
par(opar)

#2
u <- runif(20)

## The following relations always hold :
punif(u) == u
dunif(u) == 1

var(runif(10000))  #- ~ = 1/12 = .08333

#################
d<-read.table("../Data/SparrowSize.txt", header=TRUE)
d2 <- d %>% filter(!is.na(Tarsus)) %>% filter(!is.na(Mass))
d2$z.Tarsus<-scale(d2$Tarsus)
model3<-lm(Mass~z.Tarsus, data=d2)
summary(model3)

#Last question
d_bill_mass <- d %>% filter(!is.na(Bill)) %>% filter(!is.na(Mass))
results <- lm(d_bill_mass$Mass~d_bill_mass$Bill)
summary(results)

t.test(d_bill_mass$Mass~d_bill_mass$Sex) #Sex do have a difference on mass 
d_onlymale <- d_bill_mass %>% filter(Sex.1 == "male")
d_onlyfemale <- d_bill_mass %>% filter(Sex.1 == "female")
results1 <- lm(d_onlyfemale$Mass~d_onlyfemale$Bill)
results2 <- lm(d_onlymale$Mass~d_onlymale$Bill)
summary(results1)
summary(results2)
