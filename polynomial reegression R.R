#importing the dataset 

dataset =  read.csv
dataset = dataset[2:3]


#fitting the linear model
lin_reg = lm(formula = Salary ~.,
             data = dataset)

dataset$level2 = dataset$Level^2
dataset$level3 = dataset$Level^3
dataset$level4 = dataset$Level^4
poly_reg = lm(formula = Salary ~ .,
              data = dataset)

#visuling the linear regression 
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             color = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)),
            color = 'blue')+
  ggtitle('truth or bluff(linear regression )')+
  xlab('level')
ylab('Salary')

#visuling the polynomial regression
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             color = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)),
            color = 'blue')+
  ggtitle('truth or bluff(poly regression )')+
  xlab('level')
ylab('Salary')