## Coursera - R programming: Week 2, Assignment 3: "corr"

install.packages("dplyr")
library("dplyr")

setwd("C:/Users/Gyorgy Szelezsan/Documents/R codes/Coursera/Data_Scientist/R_prog/week2/")
corr <- function(directory, threshold = 0) {
      lof <- list.files(path = directory, pattern = ".csv", full.names = TRUE) # get list of files full address in one place
      nobs <- numeric() # as in "complete.R", number of full observations
      corr_data <- numeric() # initialize
      id <- numeric() # initialize
      df1_sub <- numeric() # initialize
      results <- numeric() # initialize
      id <- 1:length(lof) # since we don't know how many files we have, we'll test all of them
      
      for (i in id) {
            # for each iteration of "id", read the data from csv and store in "nobs" and "corr_data", then create dataframe of it
            d1 <- read.csv(lof[i])
            nobs <- c(nobs, sum(complete.cases(d1)))
            corr_data <- c(corr_data, cor(d1$sulfate, d1$nitrate, use = "pairwise.complete.obs"))
      }
      df1 <- data.frame(id, nobs, corr_data) # since we have fixed amount of files, no need to use tapply
      df1_sub <- if (threshold > max(df1$nobs)) { 
            vector(mode="numeric", length=0) #If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. 
      } else {
            subset(df1, df1$nobs > threshold)
      }
      if (threshold > max(df1$nobs)) {
            df1_sub #If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. 
      } else {
            df1_sub$corr_data #  The function should return a vector of correlations for the monitors that meet the threshold requirement.
      }
      }

cr <- corr("specdata", threshold = 150)
head(cr)
summary(cr)

cr <- corr("specdata", threshold = 400)
head(cr)
summary(cr)

cr <- corr("specdata", threshold = 5000)
head(cr)
summary(cr)
length(cr)

cr <- corr("specdata")
summary(cr)
length(cr)
