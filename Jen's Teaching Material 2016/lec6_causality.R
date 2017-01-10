### Notes for Lecture 6: Causality

# Load data

setwd("/Users/jpan/Documents/GradSchool/Stanford/Teaching/Methods/w2015-2016/lecture")
resume <- read.csv("resume.csv")

# Look at data
class(resume)
dim(resume)

names(resume)
colnames(resume)
rownames(resume)

resume[1,]  # first row
resume[,1]  # first colum

head(resume)
tail(resume)
head(resume, 10)

summary(resume)
table(resume$race)

race.call.tab <- table(race = resume$race, 
                       call = resume$call)

race.call.tab

# overall callback rate
sum(race.call.tab[,2]) / nrow(resume)
sum(resume$call) / nrow(resume)
summary(resume)
mean(resume$call)

# call back for each race
race.call.tab

race.call.tab[1,2] / sum(race.call.tab[1,])
157 / (2278 + 157)

race.call.tab[2,2] / sum(race.call.tab[2,])

# Subsetting

class(TRUE)
class(FALSE)

FALSE & TRUE # and
FALSE | TRUE # or

4 > 3
"Helloooooo" == "helloooooo"
"Hello" != "hello"

midrow <- c("joe", "laura", "cayla", "alejandra", "patricia", "karen", "paulina")
midrow
midrow == "joe"
midrow == "cayla"
midrow == "laura" | midrow == "karen"

# callback rate for black sounding names by subsetting
resume.b <- resume[resume$race == "black",]
mean(resume.b$call)

mean(resume$call[resume$race == "black"])

table(resume$race[resume$call == 1])
race.call.tab

# use the function subset() to subset
resume.bf <- subset(resume, 
                    select = c("call", "firstname"),
                    subset = (race =="black") & (sex =="female"))
class(resume.bf)
dim(resume.bf)
head(resume.bf)
mean(resume.bf$call)

resume.bf2 <- subset(resume, 
                    subset = (race =="black") & (sex =="female"))
head(resume.bf2)

resume.wf <- subset(resume, 
                     subset = (race !="black") & (sex =="female"))
head(resume.wf)

resume.wm <- subset(resume, 
                    subset = (race !="black") & (sex !="female"))
head(resume.wm)
