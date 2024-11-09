import pandas as pd

num = 15
file_list = [f'PDW{i}分类统计结果.csv' for i in range(1,num+1)]
input_path = './result - 副本/'

result = pd.DataFrame()
for i in range(num):
    df = pd.read_csv(f'{input_path}{file_list[i]}', encoding='gb2312')

    new_index = len(df)
    df.loc[new_index] = [None] * len(df.columns)

    result = pd.concat([result, df])
result.to_csv('型号统计.csv' , encoding='gb2312',index=False)
