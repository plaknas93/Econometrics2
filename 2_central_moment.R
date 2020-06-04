
# Consider two distributions

a=round(rnorm(100,mean=10,sd=2),2)
a
b=round(rnorm(100,mean=10,sd=2),2)
b

describe(a)
describe(b)


#Now check the means & sd of the two distributions
m_a=round(mean(a),2)
m_a
s_a=round(sd(a),2)
s_a

m_b=round(mean(b),2)
m_b
s_b=round(sd(b),2)
s_b

data.frame(m_a,s_a,m_b,s_b) #summary

data=data.frame(a,b)
head(data)

library('dplyr')
nrow(data %>% group_by(a) %>% filter(a>9.83)) #No of obs greater than mean

nrow(data %>% group_by(b) %>% filter(b>10.2))


##Obviously they are identical. Does it mean the distributions are identical?

##Let's check
hist(a,col='pink')
hist(b,col='light green')
ha=hist(a, breaks=10, col="pink", xlab="X", main="Histogram with Normal Curve")
xfit=seq(min(a),max(a),length=40)
yfit=dnorm(xfit,mean=mean(a),sd=sd(a))
yfit=yfit*diff(ha$mids[1:2])*length(a)
lines(xfit, yfit, col="blue", lwd=2)

data=data.frame(a,b)
head(data)
library(ggplot2)
h_a=ggplot(data,aes(a))+geom_histogram(col='blue',fill='pink',binwidth = 0.5)+ggtitle("Hstogram of 'a'")+xlab("a")+ylab('Frequency')
h_a



#Similarly, for b
hist(b,col='light green')
hb=hist(b, breaks=10, col="pink", xlab="X", main="Histogram with Normal Curve")
xfit=seq(min(b),max(b),length=40)
yfit=dnorm(xfit,mean=mean(b),sd=sd(b))
yfit=yfit*diff(hb$mids[1:2])*length(b)
lines(xfit, yfit, col="blue", lwd=2)
h_b=ggplot(data,aes(b))+geom_histogram(col='blue',fill='cornflower blue',binwidth = .5)+ggtitle("Hstogram of 'b'")+xlab("b")+ylab('Frequency')
h_b

# a and b Histograms
h_a
h_b

# Compare distributions a and b
library(sm)

#first assigning 'key' to a and b so we know which element belongs where
?rep 
ab=c(a,b)
ab
g=factor(rep(c('a','b'), each=100))
g

d=data.frame(ab,g)
head(d)

# plot densities
plot(density(a,bw = .6),col='red')
plot(density(b,bw=0.6),col='green')
?sm.density.compare
sm.density.compare(ab,g, xlab="X",bw=.6)
title("Comparison of Distributions of a and b")
legend("topright", levels(d$g),fill=2+(0:nlevels(d$g)))

#OR
library(ggplot2)
ggplot(d) + geom_density(aes(x = ab, color = g))+ggtitle('Comparison of Distributions of a and b')+xlab('x')+ylab('Probability(x)')


#So we need another measure to distinguish a and b. 

## Question: Which distribution has a value more distant to the mean?

### SKEWNESS
summary(data)

#Finding the Skewness
library(psych)
#By Calculation
sk_a=(sum((a-m_a)^3)/100)/(s_a^3) #Note: Skewness is calculated relative to the std deviation 
sk_a
skew(a) #Skew of a

sk_b=(sum((b-m_b)^3)/100)/(s_b^3)
sk_b
skew(b) #Skew of b

describe(a)
describe(b)

## Question: Which distribution has more outliers?

### Kurtosis
summary(data)

#Finding the Skewness
library(psych)
#By Calculation
kurt_a=(sum((a-m_a)^4)/100)/(s_a^4)-3 #Note: Kurtosis is calc rel to the std dev & normal dist
kurt_a
kurtosi(a) #kurt of a

kurt_b=((sum((b-m_b)^4)/100)/(s_b^4))-3 #Note: Kurtosis is calc rel to the std dev & normal dist
kurt_b
kurtosi(b) #Skew of b

kurt_a+3
kurt_b+3

describe(a)
describe(b)

#Visualizing Skewness

## Skewness indicates the symmetry or rather the lack of symmetry around the mean

a_sk=round((a-m_a)^3,2)
b_sk=round((b-m_b)^3,2)
d2=data.frame(a,a_sk,b,b_sk)
head(d2)
plot(a,a_sk,type='p',col='red')+title('Symmetry: a vs 3rd moment of a')
plot(b,b_sk,type='p',col='green')+title('Symmetry: b vs 3rd moment of b')

ab_sk=c(a_sk,b_sk)
ab_sk

g2=factor(rep(c('a_sk','b_sk'), each=100))
g2

d3=data.frame(ab_sk,g2)
head(d3)

# plot densities
head(d2)
ggplot(d2)+geom_line(aes(x=d2$a,y=d2$a_sk),col= 'red')+xlab('data')+ylab('3rd moment of data')+ggtitle("Comparing the data set with its 3rd Moment")

ggplot(d2)+geom_line(aes(x=d2$b,y=d2$b_sk),col='dark green',fill='')+xlab('data')+ylab('3rd moment of data')+ggtitle("Comparing the data set with its 3rd Moment")

ggplot(d2)+geom_line(aes(x=d2$a,y=d2$a_sk),col='red')+geom_line(aes(x=d2$b,y=d2$b_sk),col='dark green')+xlab('data')+ylab('3rd moment of data')+ggtitle("Comparing the two data sets with their 3rd Moment")

