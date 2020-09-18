## 2.1 R Basics: Intro to R and RStudio
rm(list=ls())
setwd("C:/Users/lynn/OneDrive/Documents/ADULT/NCSU/ST558, Data Science for Statisticians/")
# Scatterplot of default dataset cars
plot(cars)

# Get structure of object's attributes
# cars, iris are dataframes
str(cars)
str(iris)

# plot(), print() have different results depending on object they're called on
plot(iris)
print(iris)

# Store data/info/function/etc in R objects
avg <- (5+7+6)/3
avg

words="Hello there!"
words

## 2.2 R Basics: Common Data Objects
# Vector: 1-D, ordered
x <- c(1, 3, 10, -20, sqrt(2))
y <- c("cat", "dog", "bird", "floor")
x
y

# Can generate sequence or random number, which output vectors
1:20/20
seq(from=1, to=10, by=2)
runif(4, min=0, max=1)

# help() for function documentation
help(seq)
help(runif)

# Check type of object
x <- rep(0.2, times=6)
y <- c(1, 3, 4, -1, 5, 6)
is.numeric(x)
is.numeric(y)
length(x)
length(y)

# Matrix: 2-D collection of vectors of same type and length
matrix(c(x,y), ncol=2)
matrix(c(x,y), nrow=2, byrow=TRUE)

# Can also have char matrix
x <- c("Hi", "There", "!"); y <- c("a", "b", "c"); z <- c("One", "Two", "Three")
is.character(x)
matrix(c(x, y, z), nrow=3)

# Data Frame: 2-D collection of vectors of same length
x <- c("a", "b", "c", "d", "e", "f")
y <- c(1, 3, 4, -1, 5, 6)
z <- 10:15
data.frame(x, y, z)

# list: '1-D' because only 1 ordering, but very flexible to contain different types of objects
list("Hi", 1:3, rnorm(2), c("!", "?"))
# List of 4 elements, where each element can be a value/vector/matrix/dataframe/list

## 2.3 R Basics: Accessing Data Objects
str(iris)
# iris is dataframe of n=150 obs/rows and p=5 vars/cols
attributes(iris)
# Returns named list describing characteristics of iris

# Atomic Vector: Access ith element of using single square brackets [i]
letters   # build-in vector
letters[10]
letters[1:4]
letters[c(5, 10, 15, 20, 25)]
x <- c(1, 2, 5); letters[x]

# Matrices: Access element at ith row, jth col using single square brackets and comma [i, j]
# Returns as simplified as it can (vector unless matrix required b/c multiple rows/cols)
mat <- matrix(c(1:4, 20:17), ncol=2)
mat
mat[2, 2]
mat[, 1]    # 1st col
mat[2, ]    # 2nd row
mat[2:4, 1]
mat[c(2, 4), ]

# Can also index with rownames, colnames
mat <- matrix(c(1:4, 20:17), ncol=2, dimnames=list(NULL, c("First", "Second")))
mat[, "First"]

# Structure is int array (must all be same type, length)
str(mat)
# Attributes are named list of dim, dimnames[[1]] and [[2]] for rows/cols
attributes(mat)

# Data Frame: Access element like matrix [i, j] or by names
iris[1:4, 2:4]
iris[1, ]
iris[, c("Sepal.Length", "Species")]
iris$Sepal.Length

# Lists: Access elements using double square brackets [[i]]
x <- list("HI", c(10:20), 1)
x
x[[1]]
x[[3]]
x[[2]]        # Returns vector c(10:20)
x[[2]][4:5]   # Can index into vector in usual way for vectors

# If list is named, then can use $ to access just like df. So, df are actually named lists!
str(x)
# NOTE: Only $, no $ with name yet
x <- list(First="HI", Second=c(10:20), Third=1)
str(x)
x$Second

# Can modify attributes
str(attributes(iris))
# Attributes is named list of 3 elements
attributes(iris)$names
attributes(iris)$names[1] <- "Sepal_Length"
attributes(iris)$names
# Shortcut: Use helper functions to access attributes
names(iris)
names(iris)[2] <- "Sepal_Width"
names(iris)

# Partial matching by R (not just auto-complete of RStudio IDE)
iris$Sp
iris[["Petal.Len", exact=FALSE]]