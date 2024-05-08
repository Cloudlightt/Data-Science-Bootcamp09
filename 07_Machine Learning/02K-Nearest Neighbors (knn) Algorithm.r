## Homework Part 2 ##
# Build "churn" prediction model
# method = "knn"

# Library
library(tidyverse)
library(caret)
library(MLmetrics)

# Load Dataset
df <- churn

# Explore Dataset
glimpse(churn)

# Check missing values (N/A) = No missing value
mean(complete.cases(df))

# Select variables
df_c <- df %>%
  select(churn,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17)

#-------------------------------------------------------------#

## Train-Test-Split ##

## 1.Split Data
set.seed(42)
n <- nrow(df_c)
id <- sample(1:n, size = 0.8*n)
train_df <- df_c[id, ]
test_df <- df_c[-id, ]

#-------------------------------------------------------------#

## 2.Train model ##

## Lock result
set.seed(42)

## Resampling Techniques

# grid search (use dataframe) - Create column "K"
k_grid <- data.frame(k = c(3, 5, 7, 9, 11) )

# Use for Recall, Precision, F1, AUC
ctrl <- trainControl(method= "cv", 
                     number = 5,
                     ## pr = precision + recall
                     summaryFunction = prSummary,
                     classProbs = TRUE)

## Build train model ## 
knn_model <- train(churn ~ .,
                   data = train_df,
                   method = "knn",
                   metric = "Precision",
                   trControl = ctrl,
                   tuneGrid = k_grid)

#-------------------------------------------------------------#

## 3. Score ##
p <- predict(knn_model, 
             newdata = test_df)

#-------------------------------------------------------------#

## 4. Evaluate ##
actual_df <- test_df$churn

# Find accuracy
acc <- mean(p == actual_df)

#-------------------------------------------------------------#

## Confusion matrix

# Confusion matrix by function
conf_knn <- confusionMatrix(p, 
                            factor(actual_df),
                            positive = "Yes",
                            mode = "prec_recall")


# Confusion matrix by manual (Optional)
conf_knn.1 <- table(p, actual_df,
                    dnn = c("predicted", "actual"))

accuracy <- ((conf_knn.1[[1,1]] + conf_knn.1[[2,2]]) / sum(conf_1))

precision <- conf_knn.1[[2,2]] / (conf_knn.1[[2,1]] + conf_knn.1[[2,2]])
 
recall <- conf_knn.1[[2,2]] / (conf_knn.1[[1,2]] + conf_knn.1[[2,2]])

F1Score <- 2 * ((precision * recall) / (precision + recall)) 










