import pandas as pd
import warnings
from sub_func import classifer, add__columns
warnings.filterwarnings('ignore')

if __name__ == '__main__':

    # path = './Train_data/UTF-8/'
    input_path = './result/'
    output_path = './result/'

    df = pd.read_csv(input_path + 'Train_Taget.csv', encoding='gb2312')
    radar_types_list = sorted(df['雷达型号'].unique())
    radar_types_list = [i for i in range(2,3)]
    print(radar_types_list)

    # file_list = ['PDW' + str(element) + '.csv' for element in range(1,31)]  # 每个雷达型号对应的文件
    # add__columns(input_path,output_path,file_list)

    for radar_type in radar_types_list:
        df_radar = df[df['雷达型号'] == radar_type]
        env_list = sorted(df_radar['场景'].unique())
        n = df_radar
        file_list = ['PDW' + str(element) + '.csv' for element in env_list]#每个雷达型号对应的文件
        print(f'{radar_type}:{file_list}')
        classifer(input_path,output_path,radar_type,file_list)