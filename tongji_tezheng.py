import pandas as pd

# 设置文件路径和编码
file_path = 'D:\\LeiDaXinHaoShiBie\\Train_data\\Train_data\\Train_PDW1航迹分类.csv'
encoding = 'gbk'
output_file_path = 'D:\\LeiDaXinHaoShiBie\\Train_data\\Train_data\\航迹分类1统计结果.csv'

# 读取 CSV 文件
data = pd.read_csv(file_path, encoding=encoding)

# 确保列名正确
print(data.columns)  # 打印列名以检查

# 进行分组统计
grouped = data.groupby('航迹num')

# 创建一个结果 DataFrame
results = pd.DataFrame(columns=['航迹num', '频率(Hz) 最大值', '频率(Hz) 最小值',
                                '频率(Hz) 平均值', '频率(Hz) 标准差',
                                '脉冲宽度(s) 最大值', '脉冲宽度(s) 最小值',
                                '脉冲宽度(s) 平均值', '脉冲宽度(s) 标准差',
                                '幅度 最大值', '幅度 最小值', '幅度 平均值', '幅度 标准差'])

# 遍历每个分组并计算最大值、最小值、平均值和标准差
for name, group in grouped:
    # 计算频率统计量
    max_freq = group['频率(Hz)'].quantile(0.95)  # 取95%分位数作为最大值
    min_freq = group['频率(Hz)'].quantile(0.05)  # 取5%分位数作为最小值
    avg_freq = group['频率(Hz)'].mean()  # 计算平均值
    std_freq = group['频率(Hz)'].std()  # 计算标准差

    # 计算脉冲宽度统计量
    max_width = group['脉冲宽度(s)'].quantile(0.95)  # 取95%分位数作为最大值
    min_width = group['脉冲宽度(s)'].quantile(0.05)  # 取5%分位数作为最小值
    avg_width = group['脉冲宽度(s)'].mean()  # 计算平均值
    std_width = group['脉冲宽度(s)'].std()  # 计算标准差

    # 计算幅度统计量
    max_amplitude = group['幅度'].quantile(0.95)  # 取95%分位数作为最大值
    min_amplitude = group['幅度'].quantile(0.05)  # 取5%分位数作为最小值
    avg_amplitude = group['幅度'].mean()  # 计算平均值
    std_amplitude = group['幅度'].std()  # 计算标准差

    # 将结果添加到 DataFrame 中
    results = results.append({
        '航迹num': name,
        '频率(Hz) 最大值': max_freq,
        '频率(Hz) 最小值': min_freq,
        '频率(Hz) 平均值': avg_freq,
        '频率(Hz) 标准差': std_freq,
        '脉冲宽度(s) 最大值': max_width,
        '脉冲宽度(s) 最小值': min_width,
        '脉冲宽度(s) 平均值': avg_width,
        '脉冲宽度(s) 标准差': std_width,
        '幅度 最大值': max_amplitude,
        '幅度 最小值': min_amplitude,
        '幅度 平均值': avg_amplitude,
        '幅度 标准差': std_amplitude
    }, ignore_index=True)

# 输出结果
print(results)

# 可选择将结果保存到新的 CSV 文件中
results.to_csv(output_file_path, index=False, encoding=encoding)
