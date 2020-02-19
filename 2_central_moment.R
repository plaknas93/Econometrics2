
# Consider two distributions

a=rnorm(100,mean=10,sd=2)
b=rnorm(100,mean=10,sd=2)

#Now check the means & sd of the two distributions
mean(a)
mean(b)
sd(a)
sd(b)

##Obviously they are identical. Does it mean the distributions are identical?

##Let's check
hist(a,col='pink')
hist(b,col='light green')
ha=hist(a, breaks=10, col="pink", xlab="X", main="Histogram with Normal Curve")
xfit=seq(min(a),max(a),length=40)
yfit=dnorm(xfit,mean=mean(a),sd=sd(a))
yfit=yfit*diff(ha$mids[1:2])*length(a)
lines(xfit, yfit, col="blue", lwd=2)

#Similarly, for y
hist(b,col='light green')
hb=hist(b, breaks=10, col="pink", xlab="X", main="Histogram with Normal Curve")
xfit=seq(min(b),max(b),length=40)
yfit=dnorm(xfit,mean=mean(b),sd=sd(b))
yfit=yfit*diff(hb$mids[1:2])*length(b)
lines(xfit, yfit, col="blue", lwd=2)


# Compare distributions a and b
library(sm)
ab=c(a,b)
ab
g=rep(1:2, rep(100,2))
g
# plot densities
?sm.density.compare
sm.density.compare(ab,g, xlab="X")

#So we need another measure to distinguish a and b
library(psych)
describe(a)
describe(b)

mean(a)
ax=a-mean(a)
plot(a,(ax^2))
plot(a,ax^3)
plot(a,ax^4)

mean(b)
bx=b-mean(b)
plot(b,(bx^2))
plot(b,bx^3)
plot(b,bx^4)
