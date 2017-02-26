#### Section 4.2: Linear Regression

setwd("~/Source-Code/qss/PREDICTION")
face <- read.csv("face.csv")
head(face)

## A Brief Review of Subsetting
# How do I examine who are the winners of year 2000, of year 2002? Subsetting!
year_2000_winner = face$winner[face$year == "2000"]
# How do I obtain the vote share of the winner party when the winner party is republican?
republican_win_vote_share = face$r.votes[face$w.party=="R"]


## Today's Takeaway 1: How to Perform Correlation and Scatter Plots?
# We want to know the relationship between vote share (DV) and candidate competence (IV)
## preparation: compute the DV - two-party vote share for Democrats and Republicans
face$d.share <- face$d.votes / (face$d.votes + face$r.votes)
face$r.share <- face$r.votes / (face$d.votes + face$r.votes)
face$diff.share <- face$d.share - face$r.share

cor(face$d.comp, face$diff.share) # Important function: cor(). You can use it in your analyzing DreamCatcher data: the relationship between IV and DV

## Today's Takeaway 2: How to perform Least Square (Linear Regression)

fit <- lm(diff.share ~ d.comp, data = face) # fit the model
fit
# Intepretaion of the coefficient: If the perceived competence score increases by 10 percentage points, the outcome varialbe is predicted to increase on average by 6.6 percetage points.
# The above interpretation is important to remember because this is how you should write for your results if you use linear regression in your project

# Draw the scatterplot between your DV and IV! (Visualization of the linear regression model!)
plot(face$d.comp, face$diff.share, xlim = c(0, 1.05), ylim = c(-1,1),
     xlab = "Competence scores for Democrats",
     ylab = "Democratic margin in vote share",
     main = "Facial competence and vote share")
abline(fit) # add regression line


# Adina, should I cover how to comupter ROot-Mean-Sauared Error, those things from text book page 157-160? Did Jen cover that in the lecture?


#### Section 7.2: Hypothesis Testing
# Adina, I feel I cannot talk about this in Monday section because Jen is going to cover sampling and survey in the Tuesday lecture. Therefore, students know nothing about sampling before Tuesday, what do you think?