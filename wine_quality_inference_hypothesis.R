library(MASS)
library(boot)
library(e1071)
library(dplyr)
library(ggplot2)
library(readr)

red <- read_delim("~/Desktop/Stat Methods/winequality-red.csv",
                  delim = ";",
                  locale = locale(decimal_mark = "."),
                  show_col_types = FALSE)

str(red$density)

mu <- mean(red$density)

se <- sd(red$density) / sqrt(nrow(red))

ci <- mu + c(-1, 1) * 1.96 * se

set.seed(123)
B <- 10000
boot_means <- replicate(B, mean(sample(red$density, nrow(red), replace = TRUE)))

se_boot <- sd(boot_means)
ci_boot <- quantile(boot_means, c(.025, .975), names = FALSE)

se_boot
ci_boot

fit <- fitdistr(red$density * 10, "normal")
fit

mu_mle <- fit$estimate["mean"] / 10
sigma_mle <- fit$estimate["sd"] / 10
se_mle <- fit$sd / 10

mu <- mean(red$`residual sugar`)

n  <- nrow(red)
se <- sd(red$`residual sugar`) / sqrt(n)
ci <- mu + c(-1, 1) * 1.96 * se

set.seed(123)
B <- 10000
n <- nrow(red)

bmsugar <- replicate(
  B,
  mean(sample(red$`residual sugar`, n, replace = TRUE)))

se_boot <- sd(bmsugar)
ci_boot <- quantile(bmsugar, c(.025, .975), names = FALSE)

se_boot
ci_boot

fit_ln  <- fitdistr(red$`residual sugar`, "lognormal")
ln_est  <- fit_ln$estimate
ln_se   <- fit_ln$sd
aic_ln  <- 2*length(ln_est) - 2*fit_ln$loglik

fit_gm  <- fitdistr(red$`residual sugar`, densfun = "gamma")
gm_est  <- fit_gm$estimate
gm_se   <- fit_gm$sd
aic_gm  <- 2*length(gm_est) - 2*fit_gm$loglik

red$excellent <- as.integer(red$quality >= 7)

n <- nrow(red)
p <- mean(red$excellent) 
se <- sqrt(p * (1 - p) / n)
ci <- p + c(-1, 1) * 1.96 * se

set.seed(123)
B <- 10000
n <- nrow(red)

bmp <- replicate(B, mean(sample(red$excellent, n, replace = TRUE)))

se_boot <- sd(bmp)
ci_boot <- quantile(bmp, c(.025, .975), names = FALSE)

se_boot
ci_boot

p <- mean(red$excellent) 
se <- sqrt(p * (1 - p) / n)

red <- read.csv2("~/Desktop/Stat Methods/winequality-red.csv")
str(red)
head(red)

summary(red$residual.sugar)
median_sugar <- median(red$residual.sugar)
median_sugar

red <- read.csv("~/Desktop/Stat Methods/winequality-red.csv", sep = ";")

red$group <- ifelse(red$residual.sugar <= 2.2, "A (≤2.2)", "B (>2.2)")
boxplot(density ~ group, data = red,
        xlab = "Residual Sugar Group",
        ylab = "Density",
        col = c("lightblue", "lightgreen"))

t.test(density ~ group, data = red)


quantiles <- quantile(red$residual.sugar, probs = c(0.25, 0.5, 0.75))

red$group4 <- cut(red$residual.sugar,
                  breaks = c(-Inf, quantiles, Inf))

boxplot(density ~ group4, data = red,
        xlab = "Residual Sugar Group",
        ylab = "Density",
        col = c("lightblue", "lightgreen", "lightpink", "lightyellow"))

anova_result <- aov(density ~ group4, data = red)
summary(anova_result)


red$excellent <- ifelse(red$quality >= 7, 1, 0)
tbl <- table(red$group4, red$excellent)
chi <- chisq.test(tbl)
chi

set.seed(123)
B <- 10000

chi_obs <- chisq.test(tbl)$statistic
perm_stats <- replicate(B, {
  tbl_perm <- table(red$group4, sample(red$excellent))
  chisq.test(tbl_perm)$statistic
})
p_perm <- mean(perm_stats >= chi_obs)
p_perm
