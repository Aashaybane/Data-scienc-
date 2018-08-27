#importing the data
dataset =read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

install.packages('rpart')
library(rpart)

#fitting decision tree model
regressor = rpart(formula = Salary ~ .,
                  data = dataset,
                  control = rpart.control(minsplit = 1))

#predicting the value
y_pred = predict(regressor, data.frame(Level = 6.5))

#ploting decission tree in high resolution 

x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Decision Tree Regression)') +
  xlab('Level') +
  ylab('Salary')
  
              
  