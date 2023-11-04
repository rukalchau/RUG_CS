import matplotlib.pyplot as plt
import numpy as np

def data_plt(x,date):


    fig, ax = plt.subplots()

    plt.hist(x,date,density=True, histtype='bar', stacked=True)
    plt.title('Study Time Histogram')
    plt.show()


