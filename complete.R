## Coursera - R programming: Week 2, Assignment 2: "complete"

# DISCLAIMER: Completed with help from Clever Programmer: https://www.youtube.com/watch?v=7J2wpxyjfn8

library("dplyr")

setwd("C:/Users/Gyorgy Szelezsan/Documents/R codes/Coursera/Data_Scientist/R_prog/week2/specdata/")

?list.files
?read.csv
?numeric
?data.frame


complete <- function(directory, id = 1:332) {
      ListOfFiles <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
      # get list of files full address in one place
      nobs <- numeric()
      # coerce the values in the csv to be parsed as numbers instead characters
      
      for (i in id){
            # for loop: for each iteration of id, read the data from csv and store the pollutant specific data in values
            data <- read.csv(ListOfFiles[i])
            nobs <- c(nobs, sum(complete.cases(data)))
      }
      
      data.frame(id, nobs)
}

complete(getwd())

## ------------------------------------ end of assignment 2 ------------------------------------------