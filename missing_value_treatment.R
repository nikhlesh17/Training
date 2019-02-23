library(Hmisc)
library(rpart)
library(DMwR)
library(mice)

path = 'https://raw.githubusercontent.com/nikhlesh17/Training/master/titanic.csv'
titanic <- read.csv(path)

sapply(titanic,function(x) sum(is.na(x)))
mean(titanic$age)
mean(titanic$age,na.rm = T)

complete.cases(titanic)  # which row have complete data in T/ F
sum(complete.cases(titanic))  # no of rows have which no missing data
sum(!complete.cases(titanic))  # no of rows which have missing data
titanic_cc <- titanic[complete.cases(titanic),]  #rows which are complete
titanic_ncc <- titanic[!complete.cases(titanic),] #rows which have missing values
str(titanic_cc)
str(titanic_ncc)

impute(titanic$age,mean)
impute(titanic$age,median)
impute(titanic$age,100)

library(DMwR)
knnOutput <- knnImputation(titanic[, !names(titanic) %in% "survived"])  
anyNA(knnOutput)


# takes time to run
mice1 <- mice(titanic[, !names(titanic) %in% "survived"], method="rf")  # perform mice imputation, based on random forests.

#This is where we can see the values
mice1$imp$age

# Pick the one which seems fine 
miceOutput <- complete(mice1,1)  # generate the completed data(by default first)
anyNA(miceOutput)