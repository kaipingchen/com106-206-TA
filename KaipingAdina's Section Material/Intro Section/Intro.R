#### Comm106/206 Introduction Section
#### Source: QSS Book (edited by Adina Abeles, Kaiping Chen)

### R is a calculator!  Arithmetic Operations
1 + 2

###  Objects
##Case sensitive
##Can be over written
##Don't use special R symbols like $ or % or letters like c

x <- 1 + 2 # create object with assignment operator: <-
x # you can also see x in the Environment window
class(x) # class defines the type of an object you have created. In this case, class of x is numeric.

programmingR <-"fun" # use intuitive and informative names to name your object
class(programmingR) #the type of this object is character
programmingR <- "fun and challenging" # reassign the value of your object
programmingR

###  Vectors - one dimensional colelction of information in a specific order
## create a vector NOTE THE IMPORTANCE OF THE C FOR CONCATENATION. This essentially puts whatever you have in the parentheses into a vector
my_highschool_years_grade <- c(90, 100, 95, 99) 
my_college_years_grade <- c(60, 70, 80, 90)
## concatenate two vectors to create a new vector
my_grades <- c(my_highschool_years_grade, my_college_years_grade)
## indexing (very important, please digest!)
# inspect the value of the second element in my_grades
my_grades[2]
# replace the second element in my_grades from 100 to 93
my_grades[2] = 93
# remove the first element in my_grades
my_grades[-1] ## this doesn't work.  This just provides you a list without the first element, but does not actually REMOVE the first element.
# note: you must assign it to my_grades in order to really do the remove!!
my_grades <- my_grades[-1]
# Save the first and third element in my_grades to a new object (K: should we say object instead of variable here? so we don't confuse ? - A)
my_grades_partial = my_grades[c(1,3)]


### Functions (please read this yourself)
## Existing functions of R
length(world.pop) ## how many elements in the vector
min(world.pop,na.rm=TRUE)    ## smallest number in the vector 
max(world.pop,na.rm=TRUE)    ##largest number in the vector
range(world.pop,na.rm=TRUE)  ## the smallest and largest number in the vector
mean(world.pop,na.rm=TRUE)    ##arithmatic mean of vector elements

### Working with a dataset
## import data Files
setwd("~/Source-Code/qss/INTRO") # set your working directory: where you store data files and scripts
# We highly suggest you create a folder called comm106206 and a subfolder called section to store all section related data and scripts.
UNpop <- read.csv("UNpop.csv") # read in a csv type data file

## inspect your data
head(UNpop) # look the first several rows of your data file
dim(UNpop)  # look at the dimension of your dataset: how many rows (obs) and columns
summary(UNpop) # the basic statistic summary of your data file: min, max, mean, median etc.
View(UNpop) ## K: I think we should add this in here, so they see how they can see the data.  
#I also will take a moment to make sure they know rows and columns, and to make sure they know the columns are the variables

UNpop$world.pop # inspect the values of one variable in your data file

## indexing revisited
##Here we should emphasize [ROW, COLUMN]
UNpop_partial1 = UNpop[c(1, 2, 3),]   # extract the first three rows (and all columns)
UNpop_partial1 = UNpop[1:3, ] # this is the same
UNpop_partial2 = UNpop[1:3, "year"]   # extract the first three rows of the "year" column

## Saving Objects
## save the newly generated data frames from R into your current working directory
write.csv(UNpop_partial1, file = "UNpop_first_three_rows.csv")




### Turnout Exercise Solutions ###K: I'm worried this will freak them out a bit - we'll have to go slowly with them :)
turnout <- read.csv("turnout.csv")
dim(turnout)
n.obs = dim(turnout)[1]
summary(turnout)
VEPtr <- turnout$total/turnout$VEP
first_half_years <- turnout[1:(n.obs/2),] # first half
write.csv(first_half_years, file = "turnout_first_half.csv")

