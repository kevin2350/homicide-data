import pandas as pd

with open('original_data.csv', 'r') as f:
    lines = f.readlines()
    
with open('homicide_weapons_2021.csv', 'w') as f:
    lines[8] = lines[8].replace(', 2021', '')
    lines = lines[8:-5]
    print(lines)
    for line in lines:
        line = line.replace(',\n', ',0\n') ## replace empty values with 0
        while ',,' in line:
            line = line.replace(',,', ',0,') ## replace empty values with 0
        f.write(line)

df = pd.read_csv('homicide_weapons_2021.csv')
#print(df.iloc[:4, :5])