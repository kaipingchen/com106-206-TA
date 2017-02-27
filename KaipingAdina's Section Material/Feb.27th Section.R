#### Section 4.2: Linear Regression

setwd("~/Source-Code/qss/PREDICTION")
face <- read.csv("face.csv") ## Dataset shows facial appearance predicts election outcome better than chance
## Let's see if we see a relationship between perceived competence and the actual election outcome
head(face)

## A Brief Review of Subsetting
# How do I examine who are the winners of year 2000, of year 2002? Subsetting!
year_2000_winner = face$winner[face$year == "2000"]
# How do I obtain the vote share of the winner party when the winner party is republican?
republican_win_vote_share = face$r.votes[face$w.party=="R"]


## Today's Takeaway 1: How to Perform Correlation and Scatter Plots?
# We want to know the relationship between vote share (Dependent Variable) and candidate competence (Independent Variable)
## preparation: compute the DV - two-party vote share for Democrats and Republicans
face$d.share <- face$d.votes / (face$d.votes + face$r.votes)
face$r.share <- face$r.votes / (face$d.votes + face$r.votes)
face$diff.share <- face$d.share - face$r.share

plot(face$d.comp, face$diff.share) ## Do a visual inspection - is there a correlation? 
cor(face$d.comp, face$diff.share) # Important function: cor(). You can use it in your analyzing DreamCatcher data: the relationship between IV and DV

## Today's Takeaway 2: How to perform Ordinary Least Squares (Linear Regression)

fit <- lm(diff.share ~ d.comp, data = face) # fit the model
fit
summary(fit)


# Intepretaion of the coefficient: If the perceived competence score increases by 10 percentage points, the outcome varialbe is predicted to increase on average by 6.6 percetage points.
# The above interpretation is important to remember because this is how you should write for your results if you use linear regression in your project

# Draw the scatterplot between your DV and IV! (Visualization of the linear regression model!)
plot(face$d.comp, face$diff.share, xlim = c(0, 1.05), ylim = c(-1,1),
     xlab = "Competence scores for Democrats",
     ylab = "Democratic margin in vote share",
     main = "Facial competence and vote share")
abline(fit) # add regression line


#Today's Takeaway3: You can also perform linear regression with many IVs, therefore, you can control for confounding variables. This is multilinear regression.
fit2 <- lm(diff.share ~ d.comp + w.party , data = face)
class(face$w.party) ## note this is a factor variable.
levels(face$w.party) ## with two levels.  This means one level will be in the equation, and one will be omitted.
fit2 ## note how it changes the d.comp coefficient
summary(fit2)

# To interpret the coefficient for w.partyR: the when the winning party is Republican, the difference (d.comp-r.comp) is 43% lower.


