rm(list=ls())
d <- read.table("../Data/SparrowSize.txt", header = TRUE)

a<-read.table("../Data/Wylde_single.mounted.txt", header=T)
head(a)
library(lme4)

lmm1<-lmer(Femur_length~1+(1|ID), data=a)
summary(lmm1)
