#importing the dataset

dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#fitting the SVR
install.packages('e1071')
library(e1071)
regressor = svm(formula = Salary ~ . ,
                data = dataset,
                type = 'eps-regression')

#predicting the new value

y_prad = predict(regressor, data.frame(Level = 6.5))

#visuling the SVR

library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Regression Model)') +
  xlab('Level') +
  ylab('Salary')
  

  
  
