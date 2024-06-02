# Machine Learning

This project dives into machine learning, employing a Workflow: Train-Test-Split method to construct a Supervised Learning model for predicting "Churn" data. 

"Churn" data represents the rate at which customers discontinue using UCI's telephone service, resembling real customer profiles.

This project dataset is about Churn: Deactivate mobile network

From the provided image, we can conclude that this dataset involves customers of a mobile phone network provider and aims to predict whether each customer will "Churn" or not.

Our model development unfolds across three key areas:

## 1. Generalized Linear Model (glm) Algorithm.
- Leveraging Supervised Learning for classification.
- Employing Resampling Techniques:
  
   - ![K-Fold Cross Validation (CV)](https://img.shields.io/badge/K--Fold%20Cross%20Validation%20(CV)%20-%20%236886b4?style=flat)
   - ![Bootstrap](https://img.shields.io/badge/Bootstrap%20-%20%233f4f68?style=flat)

![Alt text](https://github.com/Cloudlightt/Data-Science-Bootcamp09/blob/main/07_Machine%20Learning/Homework_part1.png?raw=true)


### 1.1 Predictive Variables
Four variables are used to predict churn:

- totaldayminutes: Total minutes of phone calls per day
- totaldaycalls: Total number of phone calls per day
- totaldaycharge: Total charges per day
- numbercustomerservicecalls: Number of calls made to customer service

### 1.2. Model
The model used to predict churn in this context is the "Generalized Linear Model" (GLM). This model employs machine learning techniques to analyze the relationship between the independent variables (the four variables listed above) and the dependent variable (churn).

### 1.3. Results
The GLM created has an accuracy of 85.82%, meaning the model can correctly predict churn in 85.82% of cases


## 2. K-Nearest Neighbors (knn) Algorithm.
- Leveraging Supervised Learning for classification.
- Employing Resampling Techniques:
  
  - ![K-Fold Cross Validation (CV)](https://img.shields.io/badge/K--Fold%20Cross%20Validation%20(CV)%20-%20%236886b4?style=flat)
  - ![Adding Classification interface to show the statics results as Precision, Recall, F1, and AUC](https://img.shields.io/badge/Adding%20Classification%20interface%20to%20show%20the%20statics%20results%20as%20Precision%2C%20Recall%2C%20F1%2C%20and%20AUC%20-%20%233f4f68?style=flat)
  - ![Choosing K score or Manual tune hyperparameter for Grid search type](https://img.shields.io/badge/Choosing%20K%20score%20or%20Manual%20tune%20hyperparameter%20for%20Grid%20search%20type.%20-%20%23878988?style=flat)

![Alt text](https://github.com/Cloudlightt/Data-Science-Bootcamp09/blob/main/07_Machine%20Learning/Homework_patr2_knn_model.png?raw=true)

### 2.1 Predictive Variables

The dataset used for this churn analysis includes the following 15 variables:

- voicemailplan: Voicemail plan
- numbervmailmessages: Number of voicemail messages
- totaldayminutes: Total daytime call minutes
- totaldaycalls: Total number of daytime calls
- totaldaycharge: Total daytime call charges
- totaleveminutes: Total evening call minutes
- totalevecalls: Total number of evening calls
- totalevecharge: Total evening call charges
- totalnightminutes: Total night call minutes
- totalnightcalls: Total number of night calls
- totalnightcharge: Total night call charges
- totalintlminutes: Total international call minutes
- totalintlcalls: Total number of international calls
- totalintlcharge: Total international call charges
- numbercustomerservicecalls: Number of customer service calls

### 2.2 Model 

This is an analysis of customer Churn for a mobile network using the k-Nearest Neighbors (k-NN) model to predict whether each customer is at risk of leaving the service. 

### 2.3 Results
The analysis revealed that the k-NN model with the best performance uses k = 5. This means the model considers the 5 most similar customers to predict whether a new customer is at risk of churning.

This optimal k-NN model achieves an accuracy of 88.5%, meaning it correctly predicts churn for 88.5% of the customers.



## 3. Generalized Linear Model (glm) Algorithm.
- Leveraging Supervised Learning for classification.
- Employing Resampling Techniques:
  
  - ![K-Fold Cross Validation (CV)](https://img.shields.io/badge/K--Fold%20Cross%20Validation%20(CV)%20-%20%236886b4?style=flat)
  - ![Adding Classification interface to show the statics results as Precision, Recall, F1, and AUC](https://img.shields.io/badge/Adding%20Classification%20interface%20to%20show%20the%20statics%20results%20as%20Precision%2C%20Recall%2C%20F1%2C%20and%20AUC%20-%20%233f4f68?style=flat)
 
![Alt text](https://github.com/Cloudlightt/Data-Science-Bootcamp09/blob/main/07_Machine%20Learning/Homework_patr2.1_glm_model.png?raw=true)

### 3.1  Model & Predictive Variables
Generalized Linear Model (GLM) Results for Predicting Churn
This section presents the results of a Generalized Linear Model (GLM) used to predict churn, or the discontinuation of a mobile network service.

The model was used on a sample dataset of 4,000 instances, divided into two groups: "No" (customers who did not churn) and "Yes" (customers who churned). The model used 15 variables for prediction, as mentioned in the previous section.

### 3.2 Results

- The model has good overall accuracy (Accuracy = 86.9%) and is capable of distinguishing between classes (AUC = 0.925).
- The model has high accuracy in predicting the 'No' class (Recall = 0.9834), but there are limitations in predicting the 'Yes' class (Recall = 0.2069).
- The low Kappa value (0.2626) indicates that the model still has issues with agreement with the actual values, especially for the 'Yes' class.


## Suggestion
Based on these results, there are the suggestion to provider hopefully can get the benefit as below:
- Identify high-risk customers likely to churn and offer promotions or special incentives to retain them.
- Enhance services to better meet customer needs, thereby reducing the likelihood of churn.
- Improve customer service efficiency to decrease the number of calls to customer support.

