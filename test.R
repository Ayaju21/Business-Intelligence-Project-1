# تحميل المكتبات اللازمة
library(tidyverse)
library(caret)
library(rpart)
library(rpart.plot)
library(pROC)   # لحساب ROC و AUC

# 1) قراءة الداتا
df <- read.csv("online_shoppers_intention.csv")

# 2) تجهيز الـ Target: Revenue (TRUE/FALSE → Yes/No → factor)
df <- df %>%
  mutate(
    Revenue = case_when(
      Revenue == TRUE | Revenue == "TRUE" | Revenue == 1 ~ "Yes",
      TRUE ~ "No"
    ),
    Revenue = factor(Revenue, levels = c("No", "Yes"))
  )

# 3) تحويل الـ character والـ logical إلى factor
df <- df %>%
  mutate(
    across(where(is.character), as.factor),
    across(where(is.logical), as.factor)
  )

# 4) تقسيم البيانات إلى train و test
set.seed(42)
train_index <- createDataPartition(df$Revenue, p = 0.8, list = FALSE)
train_data  <- df[train_index, ]
test_data   <- df[-train_index, ]

# 5) دالة لحساب المقاييس
compute_metrics <- function(actual, predicted, positive_class = "Yes") {
  cm <- confusionMatrix(predicted, actual, positive = positive_class)
  c(
    Accuracy    = as.numeric(cm$overall["Accuracy"]),
    Precision   = as.numeric(cm$byClass["Pos Pred Value"]),
    Recall      = as.numeric(cm$byClass["Sensitivity"]),
    Sensitivity = as.numeric(cm$byClass["Sensitivity"]),
    Specificity = as.numeric(cm$byClass["Specificity"])
  )
}

# 6) نموذج Logistic Regression
log_model <- glm(Revenue ~ ., data = train_data, family = binomial)
log_probs <- predict(log_model, newdata = test_data, type = "response")
log_pred  <- factor(ifelse(log_probs >= 0.5, "Yes", "No"), levels = c("No", "Yes"))
log_metrics <- compute_metrics(test_data$Revenue, log_pred)

# ROC و AUC للـ Logistic Regression
roc_log <- roc(test_data$Revenue, log_probs, levels = c("No","Yes"), direction = "<")
auc_log <- auc(roc_log)
plot(roc_log, main = paste("ROC Curve - Logistic Regression (AUC =", round(auc_log, 4), ")"), col="blue", lwd=2)
