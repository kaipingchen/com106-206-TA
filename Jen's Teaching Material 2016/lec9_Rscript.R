# Predict the 2008 Elections

setwd("/Users/jpan/Documents/GradSchool/Stanford/Teaching/Methods/w2015-2016/lecture")

# load data
pres08 <- read.csv("pres08.csv")
polls08 <- read.csv("polls08.csv")

# subset polls08 to home state
polls08.IN <- subset(polls08, polls08$state == "IN")

class(polls08$McCain)
summary(polls08.IN)
?subset()

poll08.IN2 <- polls08[polls08$state == "IN",]

# Calculate concept: Obama's vote margin
polls08$margin <- polls08$Obama - polls08$McCain
pres08$margin <- pres08$Obama - pres08$McCain


