library(dplyr)
library(randomForest)
library(caret)
library(mlbench)
library(e1071)
library(caTools)
#import the dataset and cleaning
leaf <- read.csv("C:\\Users\\apasc\\Desktop\\magistrale\\Introduction to machine learning\\project\\leaf.csv", header = FALSE,
                 col.names = c("Class", "Speciment_n°", "Eccentricity", "Aspect_Ratio",
                               "Elongation", "Solidity", "Stochastic_Convexity",
                               "Isoperimetric_Factor", "Maximal_Indentation_Depth",
                               "Lobedness", "Average_Intensity", "Average_Contrast",
                               "Smoothness", " Third_Moment", "Uniformity",
                               "Entropy"))
set.seed(65283)
leaf <- leaf[,-2]
leaf$Class <- as.factor(leaf$Class)
#setting the test and train datasets, the later used for 
#CV and tuning
sp <- sample.split(leaf$Class, SplitRatio = 0.75)
Train <- subset(leaf, sp == TRUE)
Test <- subset(leaf, sp == FALSE)
write.csv(Train, file = "Train.csv")
write.csv(Test, file = "Test.csv")



