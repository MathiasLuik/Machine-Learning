% this script playes a role of dataset constructor. 
clear
clc

stepS = 0.1;
% generate more comples sets
t=-2:stepS:2;
tLength = length(t);
thicknes = 10;

DS1=[];
for i=1:tLength
    tSlice = rand(thicknes,2)*1.2;
    x(1:thicknes,1)=tSlice(:,1)+t(i)+10;
    y(1:thicknes,1)=-tSlice(:,2)+t(i)^2-20;
    DS1 = [DS1;x,y];
end

DS2=[];
for i=1:tLength
    tSlice = rand(thicknes,2)*0.9;
    x(1:thicknes,1)=tSlice(:,1)+t(i)+10;
    y(1:thicknes,1)=tSlice(:,2)-t(i)^2+25;
    DS2 = [DS2;x,y];
end

DS3=[];
for i=1:tLength
    tSlice = rand(thicknes,2)*0.9;
    x(1:thicknes,1)=tSlice(:,1)+t(i)+15;
    y(1:thicknes,1)=tSlice(:,2)-t(i)^2+25;
    DS3 = [DS3;x,y];
end
DS4=[];
for i=1:tLength
    tSlice = rand(thicknes,2)*1.2;
    x(1:thicknes,1)=tSlice(:,1)+t(i)+15;
    y(1:thicknes,1)=-tSlice(:,2)+t(i)^2-20;
    DS4 = [DS4;x,y];
end

%fh(2)=figure(2);
%clf(fh(2))
%scatter(DS1(:,1),DS1(:,2))
%hold on
%scatter(DS2(:,1),DS2(:,2))
%hold on
%scatter(DS3(:,1),DS3(:,2))
%hold on

%flower like clusters
%cluster1


%cov(1).matrix = [4, 2; 2, 3];
cov(3).matrix = [1, -2; -2, 6];
cov(2).matrix = [1, 0.5; 0.5, 1];
cov(1).matrix = [1 -2; -2, 7];
cov(4).matrix = [2, 1; 1, 2];

n(1) = 350;
n(2) = 400;
n(3) = 350;
n(4) = 400;


mu(1,4).xy = [18,4];
mu(1,3).xy = [10,10];
mu(1,2).xy = [9,-6];
mu(1,1).xy = [13,-6];

flower_1 = [];
for i = 1:1
    for j = 1:4
        petal(i,j).set = mvnrnd(mu(i,j).xy,cov(j).matrix,n(j));
        flower_1 = [flower_1;petal(i,j).set];
    end
end

%fh(4)=figure(4);
%clf(fh(4))
%scatter(flower_1(:,1),flower_1(:,2))
%hold on
%scatter(flower_2(:,1),flower_2(:,2))
% cluster2 
DS=[DS1;DS2;DS3;DS4;flower_1]
fh(5)=figure(5);
clf(fh(5))
scatter(DS(:,1),DS(:,2))
hold on
