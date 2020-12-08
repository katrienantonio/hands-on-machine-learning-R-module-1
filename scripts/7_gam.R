####################################################################
#  Generalized Additive Models
####################################################################

library(tidyverse)

## --------------------------------------------------------------------------------------------------------------------------------------------------
dir <- dirname(rstudioapi::getActiveDocumentContext()$path)
dir <- here::here()   
setwd(dir) 
mtpl_orig <- read.table('../data/PC_data.txt', 
                        header = TRUE,
                        stringsAsFactors = TRUE)
mtpl_orig <- as_tibble(mtpl_orig)
mtpl <- mtpl_orig %>% rename_all(tolower) %>% rename(expo = exp)


## --------------------------------------------------------------------------------------------------------------------------------------------------
KULbg <- "#116E8A"
mtpl %>% group_by(ageph) %>% 
  summarize(emp_freq = sum(nclaims) / sum(expo)) %>% 
  ggplot(aes(x = ageph, y = emp_freq)) + theme_bw() +
  geom_point(color = KULbg)


## --------------------------------------------------------------------------------------------------------------------------------------------------
a <- min(mtpl$ageph):max(mtpl$ageph)


## --------------------------------------------------------------------------------------------------------------------------------------------------
freq_glm_age <- glm(nclaims ~ ageph, offset = log(expo), data = mtpl, family = poisson(link = "log"))
pred_glm_age <- predict(freq_glm_age, newdata = data.frame(ageph = a, expo = 1), type = "terms", se.fit = TRUE)
b_glm_age <- pred_glm_age$fit
l_glm_age <- pred_glm_age$fit - qnorm(0.975)*pred_glm_age$se.fit
u_glm_age <- pred_glm_age$fit + qnorm(0.975)*pred_glm_age$se.fit
df <- data.frame(a, b_glm_age, l_glm_age, u_glm_age)

p_glm_age <- ggplot(df, aes(x = a)) + ylim(-0.5, 1)
p_glm_age <- p_glm_age + geom_line(aes(a, b_glm_age), size = 1, col = KULbg)   
p_glm_age <- p_glm_age + geom_line(aes(a, u_glm_age), size = 0.5, linetype = 2, col = KULbg) + geom_line(aes(a, l_glm_age), size = 0.5, linetype = 2, col = KULbg)
p_glm_age <- p_glm_age + xlab("ageph") + ylab("fit") + theme_bw()
p_glm_age


## --------------------------------------------------------------------------------------------------------------------------------------------------
freq_glm_age_f <- glm(nclaims ~ as.factor(ageph), offset = log(expo), data = mtpl, family = poisson(link = "log"))
pred_glm_age_f <- predict(freq_glm_age_f, newdata = data.frame(ageph = a, expo = 1), type = "terms", se.fit = TRUE)
b_glm_age_f <- pred_glm_age_f$fit
l_glm_age_f <- pred_glm_age_f$fit - qnorm(0.975)*pred_glm_age_f$se.fit
u_glm_age_f <- pred_glm_age_f$fit + qnorm(0.975)*pred_glm_age_f$se.fit
df <- data.frame(a, b_glm_age_f, l_glm_age_f, u_glm_age_f)

p_glm_age_f <- ggplot(df, aes(x = a)) + ylim(-0.5, 1)
p_glm_age_f <- p_glm_age_f + geom_line(aes(a, b_glm_age_f), size = 1, col = KULbg)   
p_glm_age_f <- p_glm_age_f + geom_line(aes(a, u_glm_age_f), size = 0.5, linetype = 2, col = KULbg) + geom_line(aes(a, l_glm_age_f), size = 0.5, linetype = 2, col = KULbg)
p_glm_age_f <- p_glm_age_f + xlab("ageph") + ylab("fit") + theme_bw()
p_glm_age_f


## --------------------------------------------------------------------------------------------------------------------------------------------------
level <- seq(min(mtpl$ageph), max(mtpl$ageph), by = 5)
freq_glm_age_c <- glm(nclaims ~ cut(ageph, level), offset = log(expo), data = mtpl, family = poisson(link = "log"))
pred_glm_age_c <- predict(freq_glm_age_c, newdata = data.frame(ageph = a, expo = 1), type = "terms", se.fit = TRUE)
b_glm_age_c <- pred_glm_age_c$fit
l_glm_age_c <- pred_glm_age_c$fit - qnorm(0.975)*pred_glm_age_c$se.fit
u_glm_age_c <- pred_glm_age_c$fit + qnorm(0.975)*pred_glm_age_c$se.fit
df <- data.frame(a, b_glm_age_c, l_glm_age_c, u_glm_age_c)

p_glm_age_c <- ggplot(df, aes(x = a)) + ylim(-0.5, 1)
p_glm_age_c <- p_glm_age_c + geom_line(aes(a, b_glm_age_c), size = 1, col = KULbg)   
p_glm_age_c <- p_glm_age_c + geom_line(aes(a, u_glm_age_c), size = 0.5, linetype = 2, col = KULbg) + geom_line(aes(a, l_glm_age_c), size = 0.5, linetype = 2, col = KULbg)
p_glm_age_c <- p_glm_age_c + xlab("ageph") + ylab("fit") + theme_bw()
p_glm_age_c


