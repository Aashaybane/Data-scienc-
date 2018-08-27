#importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#fitting randomforestregressor
install.packages("randomForest")
library(randomForest)

set.seed(1234)
regressor = randomForest(x = dataset[1],
                         y = dataset$Salary,
                         ntree = 500)
#predicting the values
y_prad = predict(regressor, data.frame(Level = 6.5))


#ploting the data
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot()+
  geom_point(aes(x = dataset$Level, y = dataset$Salary ),
             color = 'red')+
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            color = 'blue')+
  ggtitle('truth or bluff(random forest)')+
  xlab('level')+
  ylab('salary')