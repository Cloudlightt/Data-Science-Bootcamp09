## Homework Part 1 ##
# Build "churn" prediction model
# method = "glm"
# 3-5 independent variables (features)
# df <- read_csv("churn.csv")

# Library
library(tidyverse)
library(caret)

## Train-Test-Split ##

## 1.Split Data

train_test_split_1 <- function(data, size = 0.8) {
    set.seed(42)
    n <- nrow(data)
    train_id <- sample(1:n, size*n)
    train_df <- data[train_id, ]
    test_df <- data[-train_id, ]
    return( list(train_df, test_df) )
}

prep_split_df <- train_test_split_1(churn, size = 0.8)

# Preview split data train & Test by subset[[]]

prep_split_df[[1]] ## This is train data
prep_split_df[[2]] ## This is test data

#---------------------------------------------------------------

## 2.Train Model

# Use function: train()
# With 4 features(x)
  # Use method: K-fold Re-sampling K = 10
  # Use method: Bootstrapped number = 10

# Lock resut
set.seed(42)

## Resampling Techniques

# Build CV stands for K-Fold CV 
ctrl_CV <- trainControl(method = "CV",
                        number = 10)

# Build boot for Bootstrap
ctrl_BT <- trainControl(method = "boot",
                        number = 10)

## Build train model ## 
glm_model <- train(churn ~ totaldayminutes + totaldaycalls + totaldaycharge + numbercustomerservicecalls,
                   data = prep_split_df[[1]],
                   method = "glm",
                   trControl = ctrl_CV)

#---------------------------------------------------------------

## 3.Score Model
predict_test <- predict( glm_model, newdata = prep_split_df[[2]] )

#---------------------------------------------------------------

## 4.Evaluate Model
actual_test <- prep_split_df[[2]]$churn

## Find accuracy = mean( predict Test data == actual Test data ) ##
acc_test_model <- mean( actual_test == predict_test )






