close all;
x = importdata('./data_train/PDW30.csv');
idx = x(:,4)>60;
x = x(idx,:);

x = [x,x,x];
x(:,11:15) = x(:,1:5);
x(:,1) = x(:,1)*1e-9;
x(:,1) = round(x(:,1)*1e4)*1e-4;
x(:,3) = x(:,3)*1e6;
x(:,6:10) = 0;

idx = x(:,6) == 0;
cnt = 101;
while sum(idx)>0
    x1 = x(idx,:);
    n1 = mode(x1(:,1));
    idx2 = x1(:,1)>n1-0.0005 & x1(:,1)<n1+0.0005;
    x1(idx2,6) = cnt;
    x(idx,:) = x1;

    cnt = cnt + 1;
    idx = x(:,6) == 0;
    sum(idx)
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
    sum(idx)
end

cnt1 = unique(x(:,6));

figure; 
for i1 = 1:length(cnt1)
    idx = x(:,6) == cnt1(i1);
    x1 = x(idx,:);
    plot(x1(:,2),x1(:,1),'.'); hold on;
end

cnt1 = unique(x(:,7));

figure; 
for i1 = 1:length(cnt1)
    idx = x(:,7) == cnt1(i1);
    x1 = x(idx,:);
    plot(x1(:,2),x1(:,3),'.'); hold on;
end

idx = x(:,9) == 0;
while sum(idx)>0
    x1 = x(idx,:);
    n1 = x1(1,2);
    idx2 = x1(:,2)>n1-0.1 & x1(:,2)<n1+0.1;
    n2 = x1(idx2,2);
    n2 = round(mean(n2)*10)/10;
    x1(idx2,9) = n2;
    x(idx,:) = x1;

    idx = x(:,9) == 0;
    sum(idx)
end


x(:,8) = x(:,6)*1000+x(:,7);
cnt1 = unique(x(:,8));
y=x(:,8);
[m,n]=histcounts(y,cnt1);
idx = m>20;
m = m(idx);
n = n(idx);

figure; 
lgd = {};
for i1 = 1:length(n)
    idx = x(:,8) == n(i1);
    x1 = x(idx,:);
    plot(x1(:,9),x1(:,4),'.'); hold on;
    lgd = [lgd, num2str(n(i1))];
end
legend(lgd);

[m1,m2] = sort(m,'descend');

for i1 = 1:length(m)

    for i2 = i1+1:length(m)
        ;
    end
end

figure;
for i1 = 1:length(n)
    idx = x(:,8) == n(i1);
    x1 = x(idx,:);
    plot3(x1(:,9),x1(:,11),x1(:,4),'.'); hold on;
    lgd = [lgd, num2str(n(i1))];
end
% plot3(1:length(data), freq, angle, '.');
% xlabel('Pulse Times');
% ylabel('Frequency');
% zlabel('angle');
% title('3D Plot of Pulse Times vs Frequency vs Angle');
% grid on;

% figure; plot(x(:,2),x(:,1),'.');
% figure; plot(x(:,2),x(:,3),'.');
% figure; plot(x(:,2),x(:,4),'.');
% figure; plot(x(:,2),x(:,5),'.');
% 
% figure; histogram(x(:,1),300);
% 
% idx = x(:,3)>1.8e-6 & x(:,3)<2.2e-6;
% x1 = x(idx,:);
% 
% figure; plot(x1(:,2),x1(:,1),'.');
% figure; plot(x1(:,2),x1(:,3),'.');
% figure; plot(x1(:,2),x1(:,4),'.');
% figure; plot(x1(:,2),x1(:,5),'.');
% 
% x2 = x1;
% x11 = x1;
% idx = x2(:,1)>7.122e9 & x2(:,1)<7.123e9;
% x1 = x2(idx,:);
% 
% figure; plot(x1(:,2),x1(:,1),'.');
% figure; plot(x1(:,2),x1(:,3),'.');
% figure; plot(x1(:,2),x1(:,4),'.');
% figure; plot(x1(:,2),x1(:,5),'.');
% 
% x2 = x11;
% idx = x2(:,1)>7.113e9 & x2(:,1)<7.114e9;
% x1 = x2(idx,:);
% 
% figure; plot(x1(:,2),x1(:,1),'.');
% figure; plot(x1(:,2),x1(:,3),'.');
% figure; plot(x1(:,2),x1(:,4),'.');
% figure; plot(x1(:,2),x1(:,5),'.');
% 
% x2 = x11;
% idx = x2(:,1)>7.11e9 & x2(:,1)<7.111e9;
% x1 = x2(idx,:);
% 
% figure; plot(x1(:,2),x1(:,1),'.');
% figure; plot(x1(:,2),x1(:,3),'.');
% figure; plot(x1(:,2),x1(:,4),'.');
% figure; plot(x1(:,2),x1(:,5),'.');

1;
