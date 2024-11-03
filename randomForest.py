import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score
from collections import Counter
# 读取训练集和测试集
train_df = pd.read_csv('训练集6.csv', encoding='gbk')
test_df = pd.read_csv('测试集6.csv', encoding='gbk')

# 定义特征和标签
X_train = train_df.drop(['型号', '航迹num'], axis=1)
y_train = train_df['型号']

X_test = test_df.drop(['型号', '航迹num'], axis=1)

# 划分训练集和验证集（可选，仅用于检查模型效果）
# X_train, X_val, y_train, y_val = train_test_split(X_train, y_train, test_size=0.2, random_state=42)

# 定义随机森林分类器
clf = RandomForestClassifier(n_estimators=100000, random_state=42)

# 训练模型
clf.fit(X_train, y_train)

# 对测试集进行分类测试
y_pred = clf.predict(X_test)

# 将预测结果写入表格
output_df = test_df.copy()
output_df['型号'] = y_pred

# 保存到CSV文件
output_df.to_csv('预测结果.csv', index=False)

# 如果需要验证模型效果（可选），可以取消注释以下代码
# y_val_pred = clf.predict(X_val)
# accuracy = accuracy_score(y_val, y_val_pred)
# print(f'模型验证准确率: {accuracy:.2f}')

# 按场景分组并统计预测结果
scene_counts = [7, 6, 7, 8, 7, 7, 8, 7, 8, 7]
scenes = []
for i, count in enumerate(scene_counts, start=1):
    # 注意：这里我们不再需要output_df，因为y_pred已经包含了预测结果
    # 我们只需要根据scene_counts来切片y_pred即可
    scene_preds = y_pred[sum(scene_counts[:i - 1]):sum(scene_counts[:i])]
    model_counts = Counter(scene_preds)
    sorted_model_counts = sorted(model_counts.items(), key=lambda x: int(x[0]))
    scene_result = f"{i}\t{','.join(f'{model}({count})' for model, count in sorted_model_counts)}"
    scenes.append(scene_result)

# 写入txt文件
with open('预测结果.txt', 'w', encoding='utf-8') as f:
    f.write('场景\t型号识别结果：型号（个数）\n')  # 注意这里的tab键是用\t表示的
    for scene in scenes:
        f.write(scene + '\n')

print("预测结果已写入'预测结果.txt'")