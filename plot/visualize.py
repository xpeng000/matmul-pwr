import matplotlib.pyplot as plt
import datetime

# Open the text file and read in the data
with open('data.txt', 'r') as f:
    lines = f.readlines()

# Split the lines into timestamp, x, and y values
def gen_plot(lines):
    timestamps = []
    x = []
    y = []
    for line in lines:
        vals = line.strip().split(',')
        timestamp_str = vals[0]
        x_val = float(vals[1])
        y_val = float(vals[2])
        timestamp = datetime.datetime.strptime(timestamp_str, '%Y/%m/%d %H:%M:%S.%f')
        timestamps.append(timestamp)
        x.append(x_val)
        y.append(y_val)

    # Create a plot
    plt.plot(timestamps, y)
    plt.xlabel('Timestamp')
    plt.ylabel('Power Consumption')
    plt.title('Power Consumption Over Time')
    plt.show()


if __name__ == "__main__":
    # Open the text file and read in the data
    with open('../data/gpu_pwr_naive_0_50_10_32 ', 'r') as f:
        lines = f.readlines()
    gen_plot(lines)