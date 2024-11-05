clc;
% clear;
close all;

input_path = './data_train/';
file = 'PDW4.csv';
data = readmatrix(fullfile(input_path, file), 'Encoding', 'GB2312');
freq = data(:, 1);pulse_times = data(:, 2);width = data(:, 3);angle = data(:, 4);amplitude = data(:, 5);

figure; % ����һ���µ�ͼ�δ���
plot3(1:length(data), freq, angle, '.'); % 'o'��ʾʹ��ԲȦ���ÿ���㣬����Ը�����Ҫ���ı����ʽ
% ��ӱ�ǩ�ͱ���
xlabel('Pulse Times');
ylabel('Frequency');
zlabel('angle');
title('3D Plot of Pulse Times vs Frequency vs Angle');
% ��������
grid on;

input_path = './data_train/';
file = 'PDW5.csv';
data = readmatrix(fullfile(input_path, file), 'Encoding', 'GB2312');
freq = data(:, 1);pulse_times = data(:, 2);width = data(:, 3);angle = data(:, 4);amplitude = data(:, 5);

figure; % ����һ���µ�ͼ�δ���
plot3(1:length(data), freq, angle, '.'); % 'o'��ʾʹ��ԲȦ���ÿ���㣬����Ը�����Ҫ���ı����ʽ
% ��ӱ�ǩ�ͱ���
xlabel('Pulse Times');
ylabel('Frequency');
zlabel('angle');
title('3D Plot of Pulse Times vs Frequency vs Angle');
% ��������
grid on;
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