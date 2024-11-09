clc;
clear;
close all;
files = dir('.\data_train\*.csv');
for i = 1:length(files)
    
    filePath = fullfile('.\data_train', files(i).name);
% x = importdata('.\data_train\PDW8.csv');    %数据读取
    x = importdata(filePath);    %数据读取
    idx = x(:,4)>60;
    x = x(idx,:);

    x = [x,x,x];            %列
    x(:,11:15) = x(:,1:5);
    x(:,1) = x(:,1)*1e-9;               % 归一化处理
    x(:,1) = round(x(:,1)*1e4)*1e-4;
    x(:,3) = x(:,3)*1e6;
    x(:,6:10) = 0;

    idx = x(:,6) == 0;
    cnt = 101;
    while sum(idx)>0
        x1 = x(idx,:);
        n1 = mode(x1(:,1));             % 找出现最多的频率
        idx2 = x1(:,1)>n1-0.0005 & x1(:,1)<n1+0.0005;
        x1(idx2,6) = cnt;
        x(idx,:) = x1;

        cnt = cnt + 1;
        idx = x(:,6) == 0;
        sum(idx);
    end

    idx = x(:,7) == 0;
    cnt = 1;
    while sum(idx)>0
        x1 = x(idx,:);
        n1 = x1(1,3);
        idx2 = x1(:,3)>n1-0.2 & x1(:,3)<n1+0.2;
        x1(idx2,7) = cnt;
        x(idx,:) = x1;

        cnt = cnt + 1;
        idx = x(:,7) == 0;
        sum(idx);
    end

    cnt1 = unique(x(:,6));

%     figure; 
%     for i1 = 1:length(cnt1)
%         idx = x(:,6) == cnt1(i1);
%         x1 = x(idx,:);
%         plot(x1(:,2),x1(:,1),'.'); hold on;
%     end
% 
%     cnt1 = unique(x(:,7));
% 
%     figure; 
%     for i1 = 1:length(cnt1)
%         idx = x(:,7) == cnt1(i1);
%         x1 = x(idx,:);
%         plot(x1(:,2),x1(:,3),'.'); hold on;
%     end

    idx = x(:,9) == 0;                  %对时间区间进行均值取证
    while sum(idx)>0
        x1 = x(idx,:);
        n1 = x1(1,2);
        idx2 = x1(:,2)>n1-0.1 & x1(:,2)<n1+0.1;
        n2 = x1(idx2,2);
        n2 = round(mean(n2)*10)/10;
        x1(idx2,9) = n2;
        x(idx,:) = x1;

        idx = x(:,9) == 0;
        sum(idx);
    end


    x(:,8) = x(:,6)*1000+x(:,7);
    cnt1 = unique(x(:,8));                  % 不重复的元素，筛选出来频率和脉宽类
    y=x(:,8);
    [m,n]=histcounts(y,cnt1);               % m是出现的点数量，少于20的去掉
    idx = m>20;
    m = m(idx);
    n = n(idx);
    num = ismember(x(:, 8), n);             % 筛选满足条件的x
    x = x(num, :);                          % x是每个类里数据点>20
    %%%%时间点取角度平均
    x1 = x;
    xx2 = unique(x1(:, 8)); 
    % 遍历每个唯一值，并提取对应的行
    for ii = 1:length(xx2)
        row2 = find(x1(:, 8) == xx2(ii));
        x2 = x1(row2,:);
        pt0 = [x2(:,9),x2(:,4)];
        data = pt0;
        col = unique(data(:, 1));           % 获取第一列中所有唯一的值
        meanVal = zeros(size(col));         % 初始化
        for ii = 1:length(col)
            rows = data(:, 1) == col(ii);    % 找到第一列等于当前唯一值的所有行
            meanVal(ii) = mean(data(rows, 2));  % 计算第二列的均值
        end
        for ii = 1:length(col)
            rows = data(:, 1) == col(ii);    % 找到需要更新的行的索引
            data(rows, 2) =  meanVal(ii);    % 更新这些行的第二列
        end
        x2(:,4) = data(:,2);                % 在x2中调整好
        x1(row2,:) = x2;

    end
    x = x1;                     
    %%%%%%%

