## Making graphs and figures

setwd("/Users/jpan/Documents/GradSchool/Stanford/Teaching/Methods/w2015-2016/lecture")

# Plotting inequality
gini <- read.csv("USGini.csv")
par()

pdf("myginiplot.pdf")
par(mar = c(5.1, 4.1, 4.1, 2.1))
plot(y = gini$gini,x = gini$year, pch=19, 
     xlab="Year", 
     cex.axis=2, cex.lab=2, cex=2, cex.main = 2,
     col = "hotpink2", ylab="Gini",
     main = "Income Inequality")
#text(1960, .42, "HELLO!", cex=4)
dev.off()


# Plotting facial appearance and election outcomes
face <- read.csv("face.csv")

# vote share for democrats
face$d.share <- face$d.votes / (face$d.votes + face$r.votes)

# vote share for republicans
face$r.share <- face$r.votes / (face$d.votes + face$r.votes)

# difference in vote share
face$diff.share <- face$d.share - face$r.share

face$w.party <- as.character(face$w.party)

plot(x= face$d.comp, y=face$diff.share,
     xlab = "Competence Score for Democrats",
     ylab = "Democratic Margin in Vote Share",
     main = "Facial Competence and Vote Share Graph",
     cex = 2, cex.lab = 2, cex.axis = 2, cex.main = 2,
     pch = face$w.party, 
     col= ifelse(face$w.party == "R", "red", "blue"),
     xlim = c(0,1), ylim=c(-1,1))

