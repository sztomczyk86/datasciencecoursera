library(tidyverse)

set.seed(666)
n <- 1000
lambda <- 0.2

s.mean = NULL
for (i in 1 : n) {
        
        s.mean <- c(s.mean, mean(rexp(40, lambda)))
        
}

1/lambda
mean(s.mean)

(1/lambda/sqrt(40))^2
var(s.mean)


plot <- ggplot() + 
        geom_histogram(aes(s.mean), bins = 60, 
                       colour = "black", fill = "lightblue") + 
        geom_vline(aes(xintercept=c(1/lambda, mean(s.mean))),  
                   color=c("red","green"), linetype="dashed", size=1)+ 
        xlab("Mean") + ylab("Frequency")
plot
shapiro.test(s.mean)




(data("ToothGrowth"))   



ggplot(ToothGrowth, aes(x = as.factor(dose), y = len)) +
        geom_boxplot(aes(fill=supp)) +
        scale_fill_manual(values=c("#56B4E9", "#E69F00"))+
        facet_wrap(.~supp)+
        labs(title = "Lenght of odontoblasts by the dose of Vitamic C") +
        xlab("Dose (mg/day)") +
        ylab("Length of odontoblasts") +
        theme(legend.position = "none") 
        

t.test(ToothGrowth$len ~ ToothGrowth$supp)

ToothGrowth.sub <- filter(ToothGrowth, dose  %in% c(.5, 2))
t.test(ToothGrowth.sub$len ~ ToothGrowth.sub$dose)

