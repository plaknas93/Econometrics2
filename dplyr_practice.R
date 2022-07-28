

# DPLYR practice in R

## 5 Basic verbs: filter, select, arrange, summarise, mutate [plus group_by]

## Joints: inner, outer, anti

## Window functions: ranking, offsets and more

library(dplyr)
library(ggplot2)
library(hflights)
library(tibble)

data=read.csv(file='D:/RWorks/Risk-Management/Risk-Management/Data/cl_cg_proj_data_5Y.csv')
View(data)


View(hflights)
summary(hflights)
head(hflights)

flights = as_tibble(hflights) #local dataframe
head(flights)
data.frame(head(flights))


### Verb 1: Filter: Keeps rows matching a criteria

#Comma is for AND function
filter(flights, Month==1,DayofMonth==1)
filter(data,year==2017,tq>3,industry=="Textiles")
filter(data,year==2017:2018 & tq>1.0 & tq<1.1 & industry=="Financial Services")


### Verb 1: Filter: Keeps rows matching a criteria

#',' and '&' are for AND function and '|' is for OR
filter(flights, Month==1,DayofMonth==1)
filter(data,year==2017,tq>3,industry=="Textiles")
filter(data,year==2017:2018 & tq>1.0 & tq<1.1 & industry=="Financial Services")

filter(data,year==2017,ln_tq_100>=100 & ln_tq_100<=300, industry=="Services" |industry=="Textiles")


### Verb 2: Select: Pick columns by name
select(flights,Year,Month)

head(select(data,symbol,roa,year))
head(select(data,symbol,year,roa, contains('be')))
head(select(data,symbol,year,roa, matches('ta')))
head(select(data,symbol,year,roa, starts_with('in')))

#Chaining '%>%": Alternative to write dply code. Facilitates better readability


mean(data$roa)
min(data$roa)

data %>% select(symbol,year,roa) %>% filter(roa==max(roa)) #%>% head()
data %>% select(symbol,year,roa) %>% filter(roa==min(roa)) #%>% head()
d2=data %>% select(symbol,year,roa) %>% filter(year==2021) #%>% head()
d2%>% select(symbol,year,roa) %>% filter(roa==min(roa))


### Verb 3: arrange: Reorder rows
data %>% select(symbol,year,roa) %>% filter(year==2021 & roa>25) %>% arrange(desc(roa)) #%>% head()

### Verb 4: mutate: Add new variable
data %>% select(symbol,year,esg,roa,tot_assets) %>% filter(year==2021 & roa>25) %>% arrange(desc(roa)) %>% mutate(ln_ta=log(tot_assets),esgXroa=esg*roa) %>% mutate_if(is.numeric,round,digits=2)

### Verb 5: summarize: Reduces variables to values

#summarize
d3=data %>% select(symbol,industry,year,esg,roa,tot_assets,tq) %>% mutate_if(is.numeric,round,digits=2) %>% group_by(industry,year) %>% summarize(avg_roa=mean(roa),avg_tq=mean(tq))
d3

#summarize_each
data %>% select(symbol,industry,year,esg,roa,tot_assets,tq) %>% mutate_if(is.numeric,round,digits=2) %>% group_by(industry,year) %>% summarize_each(funs(mean),roa,tq)

#summarize_each with row count

#Find the number of companies in each industry
d4=data %>% filter(year==2021) %>% group_by(industry) %>% summarize(count=n()) 
sum(d4$count)

#Find the average number of women directors in an industry each year
data %>% select(symbol, year,industry, bsize,ind_dir,num_w_bd) %>% group_by(industr,year) %>% summarize(avg_w_dir_ind=mean(num_w_bd))

data %>% filter(year==2021) %>% group_by(industry) %>% select(ind_type) %>% table()

glimpse(data)
