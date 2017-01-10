### These are my notes for Lecture 3

# This is using R as a calculator
2+18   # I can add with R
29495/3 # I can divide
3*7  # This is multiplication
12^2  # This is taking something to the power of
5*10- # order of operations applies
sqrt(16)  # this is a function that takes the square root

# Objects
comm106 <- 40
comm106fun <- "really awesome"

myadding <- 2+18
myadding2 <- 2+20
myadding3 <- 2+100  #this is just notes that R ignores

myadding.str <- "20"

ls()  # this is a function that shows me all the objects in my environment

# Classes of objects
class() # this is a function that tells me the class of my objects
class(myadding)  # this is a numeric object
class(myadding.str)  # this is a character object
class(sqrt)    # this is a function object

# Vector
backrow <- c("samby", "erica", "paulina", "mariah", "lauren", 
             "maddie", "jordan", "lauren", "tess")
backrow  # this is a vector of characters

frontarea <- c("noor", "barry", "jean", "cat", "miles", "elodie", "nick")

somestudents <- c(backrow, frontarea)
somestudents

somestudents[1]
somestudents[9]
somestudents[c(1,9)]
somestudents[1,9]
somestudents[-4]


###### Continuing notes from Lecture 4 on objects
world.pop <- c(2525779, 3026003, 3691173, 4449049, 
               5320817, 6127700, 6916183)
world.pop
class(world.pop)

pop.million <- world.pop / 1000
pop.million
pop.rate <- world.pop / world.pop[1]
pop.rate

## Functions
sqrt(4)
c(5,6,7,7)
sum()
class()
log()

# useful function
length(pop.rate)
min(world.pop)
max(world.pop)
range(world.pop)
mean(world.pop)
sum(world.pop)
sum(world.pop) / length(world.pop)

year <- seq(from=1950, to = 2010, by=10)
year

names(world.pop) <- year
names(world.pop)

##### Loading data

getwd()
setwd("/Users/jpan/Documents/GradSchool/Stanford/Teaching/Methods/w2015-2016/lecture/")

# reading in csv
UNpop.csv <- read.csv("UNpop.csv")

# reading in RData
load("UNpop.RData")

class(UNpop)

names(UNpop)
nrow(UNpop)
ncol(UNpop)
dim(UNpop)
summary(UNpop)
View(UNpop)

class(UNpop)
names(UNpop)
UNpop$year
UNpop$world.pop

UNpop[3,2]
UNpop[3, "world.pop"]
names(UNpop)

ind <- seq(from=1, to=7, by=1)
UNpop$index <- ind
names(UNpop)

mean(UNpop$world.pop)
world.pop2 <- c(UNpop$world.pop, NA)
world.pop2
mean(world.pop2)
mean(world.pop2, na.rm=TRUE)

UNpop$index[1]  <- 1000

UNpop[c(2,4),"world.pop"] <- c("3026103", "4449149")
UNpop[c(2,4),"world.pop"] <- c(3026103, 4449149)

UNpop$world.pop

save(UNpop, file = "myUNpop.RData")
write.csv(UNpop, file = "myUNpop.csv")




