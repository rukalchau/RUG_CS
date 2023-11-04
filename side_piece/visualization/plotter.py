import matplotlib.pyplot as plt
import numpy as np


n_bins = 20
x = [[1,2,3],
     [3,4,5],
     [7,7,7]]
print(x)


plt.hist(x, n_bins, density=True, histtype='bar', stacked=True)
plt.title('Stacked Bar Histogram')
plt.show()


