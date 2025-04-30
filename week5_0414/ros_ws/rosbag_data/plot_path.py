import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import os

# Read position_only.csv file from current directory
script_dir = os.path.dirname(os.path.abspath(__file__))
file_path = os.path.join(script_dir, "hw3_extract.csv")

# Read CSV file
df = pd.read_csv(file_path)

# Check column names and extract data
print("CSV file columns:", df.columns.tolist())

# First column is time, second is x position, third is y position
time_col = df.columns[0]  # '%time' or first column
x_col = df.columns[1]     # 'field.pose.pose.position.x' or second column
y_col = df.columns[2]     # 'field.pose.pose.position.y' or third column

# Convert time data to seconds
time_ns = df[time_col].values
time_sec = time_ns / 1e9
time_sec = time_sec - time_sec[0]  # Set first time to 0

# x and y coordinates
x = df[x_col].values
y = df[y_col].values

# Initial position
x0 = x[0]
y0 = y[0]

# Calculate distance traveled (Euclidean distance)
distance = np.sqrt((x - x0)**2 + (y - y0)**2)

# Create plot
plt.figure(figsize=(10, 6))
plt.plot(time_sec, distance, 'b-', linewidth=2)
plt.xlabel('Time (seconds)')
plt.ylabel('Distance (meters)')
plt.title('Robot Distance Traveled Over Time')
plt.grid(True)

# Save and display
save_path = os.path.join(script_dir, "hw3.png")
plt.savefig(save_path)
plt.show()

print(f"Plot saved to {save_path}")