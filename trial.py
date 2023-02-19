import pandas as pd
import glob

path = r'/Users/gonzalovaldenebro/Library/CloudStorage/OneDrive-DrakeUniversity/STAT 190/Project 1/Data/Active_Power' 
all_files = glob.glob(path + "/*.csv")

column_names = ['Turbine Name', 'Timestamp', 'Date', 'KwPerHour', 'Sensor Name'] 

list = []
for filename in all_files:
    df = pd.read_csv(filename, header=None, names=column_names)
    list.append(df)

frame = pd.concat(list, axis=0, ignore_index=True)
frame.to_csv('active_power.csv', index=False)



