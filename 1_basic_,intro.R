
#Introductory Concepts

#Code by RJ Neel

#Example Data set
data=read.csv(file='D:/RWorks/Econometrics2/Datasets/auto_data.csv')
head(data)
nrow(data) #Counts number of rows

##The whole data set of interest is called Population
##e.g All females playing basketball in USA

## Let us visualize relation between MPG and Weight.
## Before that let us think and guess this relationship
## My guess is that Mileage should decrease with weight
## So how do I check?

## Let's keep correlation and covariance aside and beigin with a scatter plot

plot(x=data$Weight1000lb,y=data$MPG) #Simple Scatterplot

## It appears my intuition was right

## Using ggplot

library(ggplot2)
ggplot(data = data,aes(x=data$Weight1000lb,y=data$MPG))+geom_point(col='red')+xlab("Weight in thousand lb")+ylab("Miles per gallon")

## It appears my intution was right heavier cars tend to be bad at mileage.
## So how do quantify this? -Correlation

cor_wt_mpg=cor(data$Weight1000lb,data$MPG)
cor_wt_mpg # Confirms strong correlation

## Next we find this correlation for all variables using Correlation Matrix
head(data)
ncol(data)
cor_mat=cor(data) #First Column Non-Numeric hence must be dropped 
cor_mat=cor(data[2:8]) 
cor_mat
cor_mat=round(cor_mat,2)
cor_mat

## Other Methods of Visualizing Correlation Matrix

library(corrplot)
?corrplot
corrplot(cor_mat,type='lower',method='number', order = "alphabet", tl.col = 'Black', tl.srt = 30,title='Correlation Matrix')
corrplot(cor_mat, order = "hclust", tl.col = "black", tl.srt = 45)
corrplot(cor_mat,type='lower', order = "hclust", tl.col = 'Magenta', tl.srt = 45)
corrplot(cor_mat,type='lower', order = "alphabet", tl.col = 'Black', tl.srt = 90)

library("PerformanceAnalytics")
my_data <- data[2:8]
chart.Correlation(my_data, histogram=TRUE, pch=19)

#Line of Best fit

## Correlation is a useful way to visualize realtion between two variables. But we are interested in more than just knowing the positivity or negativity of that relation. We want it to tell us something more useful.

## In other word we want to predict one varible with the help of another

## This is what Econometrics is all about.

## Let us consider an example
data=mtcars
head(data)
chart.Correlation(data, histogram=TRUE, pch=19)

## For simplicity let us choose two variables with a positive relationship
## mpg and drat
library(ggplot2)
?ggplot
ggplot(data=data,aes(y=mpg,x=drat))+geom_point(col='dark green')+xlab("drat")+ylab("Miles per gallon")+ggtitle("Scatter Plot: drat vs MPG")



       