
#Code by RJ Neel

# Introductory Econometrics by J M Woolridge

# Chapter 1: Exercise: C2

head(bwght) #Data Set to load

?bwght

#(i) How many women are in the sample, and how many report smoking during pregnancy?

#Note: This data set contains all women
nrow(bwght) #No of women smoking

#(ii) What is the average number of cigarettes smoked per day? Is the average a good measure of the “typical” woman in this case? Explain. 

mean(bwght$cigs)
summary(bwght$cigs)
hist(bwght$cigs)
#Based on the histogram and range it appears to be a good measure.

#(iii) Among women who smoked during pregnancy, what is the average number of cigarettes smoked per day? How does this compare with your answer from part (ii), and why?

avg_all=mean(bwght$cigs)
avg_all

library(dplyr)
nrow(bwght %>% group_by(cigs) %>% filter(cigs=='0'))
s=(bwght %>% group_by(cigs) %>% filter(cigs>'0'))
avg_s=mean(s$cigs)
avg_s
hist(s$cigs, xlab='Pregnant Women Smokers')
#It markedly differs from the privious average by about 11 units.
