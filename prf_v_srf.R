
#PRF vs SRF

library(wooldridge)
library(cowplot)
library(broom)
library(ggpubr)

#OLS

##PRF
head(vote1)
data= data.frame(vote=vote1$voteA,contri=round(vote1$shareA,2))

head(data)
nrow(data) #Population Size

fit=lm(vote~contri,data)
summary(fit)
fit
#Scatterplot+Regression line
vote_share_plot=ggplot(data=data,aes(x=contri,y=vote))+geom_point(col='salmon')+ggtitle("Scatterplot: Voting Outcomes vs Campaign Expenditure")+geom_smooth(method='lm',se=FALSE,col='red')+annotate("text", x=95, y=40, label = "R^2 == 0.85", parse=T)+annotate("text", x=95, y=35, label = "hat(alpha) == 26.81", parse=T)+annotate("text", x=95, y=30, label = "hat(beta) == 0.46", parse=T)+theme_bw()

vote_share_plot

##SRF
sdata=sample_n(data,50)
head(sdata)
nrow(sdata)

fit_s=lm(vote~contri,sdata)
summary(fit_s)
fit_s

p=ggplot(sdata,aes(x=contri,y=vote))+geom_point(col='green')+geom_smooth(method='lm',se=FALSE,col='green')+theme_bw()+stat_regline_equation(label.x = 18, label.y = 70)
p

z= vote_share_plot+geom_point(data=sdata,col='green')+geom_smooth(data=sdata,method='lm',se=FALSE,col='green')+theme_bw()+stat_regline_equation(label.x = 18, label.y = 70)

print(z)
