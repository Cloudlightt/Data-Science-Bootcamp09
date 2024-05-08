## Homework Part 2 ##
# Build "churn" prediction model
# method = "glm"

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

# Lock result
set.seed(42)

## Resampling Techniques

# Use for Recall, Precision, F1, AUC
ctrl <- trainControl(method= "cv", 
                     number = 5,
                     ## pr = precision + recall
                     summaryFunction = prSummary,
                     classProbs = TRUE)

## Build train model ## 
glm_model <- train(churn ~ .,
                   data = train_df,
                   method = "glm",
                   metric = "Precision",
                   trControl = ctrl)

#-------------------------------------------------------------#

## 3. Score ##
pred_df <- predict(glm_model, 
                   newdata = test_df)

#-------------------------------------------------------------#

## 4. Evaluate ##
actual_df <- test_df$churn

# Find accuracy
acc <- mean(pred_df == actual_df)

#-------------------------------------------------------------#

## Confusion matrix ##

# Confusion matrix by function
conf_glm <- confusionMatrix(pred_df, 
                            factor(actual_df),
                            positive = "Yes",
                            mode = "prec_recall")


# Confusion matrix by manual (Optional)
conf_glm.1 <- table(pred_df, actual_df,
                    dnn = c("predicted", "actual"))

accuracy <- ((conf_glm.1[[1,1]] + conf_glm.1[[2,2]]) / sum(conf_1))

precision <- conf_glm.1[[2,2]] / (conf_glm.1[[2,1]] + conf_glm.1[[2,2]])

recall <- conf_glm.1[[2,2]] / (conf_glm.1[[1,2]] + conf_glm.1[[2,2]])

F1Score <- 2 * ((precision * recall) / (precision + recall)) 


