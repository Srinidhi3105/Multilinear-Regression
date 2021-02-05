startups <- read.csv(file.choose())
View(startups)

#encoding categorical data
startups$State=factor(startups$State,
                      levels = c('New York','California','Florida'),
                      labels=c(1,2,3))

#splitting into training set and test set
library(caTools)
set.seed(123)
split=sample.split(startups$Profit,SplitRatio = 0.8)
training_set=subset(startups,split==TRUE)
test_set=subset(startups,split==FALSE)

#fitting mlr to training set
regressor=lm(formula = Profit~.,
             data=training_set)

#predicting test set result
y_pred=predict(regressor,newdata = test_set)

#building optimal model
regressor=lm(formula = Profit~R.D.Spend + Administration+Marketing.Spend+State,
             data= startups)
summary(regressor)

#removing statistically insignificant variables
regressor=lm(formula = Profit~R.D.Spend + Administration+Marketing.Spend,
             data= startups)
summary(regressor)

regressor=lm(formula = Profit~R.D.Spend +Marketing.Spend,
             data= startups)
summary(regressor)

regressor=lm(formula = Profit~R.D.Spend ,
             data= startups)
summary(regressor)









