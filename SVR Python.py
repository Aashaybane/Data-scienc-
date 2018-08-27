# importing the libries

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#importing the dataset
dataset = pd.read_csv ('Position_Salaries.csv')
x = dataset.iloc[:,1:2].values
y = dataset.iloc[:, 2].values

#feature scalling 
from sklearn.preprocessing import StandardScaler
sc_x = StandardScaler()
sc_y = StandardScaler()
x = sc_x.fit_transform(x)
y = np.reshape(a=y, newshape=(-1,1))
y = sc_y.fit_transform(y)

#fitting the svr to data set
from sklearn.svm import SVR
regressor = SVR(kernel = 'rbf')
regressor.fit(x, y)

#predcting the value
y_prad = sc_y.inverse_transform(regressor.predict(sc_x.transform(np.array([[6.5]]))))

#visuliazing the result
plt.scatter(x,y, color = 'red')
plt.plot(x, regressor.predict(x), color = 'blue')
plt.title('triuth or bluff')
plt.xlabel('level')
plt.ylabel('salary')
plt.show()