##### Chapter 3: Measurement

#### Section 3.3: Visualizating the Univariate Distribution

### Section 3.3.1: Bar Plot
##Represent a proportion of respondents in each response category

##First let's get some data.  We'll use afghan.csv

## load data (please set up your working directory)
afghan <- read.csv("afghan.csv")

## summarize variables of interest (ISAF = Inernational Scurity Assitance Force)
colnames(afghan)
dim(afghan)
head(afghan)
summary(afghan$age)
summary(afghan$educ.years)
summary(afghan$employed)
summary(afghan$income)
par(cex = 1.5)

## a vector of proportions to plot
table(afghan$violent.exp.ISAF) ## Table gives you a count. Note the column names.
table(ISAF = afghan$violent.exp.ISAF) # now we are naming the table.
prop.table(table(ISAF = afghan$violent.exp.ISAF, 
                 exclude = NULL)) ## This provides propotions rather than a count.  Exclude = NULL means to include missing data.
ISAF.ptable <- prop.table(table(ISAF = afghan$violent.exp.ISAF, 
                                exclude = NULL)) ## Now saving the proportion table as an object
ISAF.ptable 

## make barplots by specifying a certain range for y-axis
barplot(ISAF.ptable) ## straight bar plot.  Below, can add names and axis limits:
barplot(ISAF.ptable,
        names.arg = c("No harm", "Harm", "Nonresponse"), #args are the categories in specific order
        main = "Civilian victimization by the ISAF", ## main is title of your plot
        xlab = "Response category", ##xaxis label
        ylab = "Proportion of the respondents", ylim = c(0, 0.7)) ##yaxis label and the scale of y axis

### Section 3.3.2: Histogram
##Create histogram for age.
hist(afghan$age, freq = FALSE, ylim = c(0, 0.04), xlab = "Age", ## set frequence to FALSE or will give you frequency instead of density
     main = "Distribution of respondent's age")

par(cex = 1.5)

## histogram of education.  use `breaks' to choose bins 
summary(afghan$educ.years) ## get a sense of your data

## by creating our own bins, we can center the bars around the integers 1, 2, 3...
hist(afghan$educ.years, freq = FALSE, 
     breaks = seq(from = -0.5, to = 18.5, by = 1), ## telling the histogram to start at -.05, go to 18.5 and make the wideth of the bins = 1
     xlab = "Years of education", 
     main = "Distribution of respondent's education")

## add a text label at (x, y) = (3, 0.5)
text(x = 3, y = 0.5, "median") ## Tell the graph where to add a text, and what text to add

## add a vertical line representing median
abline(v = median(afghan$educ.years))  #Tell the graph to add a vertical line (abline)

## if you want to add a horizontal line: abline(h = )
## if you want to add a slope line: abline(a = y, b = s), where y is the intercept and b is the slope

## Want to add some color?  Add col = to your arguments:, want an interesting line?  try out lty = 
#Want to change the thickness?  Try out lwd = 
abline(v = median(afghan$educ.years), col = "red", lty = "dashed", lwd=2)

### Section 3.3.3: Box Plot
## now we want to visualize the quartiles, identify outliers.
##Look at age distribution.
boxplot(afghan$age, main = "Distribution of Age", ylab = "Age", ylim = c(10, 80))
hist(afghan$age)

##usually want to use boxplot to compare distributinos, using the ~ symbol
#Does education differ by province?
## Look at education BY (~) province

boxplot(educ.years ~ province, data = afghan, 
        main = "Education by province", ylab = "Years of education")

tapply(afghan$violent.exp.taliban, afghan$province, mean, na.rm = TRUE) ## This function lets you apply a function (mean) to your main variable of interest (harm by Taliban) by your second variable (province)
tapply(afghan$violent.exp.ISAF, afghan$province, mean, na.rm = TRUE)

## Saving or Printing a Graph

## Use function in graph window -> EXPORT -> SAVE AS IMAGE or PDF




