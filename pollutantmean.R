## Coursera - R programming: Week 2, Assignment 1: "pollutantmean"

library("dplyr")


# DISCLAIMER: Completed with help from Clever Programmer: https://www.youtube.com/watch?v=ABW179vwsXY

setwd("C:/Users/Gyorgy Szelezsan/Documents/R codes/Coursera/Data_Scientist/R_prog/week2/")

?list.files
?read.csv
?numeric
directory = "specdata"

pollutantmean <- function(directory, pollutant, id = 1:332) {
      lof <- list.files(path = directory, pattern = ".csv", full.names = TRUE) 
      # get list of files full address in one place
      values <- numeric()
      # coerce the values in the csv to be parsed as numbers instead characters
   for (i in id) {
         data <- read.csv(lof[i])
         values <- c(values, data[[pollutant]])
   }
      mean(values, na.rm = TRUE)
      # before averaging the values, remove NA values
}

pollutantmean("specdata", "sulfate")


## ------------------------------------ end of assignment 1 ------------------------------------------
