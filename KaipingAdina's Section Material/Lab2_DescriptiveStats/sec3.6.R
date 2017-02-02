#### Section 3.6: Summarizing Bivariate Relationships
## Relationship between two variables - very relevant to your project.

### Section 3.6.1: Scatter Plot

congress <- read.csv("congress.csv")


#DW-NOMINATE scores are measures of liberal/conservativeness (more negative is more liberal)
##dwnom1 is economic 
##dwnom2 is racial

## subset the data by party
## How do you know the names of the party categories?
colnames(congress) ## Lets you know the names of the columns that you can subset by
levels(congress$party) ## lets you know what factors are there that you can subset with
rep <- subset(congress, subset = (party == "Republican")) ## this creates a subset of only Republicans
dem <- congress[congress$party == "Democrat", ] # another way to subset

## 80th and 112th congress
rep80 <- subset(rep, subset = (congress == 80))
dem80 <- subset(dem, subset = (congress == 80))
rep112 <- subset(rep, subset = (congress == 112))
dem112 <- subset(dem, subset = (congress == 112))


## scatterplot for the 80th Congress 
plot(dem80$dwnom1, dem80$dwnom2, pch = 16, col = "blue", ##pch represents different plotting symbols
     xlim = c(-1.5, 1.5), ylim = c(-1.5, 1.5), 
     xlab = "Economic liberalism/conservatism", ylab = "Racial liberalism/conservatism",
     main = "80th Congress") # democrats
points(rep80$dwnom1, rep80$dwnom2, pch = 17, col = "red") # add on points to graph for republicans
text(-0.75, 1, "Democrats")
text(1, -1, "Republicans")

## scatterplot for the 112th Congress
plot(dem112$dwnom1, dem112$dwnom2, pch = 16, col = "blue", 
     xlim = lim, ylim = lim, xlab = xlab, ylab = ylab,
     main = "112th Congress")
points(rep112$dwnom1, rep112$dwnom2, pch = 17, col = "red")

## party median for each congress
dem.median <- tapply(dem$dwnom1, dem$congress, median)
rep.median <- tapply(rep$dwnom1, rep$congress, median)

par(cex = 1.5)
## Democrats
plot(names(dem.median), dem.median, col = "blue", type = "l",
     xlim = c(80, 115), ylim = c(-1, 1), xlab = "Congress",
     ylab = "DW-NOMINATE score (1st dimension)")
## add Republicans
lines(names(rep.median), rep.median, col = "red")
text(110, -0.6, "Democratic\n Party")
text(110, 0.85, "Republican\n Party")

### Section 3.6.2: Correlation

## Gini coefficient data
## I think the example in the book is overly complicated. I recommend we use something way simpler.  
## Like lets just look at the correlation of the dw nominate score?

### Gini coefficient data
gini <- read.csv("USGini.csv")

## time-series plot for Gini coefficient, Gini coefficient simply measures wealth distribution (1 equally distributed)
plot(gini$year, gini$gini, ylim = c(0.35, 0.45), xlab = "Year", 
     ylab = "Gini coefficient", main = "Income inequality")

# is there a correlation between gini and year?
cor(gini$gini, gini$year)

## looks like 1970 really began the increase in gini - is there a different correlation coefficient if we start in 1970?
cor(gini$gini[gini$year>=1970], gini$year[gini$year>=1970])

### Section 3.6.3: Quantile-Quantile Plot


qqplot(dem112$dwnom2, rep112$dwnom2, xlab = "Democrats", 
       ylab = "Republicans", xlim = c(-1.5, 1.5), ylim = c(-1.5, 1.5), 
       main = "Racial liberalism/conservatism dimension") 
abline(0, 1) # 45 degree line

