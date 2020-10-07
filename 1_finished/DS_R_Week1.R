library(swirl)

hw1 <- read.csv(file="hw1_data.csv")
hw1[1:2,]

nrow(hw1)
tail(hw1, n=2)

hw1$Ozone[47]

table(hw1$Ozone)
missing <- is.na(hw1$Ozone)
table(missing)
mean(hw1$Ozone[!missing])

sub <- hw1$Solar.R[hw1$Ozone > 31 & hw1$Temp > 90]

bla <- is.na(sub)

mean(sub[!bla])

june <- hw1$Month == 6

mean(hw1$Temp[june],na.rm = T)

may <- hw1$Month == 5

max(hw1$Ozone[may], na.rm = T)

x <- 1:4 
y <- 2:3
x+y
