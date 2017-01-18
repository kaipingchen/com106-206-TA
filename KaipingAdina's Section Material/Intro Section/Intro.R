#### Comm106/206 Introduction Section
#### Source: QSS Book (edited by Adina Abeles, Kaiping Chen)

### R is a calculator!  Arithmetic Operations
1 + 2
1 / 2
1 ^ 2
1 * (10 - 3)
sqrt(4)  ## an example of a function

###  Objects
##Case sensitive
##Can be over written
##Don't use special R symbols like $ or % or letters like c

x <- 1 + 2 # create object with assignment operator: <-
x
print(x) # Besides printing x to see it in the console window, you can also see x in the environment window
class(x) # class defines the type of an object you have created. In this case, class of x is numeric.



programmingR <-"fun" # use intuitive and informative names to name your object
class(programmingR) #character
programmingR <- "fun and challenging"
programmingR

##Classes

class(x) ## this is numeric - can perform arithmetic
class(programmingR) ## this is a character - cannot perform arithmentic
class(sqrt) ## this is a function

###  Vectors - one dimensional colelction of information in a specific order

world.pop <- c(2525779, 3026003, 3691173, 4449049, 5320817, 6127700, 6916183) # create a vector

pop.first <- c(2525779, 3026003, 3691173)
pop.second <- c(4449049, 5320817, 6127700, 6916183)
pop.all <- c(pop.first, pop.second) # concatenate two vectors pop.first and pop.second into one vector
pop.all

##Indexing

world.pop[2] # use square brackets [] to access specific elements of a vector
world.pop[c(2, 4)] # access the second and forth element in the vector world.pop
world.pop[-3] # the minus sign - removes the corresponding element from a vector

pop.million <- world.pop / 1000 # arithmetic operations of vector
pop.million

pop.rate <- world.pop / world.pop[1]  #expressing population as a proportion of the 1950 world population
pop.rate

##Change certain numbers of a vector
world.pop[c(2, 3)]<- c(302600, 3690000)
world.pop

### Functions
## Existing functions of R
length(world.pop) ## how many elements in the vector
min(world.pop)    ## smallest number in the vector 
max(world.pop)    ##largest number in the vector
range(world.pop)  ## smallest and largest number in the vector
mean(world.pop)    ##arithmatic mean of vector elements
sum(world.pop) / length(world.pop) ##another way of getting the mean

##Special look at the sequence function
year <- seq(from = 1950, to = 2010, by = 10) ##This creates another vector (numeric elements in a one-dimensional array), and another object (assigned to the name 'year')
year
names(world.pop) 
names(world.pop) <- year # assign a name label to a vector
names(world.pop) 

## You can also create your own functions in R!  
##Kaiping: might this be too much?  I know it is in book...but wonder if we need it?  Maybe?
my.summary <- function(x){ # function takes one input
  s.out <- sum(x) # adding all the values in a vector together
  l.out <- length(x) # l.out stores the length of vector x: how many elements in x
  m.out <- s.out / l.out
  out <- c(s.out, l.out, m.out) # define the output
  names(out) <- c("sum", "length", "mean") # add labels to the values in the vector "out"
  return(out) # end function by calling output! Must Return!!
}

my.summary(world.pop)

### Data Files
##Kaiping - should we send students the csv, dta and save files?

setwd("~/Source-Code/qss/INTRO") # set your working directory: where you store data files and scripts
##Since they won't have qss/INTRO data, we will have to send to them.  We can do that during class or ahead of time?
##We may want to set the workding directory first.  I always start out with setting my wd.
#For instance, I would recommend setting a working directory for section/group work:
#setwd("~/Users/aabeles/Documents/Comm106/Section"
#I also always set up an "R Project" so I can keep track of my different projects...but not sure if that is the best way for everyone?
## getwd()

UNpop <- read.csv("UNpop.csv") # read in a csv type data file
class(UNpop) #"data.frame"
head(UNpop) # look the first several rows of your data file
View(UNpop) # look all of the rows in your data file, discuss rows and columns. Most of your data will be in a dataframe. Think of the columns as 'variables'

names(UNpop) # look at the names of the variables in the data file
nrow(UNpop) # the number of rows in the data file: how many observations you have
ncol(UNpop)
dim(UNpop) 
summary(UNpop) # the basic statistic summary of your data file: min, max, mean, median etc.

### Packages
## I think I would put this right here, so this section is about importing different kinds of data.

install.packages("foreign") # install a package called "foreign" to read data files in .dta, .spss format
library("foreign") # load the package

#read.dta("UNpop.dta")
#read.spss("UNpop.sav")

UNpop$world.pop # inspect the values of one variable in your data file

##When using brackets, remember [row, column]
UNpop[, "world.pop"] # equivalent to the above code line


UNpop[c(1, 2, 3),]   # extract the first three rows (and all columns)
UNpop[1:3, "year"]   # extract the first three rows of the "year" column

world.pop <- c(UNpop$world.pop, NA)
world.pop
mean(world.pop)
mean(world.pop, na.rm = TRUE) # using na.rm=TRUE to ignore the missing values in your data set when calculate mean

### Saving Objects

write.csv(UNpop, file = "UNpop.csv")


