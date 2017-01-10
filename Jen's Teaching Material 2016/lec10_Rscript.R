### Lecture 10: Making Comparisons

# Compare with cross-tabulations

setwd("/Users/jpan/Documents/GradSchool/Stanford/Teaching/Methods/w2015-2016/lecture")
shave <- read.csv("shave.csv")
View(shave)

table(shave$gender)
table(shave$shaveface)
table(shave$shaveface, shave$gender) # want independent var in column
#table(shave$gender, shave$shaveface)

table(shave$shaveface, shave$gender)

# recode the shaveface variable so it is in order
ifelse(truefalsestatement, valueifstatementtrue, valueifstatefalse)
shave$yes <- ifelse(shave$shaveface == "frequently" | 
                    shave$shaveface == "occasionally" |
                    shave$shaveface == "rarely" |
                    shave$shaveface == "sometimes", 1, 0)
shave$yes2 <- ifelse(shave$shaveface == "never", 0, 1)

shave$ordered <- ifelse(shave$shaveface == "never", 5, 
                 ifelse(shave$shaveface == "rarely", 4, 
                 ifelse(shave$shaveface == "occasionally", 3,
                 ifelse(shave$shaveface == "sometimes", 2, 1))))
table(shave$ordered)
table(shave$shaveface)

mytable <- table(shave$ordered, shave$gender)
mytable

prop.table(mytable, 2)  # columns sum to 1
prop.table(mytable, 1)  # rows sum to 1 (BAD)

# Comparison of means
men <- subset(shave, shave$gender == "male")
women <- subset(shave, shave$gender == "female")

mean(men$height)
mean(women$height)