## --------------------------------------------------------------------------------------------------------------------------------------------------
library(mgcv)
freq_gam_age <- gam(nclaims ~ s(ageph), 
                    offset = log(expo), 
                    data = mtpl, 
                    family = poisson(link = "log"))
pred_gam_age <- predict(freq_gam_age, 
                        newdata = data.frame(ageph = a, expo = 1), 
                        type = "terms", se.fit = TRUE)
b_gam_age <- pred_gam_age$fit
l_gam_age <- pred_gam_age$fit - qnorm(0.975)*pred_gam_age$se.fit
u_gam_age <- pred_gam_age$fit + qnorm(0.975)*pred_gam_age$se.fit
df <- data.frame(a, b_gam_age, l_gam_age, u_gam_age)

p_gam_age <- ggplot(df, aes(x = a)) + ylim(-0.5, 1)
p_gam_age <- p_gam_age + geom_line(aes(a, b_gam_age), size = 1, col = KULbg)   
p_gam_age <- p_gam_age + geom_line(aes(a, u_gam_age), size = 0.5, linetype = 2, col = KULbg) + geom_line(aes(a, l_gam_age), size = 0.5, linetype = 2, col = KULbg)
p_gam_age <- p_gam_age + xlab("ageph") + ylab("fit") + theme_bw()
p_gam_age


## --------------------------------------------------------------------------------------------------------------------------------------------------
library(mgcv)
freq_gam <- gam(nclaims ~ s(ageph), offset = log(expo), family = poisson(link = "log"), data = mtpl)
plot(freq_gam, scheme = 4)


## --------------------------------------------------------------------------------------------------------------------------------------------------
library(MASS)
bias_model <- gam(accel ~ s(times, sp = 0, k = 3), data = mcycle)
mcycle$predictions <- predict(bias_model, mcycle)
p_1 <- ggplot(mcycle, aes(times, accel)) + theme_bw() +
  geom_point(alpha = .3) +
  geom_line(aes(times, predictions), size = 1.0, color = KULbg) +
  theme(axis.title.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank()) +
  scale_x_continuous(expand = c(0, 0)) + 
  ggtitle("sp = 0 and k = 3")

bias_model <- gam(accel ~ s(times, sp = 0, k = 5), data = mcycle)
mcycle$predictions <- predict(bias_model, mcycle)
p_2 <- ggplot(mcycle, aes(times, accel)) + theme_bw() +
  geom_point(alpha = .3) +
  geom_line(aes(times, predictions), size = 1.0, color = KULbg) +
  theme(axis.title.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank()) +
  scale_x_continuous(expand = c(0, 0)) +
  ggtitle("sp = 0 and k = 5")

bias_model <- gam(accel ~ s(times, sp = 0, k = 55), data = mcycle)
mcycle$predictions <- predict(bias_model, mcycle)
p_3 <- ggplot(mcycle, aes(times, accel)) + theme_bw() +
  geom_point(alpha = .3) +
  geom_line(aes(times, predictions), size = 1.0, color = KULbg) +
  theme(axis.title.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank()) +
  scale_x_continuous(expand = c(0, 0)) + 
  ggtitle("sp = 0 and k = 15")

bias_model <- gam(accel ~ s(times), data = mcycle)
mcycle$predictions <- predict(bias_model, mcycle)
p_4 <- ggplot(mcycle, aes(times, accel)) + theme_bw() + 
  geom_point(alpha = .3) +
  geom_line(aes(times, predictions), size = 1.0, color = KULbg) +
  theme(axis.title.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank()) +
  scale_x_continuous(expand = c(0, 0)) + 
  ggtitle("optimal sp and default k")

bias_model <- gam(accel ~ s(times, sp = 3), data = mcycle)
mcycle$predictions <- predict(bias_model, mcycle)
p_5 <- ggplot(mcycle, aes(times, accel)) + theme_bw() +
  geom_point(alpha = .3) +
  geom_line(aes(times, predictions), size = 1.0, color = KULbg) +
  theme(axis.title.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank()) +
  scale_x_continuous(expand = c(0, 0)) + 
  ggtitle("sp = 3 and default k")

bias_model <- gam(accel ~ s(times, sp = 20), data = mcycle)
mcycle$predictions <- predict(bias_model, mcycle)
p_6 <- ggplot(mcycle, aes(times, accel)) + theme_bw() +
  geom_point(alpha = .3) +
  geom_line(aes(times, predictions), size = 1.0, color = KULbg) +
  theme(axis.title.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank()) +
  scale_x_continuous(expand = c(0, 0)) +
  ggtitle("sp = 10 and default k")

gridExtra::grid.arrange(p_1, p_2, p_3, p_4, p_5, p_6, nrow = 2)


## Your Turn!
## --------------------------------------------------------------------------------------------------------------------------------------------------














