## Coursera - R programming: Week 2, Assignment 1: "pollutantmean"

install.packages("dplyr")
library("dplyr")


# DISCLAIMER: Completed with help from Clever Programmer: https://www.youtube.com/watch?v=ABW179vwsXY

setwd("C:/Users/Gyorgy Szelezsan/Documents/R codes/Coursera/Data_Scientist/R_prog/week2/specdata/")

?list.files
?read.csv
?numeric


pollutantmean <- function(directory, pollutant, id = 1:332) {
      ListOfFiles <- list.files(path = directory, pattern = ".csv", full.names = TRUE) 
      # get list of files full address in one place
      values <- numeric()
      # coerce the values in the csv to be parsed as numbers instead characters
      for (i in id){
            # for loop: for each iteration of id, read the data from csv and store the pollutant specific data in values
            data <- read.csv(ListOfFiles[i])
            values <- c(values,data[[pollutant]])
      }
      mean(values, na.rm = TRUE)
      # before averaging the values, remove NA values
}

pollutantmean(getwd(), "sulfate")


## ------------------------------------ end of assignment 1 ------------------------------------------