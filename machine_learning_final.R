library(caret)
library(tidyverse)

train1 <- read.csv("pml-training.csv")
train1$classe <- factor(train1$classe)
split1 <- createDataPartition(train1$classe, p=0.8, list = F)

train2 <- train1[split1,]
validate1 <- train1[-split1,]

test1 <- read.csv("pml-testing.csv")

m1 <- train(classe ~., data = train2, method = "rf", na.action = na.pass)
m1.pca <- train(classe ~., data = train2, method = "rf", 
                preProcess = "pca", na.action = na.pass)

m2 <- train(classe ~., data = train2, method = "gbm", na.action = na.pass)
m2.pca <- train(classe ~., data = train2, method = "gbm", 
                preProcess = "pca", na.action = na.pass)

m3 <- train(classe ~., data = train2, method = "lda", na.action = na.pass)
m3.pca <- train(classe ~., data = train2, method = "lda", 
                preProcess = "pca", na.action = na.pass)



