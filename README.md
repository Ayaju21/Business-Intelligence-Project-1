# Business-Intelligence-Project-1
# 🛒 Online Shoppers Purchasing Intention Prediction

This project focuses on analyzing and predicting consumer behavior in online retail environments using **R programming**. By utilizing the "Online Shoppers Purchasing Intention" dataset from the UCI repository, we developed machine learning models to distinguish between browsing sessions that end in a purchase and those that do not.

## 🎯 Objectives
* Analyze digital browsing patterns and session activity.
* Implement and compare **Logistic Regression** and **Decision Tree** algorithms.
* Evaluate model performance using Accuracy, Precision, Recall, Sensitivity, and Specificity.
* Provide actionable insights for e-commerce personalization and targeted marketing.

---

## 📊 Dataset Overview
The dataset contains various features representing user navigation, including:
* **Administrative/Informational/ProductRelated:** Pages visited by the user.
* **ExitRates/BounceRates:** Metrics provided by Google Analytics for each page.
* **PageValues:** The average value for a web page that a user visited before completing an e-commerce transaction.
* **Special Day:** Closeness of the site visiting time to a specific special day (e.g., Mother's Day, Valentine's Day).
* **Label:** Revenue (True/False) - indicating if a purchase was made.

---

## 🛠️ Algorithms Applied

### 1. Logistic Regression
Utilized to model the probability of a binary outcome (Purchase vs. No Purchase) using the Sigmoid function. It serves as a strong baseline for linear classification.


### 2. Decision Tree
A non-linear model that splits the data into branches based on feature importance, providing a highly interpretable visual map of the consumer's decision journey.
