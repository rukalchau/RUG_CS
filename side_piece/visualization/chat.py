from datetime import datetime
from chat2 import convert


data = """2/11/2023, 11:36:35 AM GMT+1:IS
2/11/2023, 1:44:24 PM GMT+1$IS
2/11/2023, 7:13:21 PM GMT+1$IS
3/11/2023, 4:31:23 AM GMT+1$IS
3/11/2023, 6:11:54 AM GMT+1$IS
3/11/2023, 6:46:59 AM GMT+1$IS
3/11/2023, 7:19:10 AM GMT+1$IS
3/11/2023, 8:21:18 AM GMT+1$IS
3/11/2023, 9:54:53 AM GMT+1$IS"""

# Split the data into lines
lines = data.split('\n')
# Initialize an empty array to store the results
result = []

# Loop through each line to extract the time and event
for line in lines:
    parts = line.split('$')
    if len(parts) == 2:
        time = parts[0].strip()
        event = parts[1].strip()
        result.append([time, event])

# Print the result
for entry in result:
    entry[0]=convert(entry[0])
    print(entry)
