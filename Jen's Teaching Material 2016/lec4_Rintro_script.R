#### These are my notes for Lecture 4

## Review objects and manipulting objects

# manually creating a vector of numbers
world.pop <- c(2525779, 3026003, 3691173, 4449049, 
               5320817, 6127700, 6916183)
world.pop
class(world.pop)  # this is a numeric vector

# we can do arithmetic operations on the vector, to all elements at once
pop.million <- world.pop / 1000
pop.million
pop.rate <- world.pop / world.pop[1]
pop.rate

## Functions: require an input ("argument"), sometimes require more than one

# useful function
length(pop.rate)
min(world.pop)
max(world.pop)
range(world.pop)
mean(world.pop)
sum(world.pop)
sum(world.pop) / length(world.pop)

# seq() requires 3 arguments, good to refer to them by name, eg.., from = 1950, instead of just 1950
year <- seq(from=1950, to = 2010, by=10)
year

# names() function show names of elements in an object
names(world.pop)

# can use assignment operator not only to create object but to change objects
# here we are putting the vector name as the names of the elments of the vector world.pop
names(world.pop) <- year
names(world.pop)


## Loading data

# the first thing you must do is to set the working directory to the folder where your data resides
getwd()  # check current working directory (probably not the folder with your data)
setwd("yourfolder/foldername/folderwiththefile/")
getwd()  # check current working directory again, should be the folder with your data

# reading in csv
UNpop.csv <- read.csv("UNpop.csv")

# reading in RData
load("UNpop.RData")
class(UNpop)   # data.frame (two dimensional)

# useful functions to look at data
names(UNpop)
nrow(UNpop)
ncol(UNpop)
dim(UNpop)
summary(UNpop)
View(UNpop)

class(UNpop)

# use the $ to refer to specific columns of UNpop data.frame
UNpop$year
UNpop$world.pop

# can also use square brackets [] to refer to specific numbers
UNpop[3,2]   # row 3, column 3
UNpop[3, "world.pop"]   # row 3, column "world.pop" (which is also column 2)
names(UNpop)   # two column names

# add another column to UNpop
ind <- seq(from=1, to=7, by=1) 
ind
UNpop$index <- ind
names(UNpop)  # three column names

# missing values are represented as NA, will mess up functions
mean(UNpop$world.pop)  # works fun
world.pop2 <- c(UNpop$world.pop, NA)  #add one NA to UNpop$world.pop vector
world.pop2
mean(world.pop2)   # doesn't work
mean(world.pop2, na.rm=TRUE)    # use arguments na.rm=TRUE to get funtion to work by ignoring NAs

# use assignment operator <- to change values of the first element of UNpop$index
UNpop$index[1]
UNpop$index[1]  <- 1000
UNpop$index[1]

# use assignment operator <- to change two population numbers (for 1960 and 1980)
UNpop$world.pop
UNpop[c(2,4),"world.pop"] <- c(3026103, 4449149)
UNpop$world.pop

# save new UNpop object with additional column and revised numbers as RData
save(UNpop, file = "myUNpop.RData")

# save new UNpop object with additional column and revised numbers as csv file
write.csv(UNpop, file = "myUNpop.csv")




