##Install packages
#install.packages("BSDA")
install.packages("car")
library(car)
install.packages("DescTools")
library(DescTools)

####Setting directory####
setwd("~/Desktop/Alg_I/Hw_2")

bp<-read.csv("heartbpchol.csv", header=TRUE)
str(bp)

#####Balanced or unbalanced####
table(bp$Cholesterol)
#####One-Way ANOVA######
aov.bp= aov(Cholesterol~BP_Status, data=bp)

####testing variance #####
leveneTest(aov.bp)

##Statistical Summary###
summary(aov.bp)
###Plot anova##
plot(aov.bp)

###
par(mfrow=c(2,2)) # diagnostics plot - in one 
plot(aov.bp)
par(mfrow=c(1,1))

###Boxplot##
boxplot(Cholesterol~BP_Status, data = bp, main="Blood
        pressure")

###R-square##
lm.res=lm(Cholesterol~ BP_Status, data =bp)
anova(lm.res)

summary(lm.res)$r.squared

###Exercise B##
##Two-sample t-test###
ScheffeTest(aov.bp)
##Optimal-Normal highest pvalue
##Optimal-High lowest pvalue