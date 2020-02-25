
# Code by RJ Neel

## Computer Exercise C1

head(data)

#Find the average education level in the sample. What are the lowest and highest years of education?
summary(data$educ)
mean(data$educ) #avg education level
min(data$educ) #min education leve
max(data$educ) #max

hist(data$educ)

#Find the average hourly wage in the sample. Does it seem high or low?
mean(data$wage) 
hist(data$wage)
##The mean appears low

#The wage data are reported in 1976 dollars. Using the Internet or a printed source, find the Consumer Price Index (CPI) for the years 1976 and 2013.

View(data)

#How many women are in the sample? How many men?
head(data)
library(dplyr)
w=nrow(data %>% group_by(female) %>% filter(female==1))
m=nrow(data)-w  
w
m
mw = c(m,w)
mw
lbls = c("Men", "Women")
pct = round(mw/sum(mw)*100)
pct
lbls = paste(lbls, pct) # add percents to labels
lbls
pie(mw,labels = lbls, col=rainbow(length(lbls)),main="Pie Chart: Gender")
    
    