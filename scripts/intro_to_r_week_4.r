############################################################################

# restart the R session (Menu 'Session' - Restart R)

# show installed packages

library()

# another way

installed.packages()

# only show where installed, version, and the 'priority'

installed.packages()[,c("LibPath", "Version", "Priority")]

# the 'base' and 'recommended' packages (see 'Priority' column) are installed
# with R automatically; it is also possible to install an updated version of
# recommended packages (if there is an update)

# in RStudio, there is also the 'Packages' pane (bottom-right)

# list loaded packages (have to explicitly use print())

print(.packages())

############################################################################

# number of packages currently available on CRAN

nrow(available.packages())

# growth of number of CRAN data packages over time

dat <- read.table(header=TRUE, colClasses=c("character", "integer", "Date"), text =
"vers  count  date
1.3 110 2001-06-21
1.4 129 2001-12-17
1.5 161 2002-06-12
1.7 219 2003-05-25
1.8 273 2003-11-16
1.9 357 2004-06-05
2.0 406 2004-10-12
2.1 548 2005-06-18
2.2 647 2005-12-16
2.3 739 2006-05-31
2.4 911 2006-12-12
2.5 1000 2007-04-12
2.6 1300 2007-11-16
2.7 1495 2008-03-18
2.8 1614 2008-10-20
2.9 1907 2009-04-17
2.10 2008 2009-10-26
2.13 3000 2011-05-12
2.15 3976 2012-09-21
3.0.2 5000 2013-11-08
3.1 5745 2014-08-22
3.2 6706 2015-06-07
3.2.2 7547 2015-12-07
3.2.3 7969 2016-03-01
3.3.1 9004 2016-08-22
3.3.2 9961 2017-01-28
3.4.3 11991 2017-12-15
3.6.3 15537 2020-04-01
4.0.2 16261 2020-09-15
4.1.2 18544 2021-12-06
4.1.3 18977 2022-03-14")

par(mar=c(6,5.5,4,2))
par(mgp=c(4,1,0))
plot(dat$date, dat$count, pch=19, cex=1.2, xlab="", ylab="Number of CRAN Packages", xaxt="n", yaxt="n")
axis(side=1, at=dat$date, label=dat$date, las=2, cex.axis=.7)
axis(side=2, at=seq(0,19000,1000), las=2)
axis(side=3, at=dat$date, label=dat$vers, las=2, cex.axis=.7)
grid(nx=10, ny=10)

res <- loess(count ~ as.numeric(date), data=dat)
pred <- predict(res)
lines(dat$date, pred, lwd=2, col="gray70")

points(dat$date, dat$count, pch=19, cex=1.2)

############################################################################

# all packages available on CRAN:
# https://cran.r-project.org/web/packages/available_packages_by_name.html

# CRAN task views: https://cran.r-project.org/web/views

# install the 'lme4' package (from CRAN)

install.packages("lme4")

# load the 'lme4' package

library(lme4)

# terminology:
# - package = book
# - library = place where you store books
# (don't say you are using the 'lme4 library' for your analysis!)

# don't run the following two commands right now, because this could take a
# while to complete in case you already have many packages installed and many
# of them can be updated

# updating packages

update.packages()

# updating packages without getting prompted

update.packages(ask=FALSE)

############################################################################

# search among installed packages (title and description)

help.search("factor analysis")

# search all CRAN packages

RSiteSearch("structural equation")

############################################################################

# install (if necessary) and load the 'sos' package

if (!suppressWarnings(require(sos))) install.packages("sos")

library(sos)

# search all packages on CRAN for a term

findFn("structural equation")

############################################################################

# install (if necessary) and load the 'packagefinder' package
# https://www.zuckarelli.de/packagefinder/tutorial.html

if (!suppressWarnings(require(packagefinder))) install.packages("packagefinder")

library(packagefinder)

findPackage("structural equation", limit.results = 100)

############################################################################

# install (if necessary) and load the 'CRANsearcher' package

if (!suppressWarnings(require(CRANsearcher))) install.packages("CRANsearcher")

library(CRANsearcher)

CRANsearcher()

############################################################################

# install (if necessary) and load the 'pkgsearch' package
# https://r-hub.github.io/pkgsearch/

if (!suppressWarnings(require(pkgsearch))) install.packages("pkgsearch")

library(pkgsearch)

pkg_search("structural equation")

# there is also a nicer interface; need to install some packages first

if (!suppressWarnings(require(shinyWidgets))) install.packages("shinyWidgets")
if (!suppressWarnings(require(whoami))) install.packages("whoami")

pkg_search_addin("structural equation")

############################################################################

# also (potentially) useful:
# - https://rdrr.io
# - https://www.r-pkg.org
# - https://www.rdocumentation.org
# - https://rseek.org

############################################################################

# example: https://cran.r-project.org/package=lme4

# potential indicators of "good" packages:
# - written by known experts in the field
# - package has been around for some time
# - package has been updated
# - listed under one or multiple task views
# - has a 'vignette' or other supporting documentation
# - paper/book about package has been published
# - help files are comprehensive and free of errors
# - has been cited in papers
# - ...

# Journal of Statistical Software: https://www.jstatsoft.org

# citing R and packages

citation()
citation("lme4")

############################################################################

# where to get help:
# - Google! (or DuckDuckGo or your favorite search engine)
# - https://www.r-project.org/help.html
# - mailing lists: https://www.r-project.org/mail.html
# - read posting guide first: https://www.r-project.org/posting-guide.html
#   - do your homework before posting
#   - provide reproducible (and simple) code that illustrates the problem
# - StackExchange: https://stackexchange.com
#   - https://stackoverflow.com
#   - https://stats.stackexchange.com
# - https://community.rstudio.com (for questions related to RStudio and
#   packages that have been written by RStudio staff, esp. tidyverse stuff)

############################################################################

# a reproducible example is a small self-contained example of the problem you
# are running into that someone can copy-paste directly into R to recreate the
# problem; then it is *much* easier for someone to come up with a solution

# such an example will typically contain data; do not send an attachment or a
# screenshot of your data (or something like that); it would take extra effort
# (writing some R code to import the data, manually typing some data into R)
# to recreate the dataset in R

# you need to provide the data in a way so that the dataset can be directly
# recreated in R; this is where the dput() function comes into play

# say the 'dat' object from above is my dataset I have in R; then you can
# create R code that will recreate the dataset with:

dput(dat)

# so you can take that output and paste it into your email/post like this

dat <- structure(...)

# now anybody can recreate the exact same dataset with this code; so your
# email/post might then look like this

###### From <you> to the mailing list / forum / message board

# Hi all,
#
# I am creating a scatterplot of a date variable on the x-axis versus a count
# variable on the y-axis. Here are my data and the plot so far.

dat <- structure(list(vers = c("1.3", "1.4", "1.5", "1.7", "1.8", "1.9",
"2.0", "2.1", "2.2", "2.3", "2.4", "2.5", "2.6", "2.7", "2.8", "2.9", "2.10",
"2.13", "2.15", "3.0.2", "3.1", "3.2", "3.2.2", "3.2.3", "3.3.1", "3.3.2",
"3.4.3", "3.6.3", "4.0.2", "4.1.2", "4.1.3"), count = c(110L, 129L, 161L,
219L, 273L, 357L, 406L, 548L, 647L, 739L, 911L, 1000L, 1300L, 1495L, 1614L,
1907L, 2008L, 3000L, 3976L, 5000L, 5745L, 6706L, 7547L, 7969L, 9004L, 9961L,
11991L, 15537L, 16261L, 18544L, 18977L), date = structure(c(11494, 11673,
11850, 12197, 12372, 12574, 12703, 12952, 13133, 13299, 13494, 13615, 13833,
13956, 14172, 14351, 14543, 15106, 15604, 16017, 16304, 16593, 16776, 16861,
17035, 17194, 17515, 18353, 18520, 18967, 19065), class = "Date")), class =
"data.frame", row.names = c(NA, -31L))

plot(dat$date, dat$count, xlab="", ylab="Number of CRAN Packages")

# I am trying to change the x-axis limits so that they go from 2000 to 2025. I
# tried using xlim=c(2000,2025) but this is obviously not correct.

plot(dat$date, dat$count, xlab="", ylab="Number of CRAN Packages", xlim=c(2000,2025))

# Any help/suggestions would be greatly appreciated.

###### From <somebody> replying

# Hi <you>,
#
# Wow, this is such a well-formulated question with a clear reproducible
# example that I will gladly take a bit of time out of my busy schedule to
# help you with this.
#
# The solution is to also use a proper date vector for the x-axis limits. You
# can create such a vector with as.Date(). Try this:

plot(dat$date, dat$count, xlab="", ylab="Number of CRAN Packages",
     xlim=as.Date(c("2000-01-01","2025-01-01")))

# Hope this helps!

###### ... end of story.

# in case the dataset is very large, just post a small part of it that is
# sufficient to create a reproducible example; for example:

dput(dat[1:10,])

############################################################################

# not all packages are on CRAN

# for example Bioconductor: https://www.bioconductor.org/

############################################################################

# a note about 'masking': different packages may contain functions that have
# the same name; for example:

library(psych)
library(lavaan)

# - note that it says that function 'cor2cov' has been masked
# - what has happened is that both packages have a function called 'cor2cov'
# - so when you now use the cor2cov function, the one from the lavaan package
#   will be used (i.e., always the one from the package loaded last)
# - but what if you want to use the 'cor2cov' function from the psych package?
# - then you can use psych::cor2cov() to explicitly tell R to use the cor2cov
#   function from the psych package
# - the more packages you load, the more likely it is that two packages will
#   contain functions with the same name and hence that masking will occur
# - to avoid the headaches that this can create, only load packages at the
#   beginning of your script that you really need

############################################################################

# data: growth of orange trees

Orange

help(Orange)

# copy to 'dat' (less typing)

dat <- Orange

# mean circumference per tree

mean(dat$circumference[dat$Tree==1])
mean(dat$circumference[dat$Tree==2])
mean(dat$circumference[dat$Tree==3])
mean(dat$circumference[dat$Tree==4])
mean(dat$circumference[dat$Tree==5])

# much quicker

by(dat$circumference, dat$Tree, mean)

# for() loops (note: have to print explicitly within loops)

for (i in 1:5) {
   print(i)
}

# can use 'indexing variable' i within the loop now

for (i in 1:5) {
   print(mean(dat$circumference[dat$Tree==i]))
}

# saving results computed within the loop

for (i in 1:5) {
   res <- mean(dat$circumference[dat$Tree==i])
}

res # only last value

# set up a vector where we can store the results

res <- rep(NA, 5)
res

for (i in 1:5) {
   res[i] <- mean(dat$circumference[dat$Tree==i])
}

res

############################################################################

# plotting with loops

plot(dat$age, dat$circumference, pch=19, xlab="Days", ylab="Trunk Circumference (mm)")
lines(dat$age, dat$circumference)

# not quite right, so how we can do this in the correct way?

plot(dat$age, dat$circumference, pch=19, xlab="Days", ylab="Trunk Circumference (mm)")

lines(dat$age[dat$Tree==1], dat$circumference[dat$Tree==1])
lines(dat$age[dat$Tree==2], dat$circumference[dat$Tree==2])
lines(dat$age[dat$Tree==3], dat$circumference[dat$Tree==3])
lines(dat$age[dat$Tree==4], dat$circumference[dat$Tree==4])
lines(dat$age[dat$Tree==5], dat$circumference[dat$Tree==5])

# now use a loop

plot(dat$age, dat$circumference, pch=19, xlab="Days", ylab="Trunk Circumference (mm)")

for (i in 1:5) {
   lines(dat$age[dat$Tree==i], dat$circumference[dat$Tree==i])
}

# add a bit of color

plot(dat$age, dat$circumference, pch=19, xlab="Days", ylab="Trunk Circumference (mm)")

cols <- c("blue", "red", "green", "darkgray", "violet")

for (i in 1:5) {
   lines(dat$age[dat$Tree==i], dat$circumference[dat$Tree==i], col=cols[i], lwd=2)
}

points(dat$age, dat$circumference, pch=19)

############################################################################

# another example

rm(list=ls())

load("data_survey_edit.rdata")

res <- aov(pss ~ marital, data=dat)
res
summary(res)

# visualize densities of the 8 groups

umarital <- unique(dat$marital)
cols <- rainbow(8, alpha=0.2)

par(mar=c(5,9,4,2))
plot(NA, xlim=c(0, 50), ylim=c(0.8, 8.8), xlab="Perceived Stress Scale Value", ylab="",
     main="Kernel Density Estimates of Stress by Marital Status", yaxt="n", bty="n")
axis(side=2, at=1:8, labels=umarital, las=1, tick=FALSE)

for (i in 1:8) {

   abline(h = i, col="lightgray")
   res <- density(dat$pss[dat$marital == umarital[i]], na.rm = TRUE)
   res$y <- res$y / max(res$y) * 0.8
   lines(res$x, res$y + i)
   polygon(res$x, res$y + i, col=cols[i])
   text(52, i+.15, paste("n =", length(dat$pss[dat$marital == umarital[i]])), pos=2, cex=0.8)

}

# this is sometimes called a 'ridgeline plot'

dev.off()

############################################################################

# digression: can also create such plots with ggplot2 + ggridges

if (!suppressWarnings(require(ggplot2))) install.packages("ggplot2")
if (!suppressWarnings(require(ggridges))) install.packages("ggridges")

library(ggplot2)
library(ggridges)

ggplot(dat, aes(x = pss, y = marital, fill = marital)) +
   geom_density_ridges() +
   theme_ridges() +
   theme(legend.position = "none")

############################################################################

# if-else statements (a very simple example)

x <- 3

if (x > 5) {
   print("x is bigger than 5.")
} else {
   print("x is not bigger than 5.")
}

############################################################################

# using if() to set options in scripts

dat <- Orange

plot.type <- "bw" # options: "bw", "grayscale", "color"

plot(dat$age, dat$circumference, pch=19, xlab="Days", ylab="Trunk Circumference (mm)")

if (plot.type == "bw") {
   cols <- rep("black", 5)
}

if (plot.type == "grayscale") {
   cols <- c("gray20", "gray50", "gray60", "gray80", "gray90")
}

if (plot.type == "color") {
   cols <- c("blue", "red", "green", "darkgray", "violet")
}

for (i in 1:5) {
   lines(dat$age[dat$Tree==i], dat$circumference[dat$Tree==i], col=cols[i], lwd=2)
}

points(dat$age, dat$circumference, pch=19)

############################################################################

# note: if-else statements are really different than ifelse(); ifelse() is a
# vectorized function that takes a logical vector as input and turns this
# vector into a different vector

ifelse(dat$smoke == "yes", "red", "blue")

# if() only takes a single logical as input and then runs an entire block of
# code (if TRUE) and otherwise the else part (if FALSE) if there is one

############################################################################

# generating random numbers from a given distribution

rnorm(n=4, mean=100, sd=10)

rbinom(n=4, size=10, prob=0.5)

runif(n=4, min=1, max=10)

# rt(), rchisq(), rpois(), rgamma(), …

############################################################################

# a simple Monte Carlo simulation

pvals <- rep(NA, 10000)

for (i in 1:10000) {
   x1 <- rnorm(20, mean=0, sd=1)
   x2 <- rnorm(20, mean=0, sd=1)
   res <- t.test(x1, x2)
   pvals[i] <- res$p.value
}

sig.pvals <- ifelse(pvals <= .05, 1, 0)
mean(sig.pvals)

for (i in 1:10000) {
   x1 <- rnorm(20, mean=0, sd=1)
   x2 <- rnorm(20, mean=0.5, sd=1)
   res <- t.test(x1, x2)
   pvals[i] <- res$p.value
}

sig.pvals <- ifelse(pvals <= .05, 1, 0)
mean(sig.pvals)

# use the 'equation approach' to determine the power of the t-test in this scenario

power.t.test(n=20, delta=0.5, sd=1)

############################################################################

# while() function

iters <- 10000
pvals <- rep(NA, iters)

i <- 1

while (i <= iters) {

   x1 <- rchisq(20, df=1)
   x2 <- rchisq(20, df=1)
   res <- t.test(x1, x2)
   pvals[i] <- res$p.value

   i <- i + 1

}

sig.pvals <- ifelse(pvals <= .05, 1, 0)
mean(sig.pvals)

# plot density of a chi-square distributed variable with df=1

curve(dchisq(x, df=1), lwd=3)

############################################################################

load("mirnadata.rdata")

# examine the first 10 rows and the first 5 columns
dat[1:10,1:5]

# Braak staging: https://en.wikipedia.org/wiki/Braak_staging

# stages 0-2 are coded as Braak = 0
# stages 5-6 are coded as Braak = 1
# (and stages 3 and 4 are dropped from this dataset)
# this variable indicates severity of Alzheimer's disease

# the remaining variables are microRNA expression levels

# microRNA: https://en.wikipedia.org/wiki/MicroRNA

# the goal is to examine which microRNA is differentially expressed in the two
# Braak groups

# manually fit 490 simple regression models with 'Braak' as the predictor
# variable and each of the other variables as outcome variables

summary(lm(dat[,2] ~ Braak, data=dat))
summary(lm(dat[,3] ~ Braak, data=dat))
#...
summary(lm(dat[,491] ~ Braak, data=dat))

# but who's got time for that?!?

res <- matrix(data=NA, nrow=490, ncol=4)

for (i in 2:491){
   fit <- lm(dat[,i] ~ Braak, data=dat)
   res[i-1,] <- coef(summary(fit))[2,]
}

colnames(res) <- c("Estimate","SE","t","p-value")
rownames(res) <- colnames(dat)[2:491]

# order the matrix by the p-values

res <- res[order(res[,4]),]

# inspect the first 6 rows

head(res)

############################################################################
