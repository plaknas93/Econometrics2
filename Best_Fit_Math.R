
# Mathematics Behind Line of Best Fit

#Height n cm
x=sample(100:200,30)
x

#Weight in kg
y=sample(50:180,30)
y

data=data.frame(x,y)

#Scatter plot
plot(x,y)
?hist
hist(y)

library(ggplot2)

p1=ggplot(data=data, aes(x=data$x,y=data$y))+geom_point(col='salmon',size=2)+xlab("height")+ylab("weight")+ggtitle("Height vs Weight: Scatterplot")
p1

p2=ggplot(data,aes(data$y))+geom_histogram(col='black',fill='grey')
p2

mx=round(mean(x),2)
mx
my=round(mean(y),2)
my

x_minus_mx= x-mx
y_minus_my= y-my

data2=data.frame(data,x_minus_mx,y_minus_my)
head(data2)

sum(x_minus_mx)
sum(y_minus_my)

b=cov(x,y)/var(x)
b
a=my-(b*mx)
a

pred_y=round(b*x+a,2)
pred_y
y

p1+geom_line(aes(y=pred_y),col='dark blue')
p1
p1+geom_smooth(method='lm')

lm(y~x)

