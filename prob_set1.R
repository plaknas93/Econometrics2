
data=read.csv(file="D:/RWorks/Econometrics2/Datasets/problemset1.csv")
head(data)

#Visualize
library(ggplot2)
ggplot(data=data,aes(x=data$Unemployment,y=data$Violence,col=data$State))+geom_point()+xlab('Unemployment')+ylab('Violence')+ggtitle("Scatterplot: Unemployment vs Violence, States, 2010")

hist(data$Unemployment)
hist(data$Violence)
max(data$Violence)

#Talk to database use dplyr
library(tidyverse)
library(dplyr)

select(data,State)
filter(data,Violence=max(data$Violence))

     