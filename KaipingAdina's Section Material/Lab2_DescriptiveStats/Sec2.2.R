#### Section 2.2: Subsetting the Data in R

### Quick note on logical data - TRUE or FALSE/ 1 or 0
class(TRUE)
as.integer(TRUE)
as.integer(FALSE)

## This is a logical vector, it contains only "TRUE" and "FALSE". Note: when creating this vector, 
## you do not need to put TRUE and FALSE in quotes.
x <- c(TRUE, FALSE, TRUE) # a vector with logical values

mean(x) # proportion of TRUEs
sum(x) # number of TRUEs

### Section 2.2.2: Relational Operators
## Learn the symbols ==, !=, >, <, <=, >=, &, |

4 > 3
"Hello" == "hello"  # R is case-sensitive

x <- c(3, 2, 1, -2, -1)
x >= 2

## Which ones in the x vector are GREATER than 0 AND Less than or equal to two?
##logical conjunction of two vectors with logical values
(x > 0) & (x <= 2)
## Which ones in the x vector are greater than two OR less than or equal to -1?
##logical disjunction of two vectors with logical values
(x > 2) | (x <= -1)

x.int <- (x > 0) & (x <= 2) # Now create a new object (logical vector) 
x.int

### Section 2.2.3: Subsetting

## callback rate for race == "black"
## First import the resume file (note: please set up your working directory ot the place where you have the dataset)
resume <- read.csv("resume.csv")
## Quickly look at your data
head(resume)
dim(resume)

##What is the callback rate?  Need to look just at the column "call" and find out how many that have 
## race == "black" received a call back.
## Note, when subsetting a single vector, you don't need a comma in the brackets [ ]
## When subsetting a data frame, you need the comma to tell R which row and column you are subsetting

##First, how do you access one column (variable) in a data set?
resume$call

#next, if you just want the callback info for respondents whose race == black, need to subset the column
resume$call[resume$race == "black"]

##finally, can perform the mean function on your subsetted data.  And you can do this all in one row:
mean(resume$call[resume$race == "black"]) ## Note the parentheses. Function works on everything inside parentheses is 

## MOre ways to look at subsets: race of first 5 observations
resume$race[c(1, 2, 3, 4, 5)]
resume$race[1:5]  

## comparison of first 5 observations
(resume$race == "black")[1:5] 

## Create a new data frame, with only race == black (note the comma in the brackets)
resumeB <- resume[resume$race == "black", ] 
dim(resumeB) # this data.frame has fewer rows than the original data.frame
mean(resumeB$call) # callback rate for blacks

##Create new datasets with subset function.

## keep "call" and "firstname" variables 
## also keep observations with black female-sounding names
resumeBf <- subset(resume, select = c("call", "firstname"),
                   subset = (race == "black" & sex == "female"))
head(resumeBf)

### Section 2.2.4: Simple Conditional Statements: IFELSE

#create a new variable that makes a black female 1 and everyone else a 0...why?
resume$BlackFemale <- ifelse(resume$race == "black" & 
                               resume$sex == "female", 1, 0)

### Section 2.2.5: Factor Variables - important for any categorical variable (nominal)

resume$type[resume$race == "black" & resume$sex == "female"] <- "BlackFemale"
resume$type[resume$race == "black" & resume$sex == "male"] <- "BlackMale"
resume$type[resume$race == "white" & resume$sex == "female"] <- "WhiteFemale"
resume$type[resume$race == "white" & resume$sex == "male"] <- "WhiteMale"

## check object class
class(resume$type)

## coerce new character variable into a factor variable
resume$type <- as.factor(resume$type)
## list all levels of a factor variable
levels(resume$type)

## obtain the number of observations for each level
table(resume$type)
tapply(resume$call, resume$type, mean)

## turn first name into a factor variable 
resume$firstname <- as.factor(resume$firstname)
## compute callback rate for each first name
callback.name <- tapply(resume$call, resume$firstname, mean)
## sort the result in the increasing order
sort(callback.name)
