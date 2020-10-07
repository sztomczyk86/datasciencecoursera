# QUIZ 2
library(caret)
library(tidyverse)
library(GGally)

#q1 
library(AppliedPredictiveModeling)
data(AlzheimerDisease)

adData = data.frame(diagnosis,predictors)
trainIndex = createDataPartition(diagnosis, p = 0.50,list=FALSE)
training = adData[trainIndex,]
testing = adData[-trainIndex,]

#q2
library(AppliedPredictiveModeling)
data(concrete)
library(Hmisc)

set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]


training %>% mutate(CompressiveStrength1 = cut2(training$CompressiveStrength, g = 4)) -> training
ggpairs(data = training, mapping = ggplot2::aes(colour = CompressiveStrength1))

#q3

hist(log(training$Superplasticizer))

#q4

library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

sub1 <- grep("^IL", names(training), ignore.case = F)

training %>% select(sub1) -> bla

pca1 <- preProcess(bla, method = "pca", thresh = 0.9)

#q5
library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

sub1 <- grep("^IL", names(training), ignore.case = F)
training %>% select(diagnosis, sub1) -> t1
testing %>% select(diagnosis, sub1) -> test1

ctrl <- trainControl(preProcOptions = list(thresh = 0.8))
x1 <- train(diagnosis ~., data = t1, method = "glm")
x2 <- train(diagnosis ~., data = t1, preProcess = "pca", trControl = ctrl, 
            method = "glm")


m1 <- predict(x1, newdata = test1)
m2 <- predict(x2, newdata = test1)


matrix_model1 <- confusionMatrix(m1, test1$diagnosis)
matrix_model2 <- confusionMatrix(m2, test1$diagnosis)

# QUIZ 3
# q1
library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)

partition <- createDataPartition(segmentationOriginal$Class, p = 0.7)[[1]]
df <- data_frame(segmentationOriginal)
train1 <- df[partition,]
test1 <- df[-partition,]

set.seed(125)

m1 <- train(Class ~., data = train1, method = "rpart")

predict(m1, newdata = data_frame(TotalIntench2 = 23000, 
                                 FiberWidthCh1 = 10, PerimStatusCh1=2))

library(rattle)
fancyRpartPlot(m1$finalModel)

# q3

library(pgmm)
data(olive)
olive = olive[,-1]

newdata = as.data.frame(t(colMeans(olive)))

m1 <- train(Area ~., data = olive, method = "rpart")

predict(m1, newdata = newdata)

# q5

library(ElemStatLearn)
data(vowel.train)
data(vowel.test)


#QUIZ 4
# q1

vowel.test$y <- as.factor(vowel.test$y)
vowel.train$y <- as.factor(vowel.train$y)

set.seed(33833)

m1 <- train(y ~., data = vowel.train, method = "rf")
m2 <- train(y ~., data = vowel.train, method = "gbm")

p1 <- predict(m1, newdata = vowel.test)
p2 <- predict(m2, newdata = vowel.test)

confusionMatrix(p1, vowel.test$y)
confusionMatrix(p2, vowel.test$y)

#q2
library(caret)
library(gbm)
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

set.seed(62433)

m1 <- train(diagnosis ~ ., data = training, method = "rf")
m2 <- train(diagnosis ~ ., data = training, method = "gbm")
m3 <- train(diagnosis ~ ., data = training, method = "lda")

p1 <- predict(m1, newdata = testing)
p2 <- predict(m2, newdata = testing)
p3 <- predict(m3, newdata = testing)


confusionMatrix(p1, testing$diagnosis)$overall[1]
confusionMatrix(p2, testing$diagnosis)$overall[1]
confusionMatrix(p3, testing$diagnosis)$overall[1]

df1 <- data_frame(testing$diagnosis, p1, p2, p3)
names(df1)[1] <- "diagnosis"
m123 <- train(diagnosis ~ ., data = df1, method = "rf")
p123 <- predict(m123, newdata = testing)
confusionMatrix(p123, testing$diagnosis)$overall[1]

#q3
set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

set.seed(233)

m1 <- train(CompressiveStrength ~., data = concrete, method = "lasso")
plot(m1$finalModel, xvar = "penalty", use.color = T)

#q4

library(lubridate) # For year() function below
library(forecast)
dat = read.csv("~/Downloads/gaData.csv")
training = dat[year(dat$date) < 2012,]
testing = dat[(year(dat$date)) > 2011,]
tstrain = ts(training$visitsTumblr)

m1 <- bats(tstrain)

predict(m1, testing$visitsTumblr)

#q5
set.seed(3523)

library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

set.seed(325)

m1 <- e1071::svm(CompressiveStrength~., data = training)

p1 <- predict(m1, newdata = testing)
p1
RMSE(p1, testing$CompressiveStrength)