%     figure; 
%     lgd = {};
%     for i1 = 1:length(n)
%         idx = x(:,8) == n(i1);
%         x1 = x(idx,:);
%         plot(x1(:,9),x1(:,4),'.'); hold on;
% 
%         lgd = [lgd, num2str(n(i1))];
%     end
%     legend(lgd);

    [m1,m2] = sort(m,'descend');

    for i1 = 1:length(m)

        for i2 = i1+1:length(m)

        end
    end


    xx = x;
    %遍历其他的与其做角度相减，取最大值做阈值判断
    %给每个时间相同的行打标签，只留一个时间角度
    %把每组都计算出来，然后以组为单位查找时间
    %在同一个时间上比较角度，时间不同就扔，取差值最大
    z  = sortrows(x, 8, 'ascend');

    col1 = x(:, 8);
    % 统计每个数值出现的频率
    [value1, ~, idx] = unique(col1);
    counts1 = histcounts(col1, [value1; max(value1) + 1] - 0.5);
    % 根据频率对数值进行排序（降序）
    [counts, idx1] = sort(counts1, 'descend');
    value2 = value1(idx1);
    row_idx = cell(length(value2), 1);      %存行索引
    % 遍历排序后的数值，找到对应的行索引
    for ii = 1:length(value2)
        val = value2(ii);
        row_idx{ii} = find(col1 == val);
    end

    %%%依次取数量最多的角度,计算其他类与该类，对应时间角度差值diff
    for ii= 1:length(row_idx)
    p = x(row_idx{ii,1},:);
    for j = ii+1:length(row_idx)
        p1 = x(row_idx{j,1},:);
        results_p1 = NaN;
        currentTime = p(1, 9);currentAng = p(1, 4);
    % 遍历 p 的行
    for ii = 1:size(p, 1)
        % 检查当前行是否属于新的组
        if ii < size(p, 1) && p(ii+1, 9) ~= currentTime
            % 记录当前组的代表元素 a
            a = [currentAng , currentTime];

            % 在 p1 中找到与当前组第四列值相同的行，并计算差值
            logicalIndex_p1 = p1(:, 9) == currentTime;
            if any(logicalIndex_p1)
                diff_p1 = p1(logicalIndex_p1, 4) - a(1);
                results_p1 = [results_p1; diff_p1];
    %         else
    %             results_p1 = 100;
            end
             % 更新变量以跟踪新的组
            currentTime = p(ii+1, 9);
            currentAng  = p(ii+1, 4);

        end
    %     diff(j,i) = max(abs(results_p1));
    end
    diff(j,ii) = max(abs(results_p1));
    end
    end
    diff(:,length(row_idx)) = 0;
    % 使用 isnan 函数找出 NaN 元素的逻辑索引,将NaN赋值10
    nan_indices = isnan(diff);
    diff(nan_indices) = 10;
    %%5%
    Row = row_idx;Diff = diff;
    row_idx =Row ; diff = Diff;
    %%%%
    %%%%如果diff(2,1)<0.2,那就把row_idx{2,1}记录下来并删除，
    % 或者x(row_idx{2,1},10) = 1

    xx = x;
    % xx(row_idx{2,1},10) = 1;
    % z = x;
    for ii  = 1:length(row_idx)
        if ii<=length(diff)
            row_trace = row_idx(ii,:);            %同一条轨迹
            idx_ang =diff(:,ii)<0.2 & diff(:,ii)>0;   %%%0.2
            row_trace = [row_trace;row_idx(idx_ang,:)];
            for j = 1:numel(row_trace) % 原数据组的第10列记录轨迹类
                xx(row_trace{j},10) = ii;
            end
            % 得对提取出来的cell格进行删除，diff的列删除
            row_idx = row_idx(~idx_ang, :);

            % 根据 idx_ang 删除 x 中的列
            % 直接使用 idx_ang 的逻辑否（~idx_ang）来索引需要保留的列
            diff = diff(~idx_ang, ~idx_ang);
        end
    end


    % iii = xx(:,10)==1;
    % p = xx(iii,:);figure;plot3(p(:,9),p(:,1),p(:,4),'.');


    %%%%%绘制分类后轨迹
    cnt11 = unique(xx(:,10));
    yy = xx(:,10);
    [m,n]=histcounts(yy,cnt11);
    n = n+1;

    % idx = m>500;                %数量少的点迹去掉(180,900)
    % m = m(idx);
    % n = n(idx);


    % 取数据量多的前几条航迹类
    [~, num] = sort(m, 'descend');
    idx = false(1, length(m)); % 创建一个与 m 同样长度的逻辑零向量
    idx(num(1:8)) = true; % 将数量多的前几条航迹的元素的对应位置设为 true

    m = m(idx);
    n = n(idx);

    %%%%存储对应的数据，后面生成csv文件
    saveIndex = false(size(x, 1), 1);
    for i = 1:length(n)
        saveIndex = saveIndex | (xx(:, 10) == n(i));
    end
    X = xx(saveIndex, :);

%     figure; 
%     lgd = {};
%     for i1 = 1:length(n)
%         idx = xx(:,10) == n(i1);
%         x1 = xx(idx,:);
%         plot(x1(:,9),x1(:,4),'.'); hold on;
%         lgd = [lgd, num2str(n(i1))];
%     end
%     legend(lgd);

%     %依次画出每类航迹
%     for ii = 1:length(n)
%         iii = xx(:,10)==n(ii);
%         p = xx(iii,:);
%     %     plot3(p(:,9),p(:,1),p(:,4),'.');hold on;
%         figure;plot3(p(:,9),p(:,1),p(:,4),'.');
%         xlabel('到达时间');ylabel('频率');zlabel('到达角度');
%     end



    %%%%

%      save('.\PDW8.mat')

    % 指定输出文件名
%     filename = 'PDW8分类.csv';
    filename = [files(i).name,'_分类.csv'];

    output = [X(:,11:15),X(:,10)]; 
    % 将数组写入CSV文件
    writematrix(output, filename);
end