# install.packages('ggplot2')
library(ggplot2)
# install.packages('RColorBrewer')
library(RColorBrewer)
# install.packages('swirl')
library(swirl)

getwd()  #得到当前工作目录
?setwd('')  #设置工作环境

statesInfo <- read.csv('C:\\Users\\Administrator\\Desktop\\R\\EDA_Course_Materials\\lesson2\\stateData.csv')

statesSubset <- subset(statesInfo, state.region == 1) #筛选子集（字段state.region == 1所有数据）
#statesSubset <-  statesInfo[statesInfo$state.region == 1, ]
head(statesSubset, 2)
dim(statesSubset)
names(statesSubset)  #得到所有的字段名 ()
str(statesSubset) #得到数据字段的总结概述
summary(statesSubset) #得到字段数据的统计描述
na.omit(statesSubset) #清除数据中的缺失值

statesSubset$newcol <- statesSubset$state.area + statesSubset$state.region  #增加新字段
# statesSubset <- subset(statesSubset, select = -newcol)
statesSubset <- statesSubset[, -newcol]


getwd()
setwd('C:/Users/Administrator/Desktop/R/EDA_Course_Materials/lesson2')
reddit <- read.csv('reddit.csv')
# reddit <- read.csv('C:/Users/Administrator/Desktop/R/EDA_Course_Materials/lesson2/reddit.csv')

str(reddit)

summary(reddit)

table(reddit$employment.status) #查看数据类别的数量

levels(reddit$age.range) #查看离散数据不同的水平（levels）

qplot(data = reddit, x = age.range)
qplot(data = reddit, x = income.range)

#设置因子变量的顺序
levels(reddit$age.range)
ageLevels <- c("Under 18", "18-24", "25-34", "35-44", "45-54", "55-64", "65 or Above")
# reddit$age.range <- ordered(x = reddit$age.range, levels = ageLevels)
reddit$age.range <- factor(x = reddit$age.range, levels = ageLevels, ordered = T)
qplot(data = reddit, x = age.range)

levels(reddit$income.range)
incomeLevels <- c("Under $20,000", "$20,000 - $29,999" , "$30,000 - $39,999", "$40,000 - $49,999",
                  "$50,000 - $69,999", "$70,000 - $99,999", "$100,000 - $149,999","$150,000 or more")
reddit$income.range <- ordered(x = reddit$income.range, levels = incomeLevels)
qplot(data = reddit, x = income.range)
















