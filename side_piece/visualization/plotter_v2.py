import numpy as np
import matplotlib.pyplot as plt

# Sample data (replace this with your actual data)
def mylt(data):

    # Extract dates and events into separate lists
    dates = [entry[0] for entry in data]
    events = [entry[1] for entry in data]

    # Get unique dates and unique events
    unique_dates = np.unique(dates)
    unique_events = np.unique(events)

    # Initialize a 2D numpy array to store date vs. event frequency
    date_event_frequency = np.zeros((len(unique_dates), len(unique_events)), dtype=int)

    # Fill in the date vs. event frequency in the 2D array
    for i, date in enumerate(unique_dates):
        for j, event in enumerate(unique_events):
            count = np.sum(np.logical_and(np.array(dates) == date, np.array(events) == event))
            date_event_frequency[i, j] = count

    date_event_frequency=0.25*date_event_frequency.astype("float64")
    # Create a stacked bar chart
    fig, ax = plt.subplots()
    width = 0.35
    x = np.arange(len(unique_dates))
    bottom=np.zeros(len(x))

    for i, event in enumerate(unique_events):
        plt.bar(x, date_event_frequency[:, i], width=0.1, label=event,bottom=bottom)
        bottom+=np.array(date_event_frequency[:,i])

    # Add labels and legend
    ax.set_xlabel('Date')
    ax.set_ylabel('Hours')
    ax.set_title('Date vs. Event Frequency (Stacked Bar Chart)')
    ax.set_xticks(x)
    ax.set_xticklabels(unique_dates, rotation=45)
    plt.legend()

    # Show the chart
    plt.tight_layout()
    plt.show()
