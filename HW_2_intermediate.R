#' ---
#' author: "Hannah Houston"
#' title: "HW2: R Intermediate"
#' date: "19 Jan 2023"
#' output: html_document
#' ---
#' 

#'Examine the following for loop, and then complete the exercises
#'---
#'

data(iris) #calls in the data set
head(iris)

#first create species list
sp_ids <- unique(iris$Species) #removes duplicate elements/rows, left with only setosa, versicolor, and virginica

#output creates a table that will be filled in later (uses 0's, in the future use NA)
output <- matrix(0, nrow=length(sp_ids), ncol=ncol(iris)-1) #making a matrix with 3 rows (same as num of speceis) and 4 columns (5 columns in dataset iris, subtract one from that)
rownames(output) <- sp_ids #species id's will be the rownames 
colnames(output) <- names(iris[ , -ncol(iris)]) #column names will be the same as in iris data set just minus the species column

#loop through the 3 speceis
for(i in seq_along(sp_ids)) { 
  iris_sp <- subset(iris, subset=Species == sp_ids[i], select=-Species) #subsets data to specific species, excludes the "species" column
  #
  for(j in 1:(ncol(iris_sp))) { #loop from 1 to the number of columns (traits) of iris species 
    x <- 0
    y <- 0 #defines y and x as 0 to be filled with data later 
    if (nrow(iris_sp) > 0) { #if the row of iris species is greater than 0
      for(k in 1:nrow(iris_sp)) { #for each element in iris species loop from 1 to number of rows
        x <- x + iris_sp[k, j] #x becomes the sum of each column (traits), x resets to 0 for each trait
        y <- y + 1 #number of rows
      }
      output[i, j] <- x / y #output is the average of each trait for each species 
    }
  }
}
output

#' **Iris Loops**
#' ---
#' 

#'1. Describe the values stored in the object `output`. In other words what did the loops create?
#'---
#'
#The loops created a table showing the mean for sepal length, sepal width, petal length, and petal width for each iris species (setosa, versicolor, and virginica). 

#'2. Describe using pseudo-code how `output` was calculated.
#'---
#' 
#Call in data and remove duplicate elements/rows, left with only setosa, versicolor, and virginica
#output creates a table that will be filled in later (uses 0's, in the future use NA)
#making a matrix with 3 rows (same as num of species) and 4 columns (5 columns in dataset iris, subtract one from that)
#species id's will be the rownames 
#column names will be the same as in iris data set just minus the species column

#loop from 1 to length of species identities 
#subsets data to specific species, excludes the "species" column
#loop from 1 to the number of columns (traits) of iris species 
#defines y and x as 0 to be filled with data later 
    #if the row of iris species is greater than 0
        #for each element in iris species loop from 1 to number of rows
        #x becomes the sum of each column (traits), x resets to 0 for each new trait
        #y becomes the number of rows + 1 
     #output is the average of each trait for each species 


#'3. The variables in the loop were named so as to be vague. How can the objects`output`, `x`, and `y` be renamed such that it is clearer what is occurring in the loop.
#'---
#'
#output should be renamed trait_means
#x should be renamed trait_sums
#y should be renamed n_samples

trait_means <- matrix(0, nrow=length(sp_ids), ncol=ncol(iris)-1) #making a matrix with 3 rows (same as num of speceis) and 4 columns (5 columns in dataset iris, subtract one from that)
rownames(trait_means) <- sp_ids #species id's will be the rownames 
colnames(trait_means) <- names(iris[ , -ncol(iris)]) #column names will be the same as in iris data set just minus the species column
#for(i in seq_along(sp_ids)) { 
#  iris_sp <- subset(iris, subset=Species == sp_ids[i], select=-Species) 
#  for(j in 1:(ncol(iris_sp))) { 
#    trait_sums <- 0
#    n_samples <- 0  
#    if (nrow(iris_sp) > 0) { 
#      for(k in 1:nrow(iris_sp)) { 
#        trait_sums <- trait_sums + iris_sp[k, j] 
#        n_samples <- n_samples + 1
#      }
#      trait_means[i, j] <- trait_sums / n_samples 
#    }
#  }
#}
#trait_means


#'4. It is possible to accomplish the same task using fewer lines of code? Please suggest one other way to calculate `output` that decreases the number of loops by 1.
#'---
#'

trait_means <- matrix(0, nrow=length(sp_ids), ncol=ncol(iris)-1) #making a matrix with 3 rows (same as num of speceis) and 4 columns (5 columns in dataset iris, subtract one from that)
rownames(trait_means) <- sp_ids #species id's will be the rownames 
colnames(trait_means) <- names(iris[ , -ncol(iris)]) #column names will be the same as in iris data set just minus the species column

for(i in seq_along(sp_ids)) { 
  iris_sp <- subset(iris, subset=Species == sp_ids[i], select=-Species) 
  for(j in 1:(ncol(iris_sp))) { 
      trait_means[i, j] <- mean(iris_sp[ ,j])
  }
}
trait_means #still define the matrix so you have something to capture the output in


#'**Sum of a sequence**
#'---
#'

#5. You have a vector `x` with the numbers 1:10. Write a for loop that will produce a vector `y` that contains the sum of `x` up to that index of `x`. 
#'So for example the elements of `x` are 1, 2, 3, and so on and the elements of `y`would be 1, 3, 6, and so on.
#'---
#'

x <- (1:10)
y <- NULL
for (i in 1:length(x)) {
    y[i] <- sum(x[1]:x[i])
}
 
y

#'6. Modify your for loop so that if the sum is greater than 10 the value of `y` is set to NA
#'---
#'

x <- (1:10)
y <- NULL
for (i in 1:length(x)) {
  y[i] <- sum(x[1]:x[i], na.rm = TRUE)
  if (y[i] > 10) {
    y[i] <- NA
  }
}
y



#'7. Place your for loop into a function that accepts as its argument any vector of arbitrary length and it will return `y`. 
#'---
#'

calc_cumsum <- function(x) { 
  y <- NULL
  for (i in 1:length(x)) {
    y[i] <- sum(x[1]:x[i], na.rm = TRUE)
    if ((y[i] > 10)) {
      y[i] <- NA
    }
  }
  y
}

calc_cumsum(1:20)
calc_cumsum(c(1, 3, 4, 5))

#' **(Optional)Fibonacci numbers and Golden ratio**
#' ---
#' 

#'8. Fibonacci numbers are a sequence in which a given number is the sum of the preceding two numbers. So starting at 0 and 1 the sequence would be
#'0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, ...

#Write and apply a simple R function that can accomplish this task with a for loop. 

n <- 15 #number of terms it will print
fib <- numeric(n)
fib[1] <- 0
fib[2] <- 1

for (i in 3:n)
  {
    fib[i] <- fib[i-1]+fib[i-2] 
  }
print(fib)



#Then write a function that computes the ratio of each sequential pair of 
#Fibonacci numbers. Do they asympoticly approch the golden ratio (1 + sqrt(5)) / 2) ? 
  
  
  
  
  
  
  