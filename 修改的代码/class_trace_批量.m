clc;
clear;
close all;
files = dir('.\data_train\*.csv');
for i = 1:length(files)
    
    filePath = fullfile('.\data_train', files(i).name);
% x = importdata('.\data_train\PDW8.csv');    %���ݶ�ȡ
    x = importdata(filePath);    %���ݶ�ȡ
    idx = x(:,4)>60;
    x = x(idx,:);

    x = [x,x,x];            %��
    x(:,11:15) = x(:,1:5);
    x(:,1) = x(:,1)*1e-9;               % ��һ������
    x(:,1) = round(x(:,1)*1e4)*1e-4;
    x(:,3) = x(:,3)*1e6;
    x(:,6:10) = 0;

    idx = x(:,6) == 0;
    cnt = 101;
    while sum(idx)>0
        x1 = x(idx,:);
        n1 = mode(x1(:,1));             % �ҳ�������Ƶ��
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

    idx = x(:,9) == 0;                  %��ʱ��������о�ֵȡ֤
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
    cnt1 = unique(x(:,8));                  % ���ظ���Ԫ�أ�ɸѡ����Ƶ�ʺ�������
    y=x(:,8);
    [m,n]=histcounts(y,cnt1);               % m�ǳ��ֵĵ�����������20��ȥ��
    idx = m>20;
    m = m(idx);
    n = n(idx);
    num = ismember(x(:, 8), n);             % ɸѡ����������x
    x = x(num, :);                          % x��ÿ���������ݵ�>20
    %%%%ʱ���ȡ�Ƕ�ƽ��
    x1 = x;
    xx2 = unique(x1(:, 8)); 
    % ����ÿ��Ψһֵ������ȡ��Ӧ����
    for ii = 1:length(xx2)
        row2 = find(x1(:, 8) == xx2(ii));
        x2 = x1(row2,:);
        pt0 = [x2(:,9),x2(:,4)];
        data = pt0;
        col = unique(data(:, 1));           % ��ȡ��һ��������Ψһ��ֵ
        meanVal = zeros(size(col));         % ��ʼ��
        for ii = 1:length(col)
            rows = data(:, 1) == col(ii);    % �ҵ���һ�е��ڵ�ǰΨһֵ��������
            meanVal(ii) = mean(data(rows, 2));  % ����ڶ��еľ�ֵ
        end
        for ii = 1:length(col)
            rows = data(:, 1) == col(ii);    % �ҵ���Ҫ���µ��е�����
            data(rows, 2) =  meanVal(ii);    % ������Щ�еĵڶ���
        end
        x2(:,4) = data(:,2);                % ��x2�е�����
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
    %�����������������Ƕ������ȡ���ֵ����ֵ�ж�
    %��ÿ��ʱ����ͬ���д��ǩ��ֻ��һ��ʱ��Ƕ�
    %��ÿ�鶼���������Ȼ������Ϊ��λ����ʱ��
    %��ͬһ��ʱ���ϱȽϽǶȣ�ʱ�䲻ͬ���ӣ�ȡ��ֵ���
    z  = sortrows(x, 8, 'ascend');

    col1 = x(:, 8);
    % ͳ��ÿ����ֵ���ֵ�Ƶ��
    [value1, ~, idx] = unique(col1);
    counts1 = histcounts(col1, [value1; max(value1) + 1] - 0.5);
    % ����Ƶ�ʶ���ֵ�������򣨽���
    [counts, idx1] = sort(counts1, 'descend');
    value2 = value1(idx1);
    row_idx = cell(length(value2), 1);      %��������
    % ������������ֵ���ҵ���Ӧ��������
    for ii = 1:length(value2)
        val = value2(ii);
        row_idx{ii} = find(col1 == val);
    end

    %%%����ȡ�������ĽǶ�,��������������࣬��Ӧʱ��ǶȲ�ֵdiff
    for ii= 1:length(row_idx)
    p = x(row_idx{ii,1},:);
    for j = ii+1:length(row_idx)
        p1 = x(row_idx{j,1},:);
        results_p1 = NaN;
        currentTime = p(1, 9);currentAng = p(1, 4);
    % ���� p ����
    for ii = 1:size(p, 1)
        % ��鵱ǰ���Ƿ������µ���
        if ii < size(p, 1) && p(ii+1, 9) ~= currentTime
            % ��¼��ǰ��Ĵ���Ԫ�� a
            a = [currentAng , currentTime];

            % �� p1 ���ҵ��뵱ǰ�������ֵ��ͬ���У��������ֵ
            logicalIndex_p1 = p1(:, 9) == currentTime;
            if any(logicalIndex_p1)
                diff_p1 = p1(logicalIndex_p1, 4) - a(1);
                results_p1 = [results_p1; diff_p1];
    %         else
    %             results_p1 = 100;
            end
             % ���±����Ը����µ���
            currentTime = p(ii+1, 9);
            currentAng  = p(ii+1, 4);

        end
    %     diff(j,i) = max(abs(results_p1));
    end
    diff(j,ii) = max(abs(results_p1));
    end
    end
    diff(:,length(row_idx)) = 0;
    % ʹ�� isnan �����ҳ� NaN Ԫ�ص��߼�����,��NaN��ֵ10
    nan_indices = isnan(diff);
    diff(nan_indices) = 10;
    %%5%
    Row = row_idx;Diff = diff;
    row_idx =Row ; diff = Diff;
    %%%%
    %%%%���diff(2,1)<0.2,�ǾͰ�row_idx{2,1}��¼������ɾ����
    % ����x(row_idx{2,1},10) = 1

    xx = x;
    % xx(row_idx{2,1},10) = 1;
    % z = x;
    for ii  = 1:length(row_idx)
        if ii<=length(diff)
            row_trace = row_idx(ii,:);            %ͬһ���켣
            idx_ang =diff(:,ii)<0.2 & diff(:,ii)>0;   %%%0.2
            row_trace = [row_trace;row_idx(idx_ang,:)];
            for j = 1:numel(row_trace) % ԭ������ĵ�10�м�¼�켣��
                xx(row_trace{j},10) = ii;
            end
            % �ö���ȡ������cell�����ɾ����diff����ɾ��
            row_idx = row_idx(~idx_ang, :);

            % ���� idx_ang ɾ�� x �е���
            % ֱ��ʹ�� idx_ang ���߼���~idx_ang����������Ҫ��������
            diff = diff(~idx_ang, ~idx_ang);
        end
    end


    % iii = xx(:,10)==1;
    % p = xx(iii,:);figure;plot3(p(:,9),p(:,1),p(:,4),'.');


    %%%%%���Ʒ����켣
    cnt11 = unique(xx(:,10));
    yy = xx(:,10);
    [m,n]=histcounts(yy,cnt11);
    n = n+1;

    % idx = m>500;                %�����ٵĵ㼣ȥ��(180,900)
    % m = m(idx);
    % n = n(idx);


    % ȡ���������ǰ����������
    [~, num] = sort(m, 'descend');
    idx = false(1, length(m)); % ����һ���� m ͬ�����ȵ��߼�������
    idx(num(1:8)) = true; % ���������ǰ����������Ԫ�صĶ�Ӧλ����Ϊ true

    m = m(idx);
    n = n(idx);

    %%%%�洢��Ӧ�����ݣ���������csv�ļ�
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

%     %���λ���ÿ�ຽ��
%     for ii = 1:length(n)
%         iii = xx(:,10)==n(ii);
%         p = xx(iii,:);
%     %     plot3(p(:,9),p(:,1),p(:,4),'.');hold on;
%         figure;plot3(p(:,9),p(:,1),p(:,4),'.');
%         xlabel('����ʱ��');ylabel('Ƶ��');zlabel('����Ƕ�');
%     end



    %%%%

%      save('.\PDW8.mat')

    % ָ������ļ���
%     filename = 'PDW8����.csv';
    filename = [files(i).name,'_����.csv'];

    output = [X(:,11:15),X(:,10)]; 
    % ������д��CSV�ļ�
    writematrix(output, filename);
end