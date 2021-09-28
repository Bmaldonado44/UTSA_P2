##Read library packages
library(car);library(DescTools); library(MASS)

##Setting working directory
setwd("~/Desktop/Alg_I/Hw_2")

###Reading file 
car.file<-read.csv("cars_new.csv", header=TRUE)
##backawrd elimination###
full.model= aov(mpg_highway~ cylinders + origin + type, data = car.file)

Anova(full.model, type=3)

##Exercise A eliminating origin###
mod1=aov(mpg_highway ~ cylinders + type, data= car.file)
Anova(mod1, type=3)

##Summary
summary(mod1)

###Exercise B Interaction###
aov.car= aov(mpg_highway ~ cylinders + type + cylinders*type, data=car.file)
Anova(aov.car, type=3) 
summary(aov.car)

###Post-hoc####
TukeyHSD(aov.car)


