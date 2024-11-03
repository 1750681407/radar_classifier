import pandas as pd
import warnings
from matplotlib import pyplot as plt
from sklearn.cluster import KMeans
from sklearn.preprocessing import StandardScaler

warnings.filterwarnings('ignore')
plt.rcParams['font.sans-serif'] = ['SimHei']  # 使用SimHei字体
plt.rcParams['axes.unicode_minus'] = False  # 正确显示负号
plt.rcParams.update({'font.size': 25})

if __name__ == '__main__':

    # path = './Train_data/UTF-8/'
    input_path = './result/'
    output_path = './result/'

    # df = pd.read_csv(input_path + 'Train_Taget.csv', encoding='gb2312')
    # radar_types_list = sorted(df['雷达型号'].unique())
    # radar_types_list = [i for i in range(2,3)]
    # radar_types_list = [1]
    # print(radar_types_list)

    # file_list = ['EDW2.csv','EDW16.csv']

    df_concat = pd.DataFrame()
    file = 'PDW3.csv'
    df = pd.read_csv(input_path + file, encoding='gb2312')
    df['source'] = file
    X = df[['脉冲宽度(s)','频率(Hz)']].copy()  # 特征
    # X = df[[ '频率(Hz)']].copy()  # 特征
    X = StandardScaler().fit_transform(X)  # 标准化
    kmeans = KMeans(n_clusters=6)
    kmeans.fit(X)
    labels = kmeans.labels_.astype(str)
    df['labels'] = labels
    df_concat = pd.concat([df_concat, df], axis=0)
    label_list = sorted(df['labels'].unique())

    plt.figure(figsize=(40, 20))
    for label in label_list:
        df_label = df[df['labels'] == label]
        plt.plot(df_label['到达时间(s)'], df_label['频率(Hz)'], '.', label=f'{label} 频率(Hz)')
    plt.legend(loc='upper right')  # 也可以使用 bbox_to_anchor 来微调位置
    plt.show()

    plt.figure(figsize=(40, 20))
    for label in label_list:
        df_label = df[df['labels'] == label]
        plt.plot(df_label['到达时间(s)'], df_label['脉冲宽度(s)'], '.', label=f'{label} 脉冲宽度(s)')
    plt.legend(loc='upper right')  # 也可以使用 bbox_to_anchor 来微调位置
    plt.show()

    plt.figure(figsize=(40, 20))
    for label in label_list:
        df_label = df[df['labels'] == label]
        plt.plot(df_label['到达时间(s)'], df_label['到达角度'], '.', label=f'{label} 到达角度')
    plt.legend(loc='upper right')  # 也可以使用 bbox_to_anchor 来微调位置
    plt.show()
