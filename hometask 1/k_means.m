clear 
clc

loadMatFile = load('lab_generate_gauss_others.mat');
data = loadMatFile.data;

amountOfClusters=0;
winnerAverage=0;

for i=3:20
    iterations = 40;
    randID = randperm(size(data,1));
    central_XY = data(randID(1:i), :);
    for j=1:iterations
      cluster_index = getClosestcentral_XY(data, central_XY);
      central_XY = computecentral_XY(data, cluster_index, i);
    end

    %fprintf('central_XY %d\n',central_XY);
    %kMeansCalc=kmeans(data,i);
    silicCalc=silhouette(data, cluster_index);
    average=mean(silicCalc);
    if average>=winnerAverage
        winnerAverage=average;
        amountOfClusters=i;
    end
end
fprintf('amountOfClusters %d\n',amountOfClusters)

function cluster_index = getClosestcentral_XY(data, central_XY)
  K = size(central_XY, 1);
  cluster_index = zeros(size(data,1), 1);
  m = size(data,1);
  for i=1:m
    k = 1;
    min_dist = sum((data(i,:) - central_XY(1,:)) .^ 2);
    for j=2:K
        dist = sum((data(i,:) - central_XY(j,:)) .^ 2);
        if(dist < min_dist)
          min_dist = dist;
          k = j;
        end
    end
    cluster_index(i) = k;
  end
end

function central_XY = computecentral_XY(data, idx, N_Clusters)
  [m n] = size(data);
  central_XY = zeros(N_Clusters, n);
  for i=1:N_Clusters
    xi = data(idx==i,:);
    ck = size(xi,1);
    central_XY(i, :) = (1/ck) * [sum(xi(:,1)) sum(xi(:,2))];
  end
end


 

