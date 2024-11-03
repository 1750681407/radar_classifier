import math

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
input_path = './result/'
file = 'PDW1.csv'
df = pd.read_csv(input_path + file, encoding='gb2312')

pulse_times = df['到达时间(s)']
# 计算脉冲间隔
pulse_intervals = np.diff(pulse_times)
# 统计直方图
# hist, bins = np.histogram(pulse_intervals, bins=int(math.sqrt(len(pulse_intervals))))  # bins可以根据数据调整
hist, bins = np.histogram(pulse_intervals, bins=int(len(pulse_intervals)//5))  # bins可以根据数据调整

# 绘制直方图
plt.bar(bins[:-1], hist, width=bins[1]-bins[0], edgecolor='black')
plt.xlabel('Pulse Interval')
plt.ylabel('Frequency')
plt.title('Histogram of Pulse Intervals 1')
plt.show()
# 设置门限
threshold = 5000  # 这个值需要根据实际情况调整
# 识别PRI
pri_indices = np.where(hist > threshold)[0]
pris = bins[pri_indices]
# 剔除PRI对应的脉冲序列
for pri in pris:
    pulses_to_remove = (pulse_times[:] % pri) == 0  # 假设PRI是周期性的
    pulse_times = pulse_times[~pulses_to_remove]

pulse_intervals = np.diff(pulse_times)
# 统计直方图
hist, bins = np.histogram(pulse_intervals, bins=int(math.sqrt(len(pulse_intervals))))  # bins可以根据数据调整
# 绘制直方图
plt.bar(bins[:-1], hist, width=bins[1]-bins[0], edgecolor='black')
plt.xlabel('Pulse Interval')
plt.ylabel('Frequency')
plt.title('Histogram of Pulse Intervals 2')
plt.show()
# 识别PRI
pri_indices = np.where(hist > threshold)[0]
pris = bins[pri_indices]
# 剔除PRI对应的脉冲序列
for pri in pris:
    pulses_to_remove = (pulse_times[:] % pri) == 0  # 假设PRI是周期性的
    pulse_times = pulse_times[~pulses_to_remove]

pulse_intervals = np.diff(pulse_times)
# 统计直方图
hist, bins = np.histogram(pulse_intervals, bins=int(math.sqrt(len(pulse_intervals))))  # bins可以根据数据调整
# 绘制直方图
plt.bar(bins[:-1], hist, width=bins[1]-bins[0], edgecolor='black')
plt.xlabel('Pulse Interval')
plt.ylabel('Frequency')
plt.title('Histogram of Pulse Intervals 3')
plt.show()




# hist, bins = np.histogram(pulse_intervals, bins=int(len(pulse_intervals)/10))  # bins可以根据数据调整
# hist, bins = np.histogram(pulse_intervals, bins=50)  # bins可以根据数据调整

# # 设置门限
# threshold = 10  # 这个值需要根据实际情况调整
#
# # 识别PRI
# pri_indices = np.where(hist > threshold)[0]
# pris = bins[pri_indices]
#
# # 剔除PRI对应的脉冲序列
# for pri in pris:
#     pulses_to_remove = (pulse_times[:-1] % pri) == 0  # 假设PRI是周期性的
#     pulse_times = pulse_times[~pulses_to_remove]

# 重复上述步骤，直到没有新的PRI被识别
# 这里需要一个循环来重复上述步骤，直到没有新的PRI被识别

# # 绘制直方图
# plt.bar(bins[:-1], hist, width=bins[1]-bins[0], edgecolor='black')
# plt.xlabel('Pulse Interval')
# plt.ylabel('Frequency')
# plt.title('Histogram of Pulse Intervals')
# plt.show()