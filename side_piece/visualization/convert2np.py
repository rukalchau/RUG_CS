import numpy as np

def con2np(data):
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

        print("Date vs. Event Frequency (2D array):")
        print(date_event_frequency)
