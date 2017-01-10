## Linear regression in R

setwd("/Users/jpan/Documents/GradSchool/Stanford/Teaching/Methods/w2015-2016/lecture")
face <- read.csv("face.csv")

names(face)
head(face)

# Vote share for democrats and republicans
face$d.share <- face$d.votes / (face$d.votes + face$r.votes)
face$r.share <- face$r.votes / (face$d.votes + face$r.votes)
face$diff.share <- face$d.share - face$r.share

# Scatterplot of competence and vote share
plot(face$d.comp, face$diff.share,
     xlab = "Competence scores for Democrats",
     ylab = "Democratic margin in vote share",
     main = "Facial Competence and Vote Share")

# Correlation between competence and vote share
cor(face$d.comp, face$diff.share)

# Linear regression
lm(Y ~ X)
lm(face$diff.share ~ face$d.comp)
myols <- lm(diff.share ~ d.comp, data = face)
myols
#summary(myols)

# Scatterplot of competence and vote share with regression
plot(face$d.comp, face$diff.share,
     xlab = "Competence scores for Democrats",
     ylab = "Democratic margin in vote share",
     main = "Facial Competence and Vote Share")
abline(myols)
