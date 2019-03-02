% clear everything
clc
clear

clusterCount = floor(30);

fh(1) = figure(1);
clf(fh(1));

%this will hold all our datapoints
finalMatrix = [];
parabolic1 = createParabolic(1.2, 10, -1, 1, -20);
parabolic2 = createParabolic(0.9, 10, 1, -1, 25);
parabolic3 = createParabolic(0.9, 15, 1, -1, 25);
parabolic4 = createParabolic(1.2, 15, -1, 1, -20);
datas=[parabolic1,parabolic2,parabolic3,parabolic4];
for clusterNo = 1 : clusterCount
    clusterNo = mod(clusterNo, 4) + 1;
    
    dataset(clusterNo).eigen1 = rand;
    dataset(clusterNo).eigen2 = rand;
    dataset(clusterNo).eigenVector = [dataset(clusterNo).eigen1, -dataset(clusterNo).eigen2; -dataset(clusterNo).eigen2, -dataset(clusterNo).eigen1];
    dataset(clusterNo).eigenValues = [rand * 2, 0; 0, rand * 5]; 
    dataset(clusterNo).covarianceMatrix =  dataset(clusterNo).eigenVector * dataset(clusterNo).eigenValues * inv(dataset(clusterNo).eigenVector);
    
    dataset(clusterNo).mean = [floor(rand*50), floor(rand*50)];
    
    dataset(clusterNo).pointsCount = floor(300 + rand * 300);
    dataset(clusterNo).data = mvnrnd(dataset(clusterNo).mean, dataset(clusterNo).covarianceMatrix, dataset(clusterNo).pointsCount);
    
    labelColumn = ones(dataset(clusterNo).pointsCount, 1) * clusterNo;
    data = [dataset(clusterNo).data labelColumn]
    
    finalMatrix = [finalMatrix; data];

end