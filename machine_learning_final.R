library(caret)
library(tidyverse)

train1 <- read.csv("pml-training.csv")
test1 <- read.csv("pml-testing.csv")

m1 <- readRDS("MLF_m1.rds")
m2 <- readRDS("MLF_m2.rds")
m3 <- readRDS("MLF_m3.rds")

train1$classe <- factor(train1$classe)

empty.vars <- which(lapply(test1, function(x) sum(is.na(x)))==20)

train.filtered <- train1[,-empty.vars]
train.filtered <- train.filtered[,8:60]

split1 <- createDataPartition(train.filtered$classe, p=0.8, list = F)

train2 <- train.filtered[split1,]
validate1 <- train.filtered[-split1,]


#m1 <- train(classe ~., data = train2, method = "rf", na.action = na.pass)
#m1.pca <- train(classe ~., data = train2, method = "rf", 
#                preProcess = "pca", na.action = na.pass)

#m2 <- train(classe ~., data = train2, method = "gbm", na.action = na.pass)
# m2.pca <- train(classe ~., data = train2, method = "gbm", 
#                 preProcess = "pca", na.action = na.pass)

#m3 <- train(classe ~., data = train2, method = "lda", na.action = na.pass)
# m3.pca <- train(classe ~., data = train2, method = "lda", 
#                 preProcess = "pca", na.action = na.pass)


v1 <- predict(m1, newdata = validate1)
confusionMatrix(v1, validate1$classe)

# v1.pca <- predict(m1.pca, newdata = validate1)
# confusionMatrix(v1.pca, validate1$classe)


v2 <- predict(m2, newdata = validate1)
confusionMatrix(v2, validate1$classe)

# v2.pca <- predict(m2.pca, newdata = validate1)
# confusionMatrix(v2.pca, validate1$classe)

v3 <- predict(m3, newdata = validate1)
xx<-confusionMatrix(v3, validate1$classe)

# v3.pca <- predict(m3.pca, newdata = validate1)
# confusionMatrix(v3.pca, validate1$classe)


data.frame(case = c(1:20), result = predict(m1, test1))


saveRDS(m1, "MLF_m1.rds")
saveRDS(m2, "MLF_m2.rds")
saveRDS(m3, "MLF_m3.rds")