##############################################
#  Data splitting and resampling methods
##############################################

library(tidyverse)

## --------------------------------------------------------------------------------------------------------------------------------------------------
library(AmesHousing)
ames <- AmesHousing::make_ames()


## --------------------------------------------------------------------------------------------------------------------------------------------------
set.seed(123) 
index_1 <- sample(1 : nrow(ames), 
                  size = round(nrow(ames) * 0.7))   
train_1 <- ames[index_1, ]   
test_1  <- ames[-index_1, ]  

nrow(train_1)/nrow(ames)


## --------------------------------------------------------------------------------------------------------------------------------------------------
library(caret)
set.seed(123)
index_2 <- caret::createDataPartition(y = ames$Sale_Price,
                                      p = 0.7,
                                      list = FALSE)
train_2 <- ames[index_2, ]
test_2  <- ames[-index_2, ]

nrow(train_2)/nrow(ames)


## --------------------------------------------------------------------------------------------------------------------------------------------------
library(rsample)
set.seed(123)
split_1  <- rsample::initial_split(ames, prop = 0.7)
train_3  <- training(split_1)
test_3   <- testing(split_1)

nrow(train_3)/nrow(ames)


## --------------------------------------------------------------------------------------------------------------------------------------------------
library(ggplot2)
p_1 <- ggplot(train_1, aes(x = Sale_Price)) + theme_bw() +
  geom_density(trim = TRUE) +
  geom_density(data = test_1, trim = TRUE, col = "red") +
  ggtitle("base R")

p_2 <- ggplot(train_2, aes(x = Sale_Price)) + theme_bw() +
  geom_density(trim = TRUE) +
  geom_density(data = test_2, trim = TRUE, col = "red") +
  theme(axis.title.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank()) +
  ggtitle("caret") 

p_3 <- ggplot(train_3, aes(x = Sale_Price)) + theme_bw() +
  geom_density(trim = TRUE) + 
  geom_density(data = test_3, trim = TRUE, col = "red") +
  theme(axis.title.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank()) +
  ggtitle("rsample")

library(gridExtra)
gridExtra::grid.arrange(p_1, p_2, p_3, nrow = 1)


## --------------------------------------------------------------------------------------------------------------------------------------------------
set.seed(123)  
cv_folds <- caret::createFolds(ames$Sale_Price, 
                               k = 5, list = TRUE, 
                               returnTrain = TRUE)
str(cv_folds)


## --------------------------------------------------------------------------------------------------------------------------------------------------
mean(ames[cv_folds$Fold1, ]$Sale_Price)

library(purrr)
purrr::map_dbl(cv_folds,
               function(x) {
                 mean(ames[x, ]$Sale_Price)
               })


## --------------------------------------------------------------------------------------------------------------------------------------------------
set.seed(123)  
cv_rsample <- rsample::vfold_cv(ames, v = 5)
cv_rsample$splits


## --------------------------------------------------------------------------------------------------------------------------------------------------
cv_rsample$splits[[1]]

cv_rsample$splits[[1]] %>% analysis() %>% dim()

cv_rsample$splits[[1]] %>% assessment() %>% dim()


## --------------------------------------------------------------------------------------------------------------------------------------------------
purrr::map_dbl(cv_rsample$splits,
               function(x) {
                 mean(rsample::analysis(x)$Sale_Price)
               })

purrr::map_dbl(cv_rsample$splits,
               function(x) {
                 nrow(rsample::analysis(x))
               })


## Your Turn!
## --------------------------------------------------------------------------------------------------------------------------------------------------












