import itertools

import pandas as pd
from matplotlib import pyplot as plt
import warnings
warnings.filterwarnings('ignore')
plt.rcParams['font.sans-serif'] = ['SimHei']  # 使用SimHei字体
plt.rcParams['axes.unicode_minus'] = False  # 正确显示负号
plt.rcParams.update({'font.size': 25})

path = './result/'
file_list = ['PDW2.csv','PDW16.csv']
# encoding = 'GB18030'
encoding = 'gb2312'
# encoding = 'UTF-8'
# df = pd.read_csv(file_path, encoding=encoding)
# X = df[['频率(Hz)','脉冲宽度(s)','到达角度','幅度']]
# X = df[['频率(Hz)']]
# for file in file_list:
#     df = pd.read_csv(path+file, encoding=encoding)
#     plt.figure(figsize=(40, 20))
#     plt.title(f'{file}')
#     plt.plot(df['到达时间(s)'], df['到达角度'], '.', label=f'到达角度')
#     # plt.legend()
#     plt.legend(loc='upper right')  # 也可以使用 bbox_to_anchor 来微调位置
#     plt.show()

# plt.figure(figsize=(40, 20))
# plt.title(f'1 and 21')

result = pd.DataFrame()
for file in file_list:
    df = pd.read_csv(path+file, encoding=encoding)


    # line_styles = ['-', '--', '-.', ':']  # 实线，虚线，点划线，点线
    # line_style_cycle = itertools.cycle(line_styles)  # 创建一个线条样式循环
    # line_widths = [1, 2, 3, 4]  # 线条宽度列表
    # line_width_cycle = itertools.cycle(line_widths)  # 创建一个线条宽度循环

    # line_colors = ['red','blue','green','yellow']
    # line_colors_cycle = itertools.cycle(line_colors)  # 创建一个线条宽度循环
    #
    # plt.figure(figsize=(40, 20))
    # plt.title(f'{file}')
    #
    # color = next(line_colors_cycle)
    # plt.plot(df['到达时间(s)'], df['到达角度'], '.', color=color, label=f'{file} 到达角度')
    #
    # plt.legend()
    # plt.show()

    # labels_list = sorted(df['labels'].unique())
    # plt.figure(figsize=(40, 20))
    # plt.title(f'{file}')
    # for label in labels_list:
    #     df_sorted = df[df['labels'] == label]
    #     # plt.plot(df['到达时间(s)'], df['到达角度'], '.', label=f'到达角度')
    #     # result = pd.concat([result, df])
    #
    #     # line_style = next(line_style_cycle)
    #     # line_width = next(line_width_cycle)
    #     color = next(line_colors_cycle)
    #
    #     # plt.figure(figsize=(40, 20))
    #     # plt.title(f'{file}')
    #     # plt.plot(df['到达时间(s)'], df['到达角度'],line_style =line_style, label=f'到达角度',linewidth=line_width)
    #     plt.plot(df_sorted['到达时间(s)'], df_sorted['到达角度'], '.',color=color,label=f'{label} 到达角度')
    #     # plt.legend(loc='upper right')
    # plt.legend()
    # plt.show()

    plt.figure(figsize=(40, 20))
    plt.title(f'{file}')
    plt.plot(df['到达时间(s)'], df['频率(Hz)'], '.', label=f'频率(Hz)')
    # plt.legend()
    plt.legend(loc='upper right')  # 也可以使用 bbox_to_anchor 来微调位置
    plt.show()

    plt.figure(figsize=(40, 20))
    plt.title(f'{file}')
    plt.plot(df['到达时间(s)'], df['脉冲宽度(s)'], '.', label=f'脉冲宽度(s)')
    # plt.legend()
    plt.legend(loc='upper right')  # 也可以使用 bbox_to_anchor 来微调位置
    plt.show()

    # plt.figure(figsize=(40, 20))
    # plt.title(f'{file}')
    # plt.plot(df['到达时间(s)'], df['幅度'], '.', label=f'幅度')
    # # plt.legend()
    # plt.legend(loc='upper right')  # 也可以使用 bbox_to_anchor 来微调位置
    # plt.show()




# print(result)


# plt.legend(loc='upper right')  # 也可以使用 bbox_to_anchor 来微调位置
# plt.show()



# # 定义DBSCAN模型
# dbscan = DBSCAN()
# # 定义参数网格
# param_grid = {
#     'eps': np.linspace(0.1, 1, 20),
#     'min_samples': range(2, 10)
# }
# # 定义网格搜索
# grid = GridSearchCV(dbscan, param_grid, cv=5, scoring=' silhouette_score')
#
# # 执行网格搜索
# grid.fit(X)
#
# # 打印最佳参数
# print(f"Best params: {grid.best_params_}")


# from sklearn.preprocessing import MinMaxScaler
# scaler = MinMaxScaler()
# X = pd.DataFrame(scaler.fit_transform(X), columns=X.columns)

# # 计算每个点到其第4个最近邻点的距离
# neigh = NearestNeighbors(n_neighbors=5)
# neigh.fit(X)
# distances, indices = neigh.kneighbors(X)
#
# # 提取第4个最近邻点的距离
# distances = distances[:, -1]
# distances = np.sort(distances)
# plt.plot(distances)
# plt.title('K-Distance Plot')
# plt.xlabel('Data Points sorted by distance')
# plt.ylabel('Epsilon')
# plt.show()



# X = X.values.reshape(-1, 1)
# dbscan_model = DBSCAN(eps=60, min_samples=20)
# clusters = dbscan_model.fit_predict(X)
# print(Counter(clusters))
# df['cluster'] = clusters
# print(clusters)
