##
# kNN function for for images
# Requies loadimage.r to be sourced
# Ex :
# source("/Users/lennartolsen/dev/machine-learning/excersise1/trunk/Basefolder/loadImage.R")
##
require("ggplot2")
dataset <- loadSinglePersonsData(300, "group12", 1, "2017/");
dataset <- data.frame(dataset)
set.seed(42)
dataset_shuffle <- dataset[sample(nrow(dataset)),]

##Create a split set that generates a set of 1's and 0's, to further split the dataset
#split_set <- sample(2, nrow(dataset_shuffle), replace=TRUE, prob=c(0.5, 0.5))

dataset_train <- dataset_shuffle[1:2000,2:100]
dataset_test <- dataset_shuffle[2001:4000,2:100]
dataset_train_labels <- dataset_shuffle[1:2000,1]
dataset_test_labels <- dataset_shuffle[2001:4000,1]

##TEST WITH K = 3
dataset_pred <- knn(train = dataset_train, test = dataset_test, cl=dataset_train_labels, k=3)
##CrossTable(x= dataset_test_labels, y = dataset_pred,prop.chisq=FALSE)
confidence <- table(dataset_test_labels, dataset_pred)
accuracy <- sum(diag(confidence)) / sum(confidence)


## TEST WITH MANY K's
range <- 1:100
accs <- rep(0, length(range))
speeds <- rep(0, length(range))

for (k in range) {
    startTime <- Sys.time();
    #make predictions using knn: pred
    dataset_pred <- knn(train = dataset_train, test = dataset_test, cl=dataset_train_labels, k=k)

    #construct the confusion matrix: conf
    confidence <- table(dataset_test_labels, dataset_pred)
   
    #calculate the accuracy and store it in accs[k]
    accs[k] <- sum(diag(confidence)) / sum(confidence)
    
    endTime <- Sys.time()
    speeds[k] <- endTime - startTime
    print(k)
}
 
# Plot the accuracies. Title of x-axis is "k".
qplot(seq_along(accs), accs)+geom_point() + geom_smooth(method="lm",formula = y ~ splines::bs(x,3), se=FALSE)
qplot(seq_along(speeds), speeds)+geom_point() + geom_smooth(method="lm",formula = y ~ splines::bs(x,3), se=FALSE)
 
# Calculate the best k
which.max(accs)

