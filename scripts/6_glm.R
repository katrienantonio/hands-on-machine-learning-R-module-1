####################################################################
#  Generalized Linear Models
####################################################################

library(tidyverse)

## --------------------------------------------------------------------------------------------------------------------------------------------------
dir <- dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(dir) 
mtpl_orig <- read.table('../data/PC_data.txt', 
                        header = TRUE,
                        stringsAsFactors = TRUE)
mtpl_orig <- as_tibble(mtpl_orig)


## --------------------------------------------------------------------------------------------------------------------------------------------------
mtpl_orig %>% slice(1:3) %>% select(-LONG, -LAT)

mtpl <- mtpl_orig %>% rename_all(tolower) %>% rename(expo = exp)
names(mtpl)


## --------------------------------------------------------------------------------------------------------------------------------------------------
dim(mtpl)

mtpl %>% summarize(emp_freq = sum(nclaims) / sum(expo))

mtpl %>% 
  group_by(sex) %>% 
  summarize(emp_freq = sum(nclaims) / sum(expo))

KULbg <- "#116E8A"
g <- ggplot(mtpl, aes(nclaims)) + theme_bw() + 
  geom_bar(aes(weight = expo), 
           col = KULbg, fill = KULbg) + 
  labs(y = "Abs freq (in exposure)") +
  ggtitle("MTPL - number of claims")
g


## Your Turn!
## --------------------------------------------------------------------------------------------------------------------------------------------------
















## --------------------------------------------------------------------------------------------------------------------------------------------------
g_freq <- ggplot(mtpl, aes(nclaims)) + theme_bw() + 
  geom_bar(aes(weight = expo), col = KULbg, 
           fill = KULbg, alpha = .5) + 
  labs(y = "Abs freq (in exposure)") +
  ggtitle("MTPL - number of claims")
g_freq

g_sev <- ggplot(mtpl, aes(x = avg)) + theme_bw() +
  geom_histogram(bins = 30, boundary = 0, color = KULbg, fill = KULbg, alpha = .5) + 
  labs(x = "claim severity") +
  xlim(c(0, 20000))
g_sev


## --------------------------------------------------------------------------------------------------------------------------------------------------
freq_glm_1 <- glm(nclaims ~ sex, offset = log(expo), 
                  family = poisson(link = "log"), 
                  data = mtpl)

freq_glm_1 %>% broom::tidy() 

freq_glm_1 %>% broom::augment(type.predict = "response") %>% slice(1:2) %>% select(nclaims, sex, .fitted)

exp(coef(freq_glm_1)[1])
exp(coef(freq_glm_1)[1] + coef(freq_glm_1)[2])

freq_glm_1 %>% broom::glance() 


## Your Turn!
## --------------------------------------------------------------------------------------------------------------------------------------------------










