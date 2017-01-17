#### Comm106/206 Introduction Section
#### Source: QSS Book (edited by Adina Abeles, Kaiping Chen)

### Arithmetic Operations
1 + 2
1 / 2
1 ^ 2
1 * (10 - 3)
sqrt(4)

###  Objects

x <- 1 + 2 # create object with assignment operator: <-
x
print(x) # Besides printing x to see it in the console window, you can also see x in the environment window
class(x) # class defines the type of an object you have created. In this case, class of x is numeric.


programmingR <-"fun" # use intuitive and informative names to name your object
class(programmingR) #character
programmingR <- "fun and challenging"
programmingR


###  Vectors

world.pop <- c(2525779, 3026003, 3691173, 4449049, 5320817, 6127700, 6916183) # create a vector

pop.first <- c(2525779, 3026003, 3691173)
pop.second <- c(4449049, 5320817, 6127700, 6916183)
pop.all <- c(pop.first, pop.second) # concatenate two vectors pop.first and pop.second into one vector
pop.all

world.pop[2] # use square brackets [] to access specific elements of a vector
world.pop[c(2, 4)] # access the second and forth element in the vector world.pop
world.pop[-3] # the minus sign - removes the corresponding element from a vector

pop.million <- world.pop / 1000 # arithmetic operations of vector
pop.million

pop.rate <- world.pop / world.pop[1]
pop.rate

### Functions
## Existing functions of R
length(world.pop) 
min(world.pop)     
max(world.pop)     
range(world.pop)   
mean(world.pop)    
sum(world.pop) / length(world.pop) 

year <- seq(from = 1950, to = 2010, by = 10)
year
names(world.pop) 
names(world.pop) <- year # assign a name label to a vector
names(world.pop) 

## You can also create your own functions in R!
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

setwd("~/Source-Code/qss/INTRO") # set your working directory: where you store data files and scripts
## getwd()

UNpop <- read.csv("UNpop.csv") # read in a csv type data file
class(UNpop) #"data.frame"
head(UNpop) # look the first several rows of your data file
View(UNpop) # look all of the rows in your data file

names(UNpop) # look at the names of the variables in the data file
nrow(UNpop) # the number of rows in the data file: how many observations you have
ncol(UNpop)
dim(UNpop) 
summary(UNpop) # the basic statistic summary of your data file: min, max, mean, median etc.

UNpop$world.pop # inspect the values of one variable in your data file
UNpop[, "world.pop"] # equivalent to the above code line

UNpop[c(1, 2, 3),]   # extract the first three rows (and all columns)
UNpop[1:3, "year"]   # extract the first three rows of the "year" column

world.pop <- c(UNpop$world.pop, NA)
world.pop
mean(world.pop)
mean(world.pop, na.rm = TRUE) # using na.rm=TRUE to ignore the missing values in your data set when calculate mean

### Saving Objects

write.csv(UNpop, file = "UNpop.csv")

### Packages

install.packages("foreign") # install a package called "foreign" to read data files in .dta, .spss format
library("foreign") # load the package

#read.dta("UNpop.dta")
#read.spss("UNpop.sav")
