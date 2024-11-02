import itertools

import pandas as pd
from sklearn.cluster import KMeans
from sklearn.preprocessing import StandardScaler
import matplotlib.pyplot as plt


def kmeans_cluster(df,feature,radar_type,n):
    X = df[feature].copy()  # 特征
    X = StandardScaler().fit_transform(X)  # 标准化
    kmeans = KMeans(n_clusters=n)
    kmeans.fit(X)
    labels = kmeans.labels_.astype(str)

    centroids = kmeans.cluster_centers_

    df['labels'] = labels
    # df['雷达型号'] = labels['labels']
    # df = df.drop('labels', axis=1)  # 删除辅助列

    # 对'labels'列进行分组并计数
    label_counts = df['labels'].value_counts()
    # 找到出现次数最多的标签
    least_common_label = label_counts.idxmin()
    # 筛选出具有相同标签最多的数据
    # least_common_data = df[df['labels'] == least_common_label]
    # least_common_data['labels'] = radar_type

    df.iloc[df['labels'] == least_common_label,'labels'] = radar_type
    # df[df['labels'] == least_common_label]['labels'] = radar_type

    return df

def plot_edw(df,col_name,file):

    labels_list = sorted(df[col_name].unique())
    line_colors = ['red','blue','green','yellow']
    line_colors_cycle = itertools.cycle(line_colors)  # 创建一个线条宽度循环
    plt.figure(figsize=(40, 20))
    plt.title(f'{file}')
    for label in labels_list:
        df_sorted = df[df[col_name] == label]
        color = next(line_colors_cycle)
        # plt.figure(figsize=(40, 20))
        # plt.title(f'{file}')
        plt.plot(df_sorted['到达时间(s)'], df_sorted['到达角度'], '.',color=color,label=f'{label} 到达角度')
    plt.legend()
    plt.show()

def classifer(input_path,output_path,radar_type,file_list):
    df_concat = pd.DataFrame()

    for file in file_list:
        df = pd.read_csv(input_path + file, encoding='gb2312')
        df['source'] = file
        df_concat = pd.concat([df_concat, df], axis=0)

    # try:
    #     df_concat = kmeans_cluster(df_concat, ['脉冲宽度(s)'],radar_type, 2)
    # except:
    #     print(f'{file} 有缺失值')
    #     # return
    #     df_concat = df_concat.dropna()
    #     df_concat = kmeans_cluster(df_concat, ['脉冲宽度(s)'], radar_type, 2)

    df_concat = df_concat.dropna()
    df_concat = kmeans_cluster(df_concat, ['脉冲宽度(s)'], radar_type, 2)

    for file in file_list:
        df_single = df_concat[df_concat['source'] == file]
        df.drop('source', axis=1)

        # plot_edw(df_single,'频率(Hz)',file)

        #
        # df_single.to_csv(output_path + file, encoding='gb2312',index=False)
        # print(f'    {output_path}{file} done')

def add__columns(input_path,output_path,file_list):
    for file in file_list:
        new_columns = ['频率(Hz)', '到达时间(s)', '脉冲宽度(s)', '到达角度', '幅度']
        df = pd.read_csv(input_path + file, header=None, names=new_columns, encoding='gb2312')
        df.to_csv(output_path + file, encoding='gb2312',index=False)

# if __name__ == '__main__':
#
#     # path = './Train_data/UTF-8/'
#     input_path = './data_train/'
#     output_path = './result/'
#
#     df = pd.read_csv(input_path + 'Train_Taget.csv', encoding='gb2312')
#     # radar_types_list = sorted(df['雷达型号'].unique())
#     radar_types_list = [1]
#     print(radar_types_list)
#     for radar_type in radar_types_list:
#         df_radar = df[df['雷达型号'] == radar_type]
#         env_list = sorted(df_radar['场景'].unique())
#         file_list = ['PDW' + str(element) + '.csv' for element in env_list]#每个雷达型号对应的文件
#         classifer(file_list)


        # df_concat = pd.DataFrame()
        # for file in file_list:
        #     df = pd.read_csv(input_path + file, encoding='gb2312')
        #     df['source'] = file
        #     df_concat = pd.concat([df_concat, df], axis=0)





    # input_path = './data_train/'
    # output_path = './data_train/'
    # suffix = ''
    # file_list = [f'Train_PDW{i}' for i in range(1,51)]
    # df_concat = pd.DataFrame()
    # for file in file_list:
    #     df = pd.read_csv(input_path+file,encoding='gb2312')
    #     df['source'] = file
    #     df_concat = pd.concat([df_concat, df], axis=0)
    # df_concat = kmeans_cluster(df_concat,['频率(Hz)','脉冲宽度(s)','幅度'],2)
    #
    # df1 = df_concat[df_concat['source'] == file_list[0]]
    # df2 = df_concat[df_concat['source'] == file_list[1]]
    # df1.to_csv('1.csv', encoding='gb2312', index=False)
    # # df1.to_csv(f'{file}{suffix}.csv',encoding='gb2312',index=False)
    # df2.to_csv('21.csv',encoding='gb2312',index=False)