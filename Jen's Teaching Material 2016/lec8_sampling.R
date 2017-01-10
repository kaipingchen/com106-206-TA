# Lecture 8: Look at the repsentativeness of a sample of data

# Set working directory
setwd("/Users/jpan/Documents/GradSchool/Stanford/Teaching/Methods/w2015-2016/lecture")

# Load the dataset
afghan <- read.csv("afghan-village.csv")
dim(afghan)
head(afghan)

# Look at descriptive statistics
summary(afghan)
mean(afghan$population)
sd(afghan$population)

# Make boxplot comparing altitude of villages sampled and not sampled
boxplot(altitude ~ village.surveyed, 
        data = afghan,
        ylab = "Altitude (meters)",
        names = c("non-sampled", "sampled"))

# Make boxplot comparing population of villages sampled
boxplot(population ~ village.surveyed, 
        data = afghan,
        ylim = c(0,2000),
        ylab = "Ppopulation",
        names = c("non-sampled", "sampled"))

boxplot(log(population) ~ village.surveyed, 
        data = afghan,
        ylab = "Ppopulation",
        names = c("non-sampled", "sampled"))

# why we need names = c("non-sampled", "sampled")
table(afghan$village.surveyed)

# Difference with taking the log
# (reduces the range of teh data)
hist(afghan$population)
hist(log(afghan$population))
head(afghan$population, 20)
head(log(afghan$population), 20)
