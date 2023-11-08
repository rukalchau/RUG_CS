from datetime import datetime
from chat2 import convert
from plotter_v2 import mylt

my_file = open("studylog.txt", "r")
data=(my_file.read())


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


