import matplotlib.pyplot as plt
import numpy as np

def data_plt(x):

    n_bins = 5

    plt.hist(x, n_bins, density=True, histtype='bar', stacked=True)
    plt.title('Study Time Histogram')
    plt.show()


