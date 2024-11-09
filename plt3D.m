% clc;
% clear;
% close all;

% input_path = './data_train/';
% file = 'PDW1.csv';
% data = readmatrix(fullfile(input_path, file), 'Encoding', 'GB2312');
% freq = data(:, 1);pulse_times = data(:, 2);width = data(:, 3);angle = data(:, 4);amplitude = data(:, 5);
% fig = figure('Name', file);
% plot3(1:length(data), freq, angle, '.');
% xlabel('Pulse Times');
% ylabel('Frequency');
% zlabel('angle');
% title('3D Plot of Pulse Times vs Frequency vs Angle');
% grid on;

input_path = './data_train/';
file = 'PDW20.csv';
data = readmatrix(fullfile(input_path, file), 'Encoding', 'GB2312');
data = data(P204203(:,1),:);
freq = data(:, 1);
angle = data(:, 4);
fig = figure('Name', file);
plot3(1:length(data), freq, angle, '.');
xlabel('Pulse Times');
ylabel('Frequency');
zlabel('angle');
title('3D Plot of Pulse Times vs Frequency vs Angle');
grid on;





% file = 'PDW28.csv';
% data = readmatrix(fullfile(input_path, file), 'Encoding', 'GB2312');
% freq = data(:, 1);pulse_times = data(:, 2);width = data(:, 3);angle = data(:, 4);amplitude = data(:, 5);
% fig = figure('Name', file);
% plot3(1:length(data), freq, angle, '.');
% xlabel('Pulse Times');
% ylabel('Frequency');
% zlabel('angle');
% title('3D Plot of Pulse Times vs Frequency vs Angle');
% grid on;

% % 计算脉冲间隔
% pulse_intervals = diff(pulse_times);
% % pulse_intervals = [0 pulse_intervals];
% pulse_intervals(end+1) = 0;
% % pulse_intervals = pulse_intervals*100000;
% 
% % 绘制脉冲间隔图
% figure;
% plot(1:numel(pulse_intervals), pulse_intervals, '.');
% xlabel('Index');
% ylabel('Pulse Interval');
% title('Pulse Intervals');
% legend('pulse_intervals');
% 
% freq = data(:, 1);pulse_times = data(:, 2);width = data(:, 3);angle = data(:, 4);amplitude = data(:, 5);
% fig = figure('Name', file);
% plot3(pulse_intervals, freq, angle, '.');
% xlabel('Pulse Times');
% ylabel('Frequency');
% zlabel('angle');
% title('3D Plot of Pulse Times vs Frequency vs Angle');
% grid on;

% fig = figure('Name', file);
% plot3(amplitude, freq, width, '.');
% xlabel('amplitude');
% ylabel('Frequency');
% zlabel('width');
% title('3D Plot of amplitude vs Frequency vs width');
% grid on;
% fig = figure('Name', file);
% plot3(1:length(data), freq, amplitude, '.');
% xlabel('Pulse Times');
% ylabel('Frequency');
% zlabel('amplitude');
% title('3D Plot of Pulse Times vs Frequency vs amplitude');
% grid on;

% file = 'PDW28.csv';
% data = readmatrix(fullfile(input_path, file), 'Encoding', 'GB2312');
% freq = data(:, 1);pulse_times = data(:, 2);width = data(:, 3);angle = data(:, 4);amplitude = data(:, 5);
% fig = figure('Name', file);
% plot3(1:length(data), freq, angle, '.');
% xlabel('Pulse Times');
% ylabel('Frequency');
% zlabel('angle');
% title('3D Plot of Pulse Times vs Frequency vs Angle');
% grid on;

% fig = figure('Name', file);
% plot3(1:length(data), freq, amplitude, '.');
% xlabel('Pulse Times');
% ylabel('Frequency');
% zlabel('amplitude');
% title('3D Plot of Pulse Times vs Frequency vs amplitude');
% grid on;


% fig = figure('Name', file);
% plot3(1:length(data), freq, amplitude, '.');
% xlabel('Pulse Times');
% ylabel('Frequency');
% zlabel('amplitude');
% title('3D Plot of Pulse Times vs Frequency vs amplitude');
% grid on;

% fig = figure('Name', file);
% plot3(1:length(data), width, angle, '.');
% xlabel('Pulse Times');
% ylabel('width');
% zlabel('angle');
% title('3D Plot of Pulse Times vs angle vs width');
% grid on;

% % 进行PCA
% [coeff, score, ~, ~, explained] = pca([width,angle,amplitude]);
% % 第一个主成分是原始变量的线性组合
% combinedVariable = score(:,3); % 取第一个主成分作为降维后的结果
% fig = figure('Name', file);
% plot3(1:length(data), freq, combinedVariable, '.');
% xlabel('Pulse Times');
% ylabel('Frequency');
% zlabel('angle');
% title('3D Plot of Pulse Times vs Frequency vs Angle');
% grid on;


% % 
% % input_path = './data_train/';
% % file = 'PDW30.csv';
% % data = readmatrix(fullfile(input_path, file), 'Encoding', 'GB2312');
% % freq = data(:, 1);pulse_times = data(:, 2);width = data(:, 3);angle = data(:, 4);amplitude = data(:, 5);
% % fig = figure('Name', file);
% % plot3(1:length(data), freq, angle, '.'); 
% % xlabel('Pulse Times');
% % ylabel('Frequency');
% % zlabel('angle');
% % title('3D Plot of Pulse Times vs Frequency vs Angle');
% % grid on;
% % fig = figure('Name', file);
% % plot3(1:length(data), freq, amplitude, '.');
% % xlabel('Pulse Times');
% % ylabel('Frequency');
% % zlabel('amplitude');
% % title('3D Plot of Pulse Times vs Frequency vs amplitude');
% % grid on;












































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