library(tidyverse)
library(GGally)


data(mtcars)

mtcars[,c(2, 8:11)] <- lapply(mtcars[,c(2, 8:11)], as.factor) 

fit.all <- lm(mpg ~., mtcars)
summary(fit.all)
vif(fit.all)

fit1 <- lm(mpg ~ am, mtcars)
fit2 <- lm(mpg ~ am + cyl + hp, mtcars)
fit3 <- lm(mpg ~ am + cyl + hp + wt, mtcars)
fit4 <- lm(mpg ~ am + cyl + hp + wt + vs, mtcars)
fit5 <- lm(mpg ~ am + cyl + hp + wt + vs + gear, mtcars)
fit6 <- lm(mpg ~ am + cyl + hp + wt + vs + gear + carb, mtcars)
anova(fit1, fit2, fit3, fit4, fit5, fit6, fit.all)

vif(fit3)
summary(fit3)
summary(fit3)$coef
summary(fit3)

par(mfrow = c(2,3))
plot(fit3.1, which=1:6)

shapiro.test(fit3$residuals)

influence.measures(fit3.1)
dfbeta(fit3)

mtcars %>% ggplot(aes(am, mpg)) +
        geom_boxplot(aes(fill = am))

t.test(mpg ~ am, mtcars)


mtcars %>% select(mpg, am, cyl, hp, wt) %>% 
        ggpairs(mapping = ggplot2::aes(color = am),
                lower = list(continuous = wrap("smooth", alpha = 0.8, size=0.5), 
                             discrete = "blank", combo="blank"), 
                        diag = list(discrete="barDiag",
                                    continuous = wrap("densityDiag", alpha=0.5 )),
                upper = list(combo = wrap("box_no_facet", alpha=0.5),
                             continuous = wrap("cor", size=4, alignPercent=0.8)))


summary(step(lm(data = mtcars, mpg ~.), direction = "both", trace=0))
