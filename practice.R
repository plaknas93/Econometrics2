
#Load


library(ggplot2)

data=data.frame(x=sample(1:50,15),y=sample(51:99,15))
data

a=ggplot(data=data, aes(x=x,y=y))+geom_point(col='red',size=2.5)+ggtitle("## Scatterplot: X vs Y ##")+xlab('X')+ylab('Y')

a

#Note the there is a relation but not linear
m=mean(data$y)
m

for(i in 1:15)
{
  m1[i]=round((data$y[i]-m),2)
}  

m1
m2=round(m1^2,2)
m2
m3=round(m1^3,2)
m4=round(m1^4,2)

d2=data.frame(data,m1,m2,m3,m4)

d2

b=ggplot(data=data, aes(x=x))+geom_point(aes(y=y),col='red',size=2.5)+ggtitle("## Scatterplot: X vs Y ##")+xlab('X')+ylab('Y')+geom_line(aes(y=m1),col='blue')

b

a
b

a+geom_smooth(method=lm)
