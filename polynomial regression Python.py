#importing the data
#import numpy as np 
import pandas as pd 
import matplotlib.pyplot as plt

dataset = pd.read_csv('Position_Salaries.csv')
x = dataset.iloc[:,1:2].values
y = dataset.iloc[:, 2].values

#linear regression 
from sklearn.linear_model import LinearRegression
lin_reg = LinearRegression(0)
lin_reg.fit(x,y)
#fiting polynomial regression to linear regression 

from sklearn.preprocessing import PolynomialFeatures
poly_reg = PolynomialFeatures(degree = 4)
x_poly = poly_reg.fit_transform(x)
lin_reg_2 = LinearRegression()
lin_reg_2.fit(x_poly, y)

#visulizing the linear model
plt.scatter(x, y, Color = 'red')
plt.plot(x, lin_reg.predict(x), color = 'blue' )
plt.title('truth or bluff(linear regression)')
plt.xlabel('position level')
plt.ylabel('salary')
plt.show()

#visulizing the polynomial model
x_grid = np.arange(min(x), max(x), 0.1)
x_grid = x_grid.reshape((len(x_grid), 1))

plt.scatter(x, y, Color = 'red')
plt.plot(x_grid, lin_reg_2.predict(poly_reg.fit_transform(x_grid)), color = 'blue' )
plt.title('truth or bluff(Polynomial regression)')
plt.xlabel('position level')
plt.ylabel('salary')
plt.show()

# prediction using linear regression 
lin_reg.predict(6.5)


#prediction using polynomial regression 
lin_reg_2.predict(poly_reg.fit_transform(6.5))
