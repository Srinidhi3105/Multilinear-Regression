computer <- read.csv(file.choose())
View(computer)

library(caTools)
set.seed(123)

computer$cd=factor(computer$cd,
                   levels=c('yes','no'),
                   labels=c(1,2))


computer$multi=factor(computer$multi,
                      levels=c('yes','no'),
                      labels=c(1,2))

computer$premium=factor(computer$premium,
                        levels=c('yes','no'),
                        labels=c(1,2))


library(caTools)
set.seed(123)
split=sample.split(computer$price,SplitRatio = 0.8)
training_set=subset(computer,split==TRUE)
test_set=subset(computer,split==FALSE)


regressor=lm(formula = price~.,
             data=training_set)
y_pred=predict(regressor,newdata=test_set)
