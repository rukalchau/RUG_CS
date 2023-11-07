from datetime import datetime
from chat2 import convert
from plotter_v2 import mylt

data = """2/11/2023, 11:36:35 AM GMT+1$IS

2/11/2023, 1:44:24 PM GMT+1$IS

2/11/2023, 7:13:21 PM GMT+1$IS

3/11/2023, 4:31:23 AM GMT+1$IS

3/11/2023, 6:11:54 AM GMT+1$IS

3/11/2023, 6:46:59 AM GMT+1$IS

3/11/2023, 7:19:10 AM GMT+1$IS

3/11/2023, 8:21:18 AM GMT+1$IS

3/11/2023, 9:54:53 AM GMT+1$IS

4/11/2023, 7:46:35 AM GMT+1$Python

4/11/2023, 10:10:42 AM GMT+1$Python

4/11/2023, 2:31:08 PM GMT+1$Python

4/11/2023, 3:01:51 PM GMT+1$Python

5/11/2023, 7:57:58 AM GMT+1$Python

5/11/2023, 3:24:54 PM GMT+1$Python

5/11/2023, 3:59:39 PM GMT+1$Python

7/11/2023, 9:29:12 AM GMT+1$Python

7/11/2023, 5:40:06 PM GMT+1$Convex OPT

7/11/2023, 6:13:30 PM GMT+1$Convex OPT

7/11/2023, 6:54:53 PM GMT+1$Convex OPT

7/11/2023, 11:03:08 PM GMT+1$Convex OPT

7/11/2023, 11:37:53 PM GMT+1$Convex OPT"""

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


List=[]
# Print the result
for entry in result:
    


    entry[0]=convert(entry[0])
    entry[0]=(str(datetime.fromtimestamp(entry[0]).date()))

print(result)
mylt(result)


