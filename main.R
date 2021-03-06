##
# kNN function for for images
# Requies loadimage.r to be sourced
# Ex :
# source("/Users/lennartolsen/dev/machine-learning/excersise1/trunk/Basefolder/loadImage.R")
##
source("doknn.r")
source("cross_validation.r")
source("smooth_operator.r")
source("load_em_all.r")

dataset <- loadEmAll(c(12,10), c(1,2,3,4,5), 100, "2017/")
dataset <- data.frame(dataset)
set.seed(42)
dataset_shuffle <- dataset[sample(nrow(dataset)),]

##Create a split set that generates a set of 1's and 0's, to further split the dataset
#split_set <- sample(2, nrow(dataset_shuffle), replace=TRUE, prob=c(0.5, 0.5))
minTest = nrow(dataset)*0.90
maxTest = nrow(dataset)
dataset_train <- dataset_shuffle[1:minTest - 1,2:ncol(dataset)]
dataset_test <- dataset_shuffle[minTest:maxTest,2:ncol(dataset)]
dataset_train_labels <- dataset_shuffle[1:minTest - 1,1]
dataset_test_labels <- dataset_shuffle[minTest:maxTest,1]

range <- 1:10
doKnn(dataset_train, dataset_test, dataset_train_labels, dataset_test_labels, range)

#range <- 1:10
#folds <- 1:10

#cross_labels <- dataset_shuffle[1:nrow(dataset),1]
#cross_dataset <- dataset_shuffle[1:nrow(dataset),2:ncol(dataset)]

#doCross(cross_dataset,cross_labels, range, folds)
