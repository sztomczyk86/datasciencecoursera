x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)


fit <- lm(y ~ x)
summary(fit)

bla1 <- data.frame(wt=c(mean(mtcars$wt)))
predict(fit2, newdata = bla1, interval="confidence")

confint(fit2)
sqrt(sum((fit$residuals)^2)/(length(fit$residuals)-2))
wt=3
fit2 <- lm(mpg ~ wt, mtcars)
summary(fit2)
predict(fit2, wt, interval="prediction")

wt=2
predict(fit2, wt, interval="confidence")

fit3 <- lm(mpg/100 ~ wt, mtcars)
summary(fit3)

bla <- (mtcars$wt- mean(mtcars$wt))
fit4 <- lm(mpg ~ wt - 1, mtcars)
summary(fit4)






## QUIZ3

require(datasets)
data(mtcars)

fit3.1 <- lm(mpg ~ factor(cyl) + wt, mtcars)
summary(fit3.1)

fit3.2 <- lm(mpg ~ factor(cyl), mtcars)
summary(fit3.2)

fit3.3 <- lm(mpg ~ factor(cyl) + wt + factor(cyl)*wt, mtcars)
summary(fit3.3)
anova(fit3.1, fit3.3)

lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)


x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
fit3.5 <- lm(y ~ x)
hatvalues(fit3.5)

influence.measures(fit3.5)


## QUIZ 4

data(shuttle)

shuttle %>% mutate(use1 = if_else(shuttle$use == "auto", 1, 0)) -> shuttle

fit <- glm(use1 ~ wind, shuttle, family = "binomial")

summary(fit)

fit2 <- glm(use1 ~ wind + magn, shuttle, family = "binomial")

summary(fit2)


data("InsectSprays")

fit3 <- glm()


x <- -5:5
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)

fit4 <- lm(y ~ x + x^2)
summary(fit4)
