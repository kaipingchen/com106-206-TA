## Correlation

# set working directory:
setwd("/Users/jpan/Documents/GradSchool/Stanford/Teaching/Methods/w2015-2016/lecture")

# load the data

ginipolar <- read.csv("USgini_polar.csv")
head(ginipolar)
colnames(ginipolar)

# look at correlation
cor(ginipolar$gini, ginipolar$polarization)
cor(ginipolar$polarization, ginipolar$gini)

# calculating correlation on your own, using mean(), sd(), sum(), +
xzscore <- (ginipolar$gini - mean(ginipolar$gini)) / sd(ginipolar$gini)
yzscore <- (ginipolar$polarization - mean(ginipolar$polarization)) / sd(ginipolar$polarization)
sum(yzscore * xzscore) / (length(xzscore)-1)

cor(ginipolar$gini, ginipolar$polarization)



