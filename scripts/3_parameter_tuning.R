##############################################
#  Parameter tuning
##############################################

library(tidyverse)

## --------------------------------------------------------------------------------------------------------------------------------------------------
set.seed(123)  # for reproducibility
x <- seq(from = 0, to = 2 * pi, length = 500)
y <- sin(x) + rnorm(length(x), sd = 0.3)
df <- data.frame(x, y) %>% dplyr::filter(x < 4.5)

KULbg <- "#116E8A"

# Single biased model fit
bias_model <- lm(y ~ I(x^3), data = df)
df$predictions <- predict(bias_model, df)
p_1 <- ggplot(df, aes(x, y)) +
  geom_point(alpha = .3) +
  geom_line(aes(x, predictions), size = 1.5, color = KULbg) +
  scale_y_continuous("Response", limits = c(-1.75, 1.75), expand = c(0, 0)) +
  scale_x_continuous(limits = c(0, 4.5), expand = c(0, 0)) + theme_bw() +
  ggtitle("Biased model fit")

# Single high variance model fit
library(caret)
variance_model <- knnreg(y ~ x, k = 3, data = df)
df$predictions <- predict(variance_model, df)
p_2 <- ggplot(df, aes(x, y)) +
  geom_point(alpha = .3) +
  geom_line(aes(x, predictions), size = 1.5, color = KULbg) +
  scale_y_continuous("Response", limits = c(-1.75, 1.75), expand = c(0, 0)) +
  scale_x_continuous(limits = c(0, 4.5), expand = c(0, 0)) + theme_bw() +
  ggtitle("High variance model fit")

gridExtra::grid.arrange(p_1, p_2, nrow = 2)


## --------------------------------------------------------------------------------------------------------------------------------------------------
set.seed(123)
library(caret)
cv <- trainControl(method = "cv", number = 5, 
                   returnResamp = "all",  
                   selectionFunction = "best") 
hyper_grid <- expand.grid(k = seq(2, 150, by = 2))  
knn_fit <- train(y ~ x, data = df, method = "knn", 
                 trControl = cv, 
                 tuneGrid = hyper_grid) 
knn_fit$bestTune


## --------------------------------------------------------------------------------------------------------------------------------------------------
set.seed(123)
cv <- trainControl(method = "cv", number = 5, 
                   returnResamp = "all",  
                   selectionFunction = "best") 
hyper_grid <- expand.grid(k = seq(2, 150, by = 2))  
knn_fit <- train(y ~ x, data = df, method = "knn", 
                 trControl = cv, 
                 tuneGrid = hyper_grid)
knn_fit$bestTune

p_best <- ggplot() + theme_bw() +
  geom_line(data = knn_fit$results, aes(k, RMSE)) +
  geom_point(data = knn_fit$results, aes(k, RMSE)) +
  geom_point(data = filter(knn_fit$results, k == as.numeric(knn_fit$bestTune)),
             aes(k, RMSE),
             shape = 21, fill = "yellow", color = "black", stroke = 1, size = 4) +
  scale_y_continuous("Error (RMSE)")

set.seed(123)
cv <- trainControl(method = "cv", number = 5, 
                   returnResamp = "all",  
                   selectionFunction = "oneSE") 
hyper_grid <- expand.grid(k = seq(2, 150, by = 2))  
knn_fit <- train(y ~ x, data = df, method = "knn", 
                 trControl = cv, 
                 tuneGrid = hyper_grid)
knn_fit$bestTune

p_oneSE <- ggplot() + theme_bw() +
  geom_line(data = knn_fit$results, aes(k, RMSE)) +
  geom_point(data = knn_fit$results, aes(k, RMSE)) +
  geom_point(data = filter(knn_fit$results, k == as.numeric(knn_fit$bestTune)),
             aes(k, RMSE),
             shape = 21, fill = "yellow", color = "black", stroke = 1, size = 4) +
  scale_y_continuous("Error (RMSE)")

gridExtra::grid.arrange(p_best, p_oneSE, ncol = 2)


## --------------------------------------------------------------------------------------------------------------------------------------------------
set.seed(123)
library(rsample)
cv_rsample <- vfold_cv(df, 5)
cv_rsample$splits[1:3] 

holdout_results <- function(s, k_val) {
  # Fit the model to the analysis data in split s
  df_train <- analysis(s)
  mod <- knnreg(y ~ x, k = k_val, data = df_train)
  # Get the remaining group
  holdout <- assessment(s)
  # Get predictions with the holdout data set
  res <- predict(mod, newdata = holdout)
  # Return observed and predicted values
  #                            on holdout set
  res <- tibble(obs = holdout$y, pred = res)
  res
}


## Your Turn!
## --------------------------------------------------------------------------------------------------------------------------------------------------

























