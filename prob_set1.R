

data=read.csv(file="D:/RWorks/Econometrics2/Datasets/problemset1.csv")
head(data)

# Visualize
library(ggplot2)

#Scatterplot
ggplot(data=data,aes(x=data$Unemployment,y=data$Violence,col=data$State))+geom_point()+xlab('Unemployment')+ylab('Violence')+ggtitle("Scatterplot: Unemployment vs Violence, States, 2010")

ggplot(data=data,aes(x=data$Unemployment,y=data$Violence)),labels=rownames(data$State))+geom_point()+xlab('Unemployment')+ylab('Violence')+ggtitle("Scatterplot: Unemployment vs Violence, States, 2010")+geom_text()

#Boxplot
ggplot(data=data,aes(x=data$Unemployment,y=data$Violence))+xlab('Unemployment')+ylab('Violence')+ggtitle("Boxplot: Unemployment vs Violence, States, 2010")+geom_boxplot(outlier.colour="red", outlier.shape=25,outlier.size=6, notch=FALSE)

boxplot(data$Unemployment)
boxplot(data$Violence)

#Density plot
library(e1071)
par(mfrow=c(1, 2))  # divide graph area in 2 columns
plot(density(data$Unemployment), main="Density Plot: Unemployment", ylab="Frequency", sub=paste("Skewness:", round(e1071::skewness(data$Unemployment), 2)))  # density plot for 'Unemployment'
polygon(density(data$Unemployment), col="pink")

plot(density(data$Violence), main="Density Plot: Violence", ylab="Frequency", sub=paste("Skewness:", round(e1071::skewness(data$Violence), 2)))  # density plot for 'Violence'
polygon(density(data$Violence), col="light green")

#Histogram
hist(data$Unemployment,col='pink',main = "Histogram of Unemployment",xlab='Unemployment by States')
hist(data$Violence,col='light green',main = "Histogram of Violence",xlab = 'Violence by States')


# Simple Quantification
cor(data$Unemployment,data$Violence)


# Talk to database use dplyr
library(tidyverse)
library(dplyr)

#State with the highest crime rate
max(data$Violence)
data %>% select(State,Violence) %>% filter(Violence==max(Violence))


# Run Regression
fit=lm(data,formula=data$Violence~data$Unemployment)
summary(fit)

# Q8: Coeff of Unemployment?
b=fit$coefficients
b[2] #Coeff of Unemployment

#Interpretation : For 1% increase in unemployment an additional 53 cases of increase in crime can be expected

# Q9: Effect of 1 std deviation increase in Unemployment
sd(data$Unemployment)
#Thus, we need to find the change in Violence for 1.5 increase in Unemployment
1.54*53 #Approx 82.
sd(data$Violence)
82/195 #Increase in std deviation of violence

# Q10: Effect of 1 std deviation increase in Violence
fit2=lm(data,formula=data$Unemployment~data$Violence)
summary(fit2)
0.003*sd(data$Violence) # = 0.58 is the effect of sd on Uneployment

# Can fit2 be rearrange to calculate violence?
## NO By fit1: V = 24.4+53.35*U and fit2: U=5.48+.003*V
## Rearranging fit2
.003^(-1) #333.33
5.48/.003 #1826.67
# Yielding : V=-1826.67+333.33U
#

# Q 11: Does Unemployment CAUSE Violence?
## Regression does not infer causality. It may or may not be the case or it may simply happen that a third  factor causes both

