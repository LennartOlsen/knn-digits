##
# kNN function for for images
# Requies loadimage.r to be sourced
# Ex :
# source("/Users/lennartolsen/dev/machine-learning/excersise1/trunk/Basefolder/loadImage.R")
##
source("doknn.R")
dataset <- loadSinglePersonsData(300, "group12", 1, "2017/");
dataset <- data.frame(dataset)
set.seed(42)
dataset_shuffle <- dataset[sample(nrow(dataset)),]

##Create a split set that generates a set of 1's and 0's, to further split the dataset
#split_set <- sample(2, nrow(dataset_shuffle), replace=TRUE, prob=c(0.5, 0.5))
dataset_train <- dataset_shuffle[1:2000,2:ncol(dataset)]
dataset_test <- dataset_shuffle[2001:4000,2:ncol(dataset)]
dataset_train_labels <- dataset_shuffle[1:2000,1]
dataset_test_labels <- dataset_shuffle[2001:4000,1]

range <- 1:100

doKnn(dataset_train, dataset_test, dataset_train_labels, dataset_test_labels, range)