##############################################
#  Overfitting and bias-variance trade off
##############################################

n <- 100
set.seed(8451)
KULbg <- "#116E8A"
df <- tibble::tibble(
  x = runif(n, min = -2, max = 2),
  y = rnorm(n, mean = 1 + 2*x + x^2, sd = 1)
)

library(ggplot2)
p <- ggplot(df, aes(x, y)) + 
  geom_point(alpha = 0.3) +  
  theme_bw()
p1 <- p + 
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE, size = 1.5, color = KULbg) +
  ggtitle("Underfitting")
p2 <- p + 
  geom_smooth(method = "lm", formula = y ~ x + I(x^2), se = FALSE, size = 1.5, color = KULbg) +
  ggtitle("Just right?")
p3 <- p + 
  geom_smooth(method = "loess", span = 0.1, se = FALSE, size = 1.5, color = KULbg) +
  ggtitle("Overfitting")
gridExtra::grid.arrange(p1, p2, p3, nrow = 1)
