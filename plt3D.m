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

% % ����������
% pulse_intervals = diff(pulse_times);
% % pulse_intervals = [0 pulse_intervals];
% pulse_intervals(end+1) = 0;
% % pulse_intervals = pulse_intervals*100000;
% 
% % ����������ͼ
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

% % ����PCA
% [coeff, score, ~, ~, explained] = pca([width,angle,amplitude]);
% % ��һ�����ɷ���ԭʼ�������������
% combinedVariable = score(:,3); % ȡ��һ�����ɷ���Ϊ��ά��Ľ��
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












































% x = input('��������');
% x = x*10^9


% num_bins = ceil(100); % bins���Ը������ݵ���
% [hist, bins] = histcounts(freq, num_bins);
% % ����ֱ��ͼ
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
% figure; % ����һ���µ�ͼ�δ���
% plot3(pulse_times, freq, angle, '.'); % 'o'��ʾʹ��ԲȦ���ÿ���㣬����Ը�����Ҫ���ı����ʽ
% % ��ӱ�ǩ�ͱ���
% xlabel('Pulse Times');
% ylabel('Frequency');
% zlabel('angle');
% title('3D Plot of Pulse Times vs Frequency vs Angle');
% % ��������
% grid on;
% 
% num_bins = ceil(100); % bins���Ը������ݵ���
% [hist, bins] = histcounts(freq, num_bins);
% % ����ֱ��ͼ
% figure;
% bar(bins(1:end-1), hist, 'EdgeColor', 'black');
% xlabel('Pulse Interval');
% ylabel('Frequency');
% title('Histogram of freq');



% % ����������
% pulse_intervals = diff(pulse_times);


% % ����������ͼ
% figure;
% plot(1:numel(pulse_intervals), pulse_intervals, '.');
% xlabel('Index');
% ylabel('Pulse Interval');
% title('Pulse Intervals');
% legend('pulse_intervals');

% % ����y��̶�Ϊ0.01
% y_max = max(pulse_intervals); % ����y����������е����ֵ
% yticks(0:0.01:y_max);