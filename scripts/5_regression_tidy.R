####################################################################
#  Regression models in R and tidy model output
####################################################################

library(tidyverse)

## --------------------------------------------------------------------------------------------------------------------------------------------------
# model_fn(Sale_Price ~ Gr_Liv_Area, data = ames)

# model_fn(Sale_Price ~ Gr_Liv_Area + Neighborhood, data = ames)

# model_fn(Sale_Price ~ Gr_Liv_Area + Neighborhood + Neighborhood:Gr_Liv_Area, data = ames)

# model_fn(Sale_Price ~ ., data = ames)


## Your Turn!
## --------------------------------------------------------------------------------------------------------------------------------------------------












## --------------------------------------------------------------------------------------------------------------------------------------------------
library(AmesHousing)
ames <- AmesHousing::make_ames()
model_1 <- lm(Sale_Price ~ Gr_Liv_Area, data = ames)

library(broom)
model_1 %>% broom::tidy()

model_1 %>% broom::glance()

model_1 %>% broom::augment() %>% slice(1:5)


## --------------------------------------------------------------------------------------------------------------------------------------------------
library(ggplot2)
g_lm_1 <- ggplot(data = ames, aes(Gr_Liv_Area, Sale_Price)) + theme_bw() +
  geom_point(size = 1, alpha = 0.3) +
  geom_smooth(se = TRUE, method = "lm") +
  scale_y_continuous(labels = scales::dollar) +
  ggtitle("Regression with AMES housing data")

KULbg <- "#116E8A"
g_lm_2 <- model_1 %>% broom::augment() %>% ggplot(aes(Gr_Liv_Area, Sale_Price)) + 
  theme_bw() +
  geom_point(size = 1, alpha = 0.3) +
  geom_line(aes(y = .fitted), col = KULbg) +
  scale_y_continuous(labels = scales::dollar) +
  ggtitle("Regression with AMES housing data")

gridExtra::grid.arrange(g_lm_1, g_lm_2, ncol = 2)
