clc;
% clear;
close all;

input_path = './data_train/';
file = 'PDW4.csv';
data = readmatrix(fullfile(input_path, file), 'Encoding', 'GB2312');
freq = data(:, 1);pulse_times = data(:, 2);width = data(:, 3);angle = data(:, 4);amplitude = data(:, 5);

figure; % 创建一个新的图形窗口
plot3(1:length(data), freq, angle, '.'); % 'o'表示使用圆圈标记每个点，你可以根据需要更改标记样式
% 添加标签和标题
xlabel('Pulse Times');
ylabel('Frequency');
zlabel('angle');
title('3D Plot of Pulse Times vs Frequency vs Angle');
% 启用网格
grid on;

input_path = './data_train/';
file = 'PDW5.csv';
data = readmatrix(fullfile(input_path, file), 'Encoding', 'GB2312');
freq = data(:, 1);pulse_times = data(:, 2);width = data(:, 3);angle = data(:, 4);amplitude = data(:, 5);

figure; % 创建一个新的图形窗口
plot3(1:length(data), freq, angle, '.'); % 'o'表示使用圆圈标记每个点，你可以根据需要更改标记样式
% 添加标签和标题
xlabel('Pulse Times');
ylabel('Frequency');
zlabel('angle');
title('3D Plot of Pulse Times vs Frequency vs Angle');
% 启用网格
grid on;
% x = input('输入区间');
% x = x*10^9


% num_bins = ceil(100); % bins可以根据数据调整
% [hist, bins] = histcounts(freq, num_bins);
% % 绘制直方图
% figure;
% bar(bins(1:end-1), hist, 'EdgeColor', 'black');
% xlabel('Pulse Interval');
% ylabel('Frequency');
% title('Histogram of freq');
% 
% input_path = './data_train/';
% file = 'PDW5.csv';
% data = readmatrix(fullfile(input_path, file), 'Encoding', 'GB2312');
% freq = data(:, 1);pulse_times = data(:, 2);width = data(:, 3);angle = data(:, 4);amplitude = data(:, 5);
% 
% figure; % 创建一个新的图形窗口
% plot3(pulse_times, freq, angle, '.'); % 'o'表示使用圆圈标记每个点，你可以根据需要更改标记样式
% % 添加标签和标题
% xlabel('Pulse Times');
% ylabel('Frequency');
% zlabel('angle');
% title('3D Plot of Pulse Times vs Frequency vs Angle');
% % 启用网格
% grid on;
% 
% num_bins = ceil(100); % bins可以根据数据调整
% [hist, bins] = histcounts(freq, num_bins);
% % 绘制直方图
% figure;
% bar(bins(1:end-1), hist, 'EdgeColor', 'black');
% xlabel('Pulse Interval');
% ylabel('Frequency');
% title('Histogram of freq');



% % 计算脉冲间隔
% pulse_intervals = diff(pulse_times);


% % 绘制脉冲间隔图
% figure;
% plot(1:numel(pulse_intervals), pulse_intervals, '.');
% xlabel('Index');
% ylabel('Pulse Interval');
% title('Pulse Intervals');
% legend('pulse_intervals');

% % 设置y轴刻度为0.01
% y_max = max(pulse_intervals); % 假设y是你的数据中的最大值
% yticks(0:0.01:y_max);