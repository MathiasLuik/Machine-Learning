clear 
clc
loadMatFile = load('lab_generate_gauss_others.mat');
data = loadMatFile.data;
amountOfClusters=0
winnerAverage=0

for i=3:8
    kMeansCalc=kmeans(data,i);
    silicCalc=silhouette(data, kMeansCalc);
    average=mean(silicCalc);
    if average>=winnerAverage
        winnerAverage=average;
        amountOfClusters=i;
    end
end
%fprintf('kmeans %d\n',kmeans)
kMeansCalc=kmeans(data,8);
%silicCalc=silhouette(data, kMeansCalc)
%average=mean(silicCalc)
%i = 3 ; 0,70 Sometimes winner
%i = 4 ; 0,81 Usually Winner
%i = 5 ; 0,80
%i = 6 ; 0,62
%i = 7 ; 0,70
%i = 8 ; 0,62