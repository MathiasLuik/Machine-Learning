clear
clc


clusterCount = floor(30);
fh(1) = figure(1);
clf(fh(1));

%this will hold all our datapoints
finalMatrix = [];


%labelColumn = ones(dataset(clusterNo).pointsCount, 1) * clusterNo;
%data = [dataset(clusterNo).data labelColumn]

parabolic1 = createParabolic(1.2, 10, -1, 1, -20);
parabolic2 = createParabolic(0.9, 10, 1, -1, 25);
parabolic3 = createParabolic(0.9, 15, 1, -1, 25);
parabolic4 = createParabolic(1.2, 15, -1, 1, -20);

gaussian1 = createGaussian([1 -2; -2, 7], 350, [13,-6]);
gaussian2 = createGaussian([1, 0.5; 0.5, 1], 400, [9,-6]);
gaussian3 = createGaussian([1, -2; -2, 6], 350, [10,10]);
gaussian4 = createGaussian([2, 1; 1, 2], 400, [18,4]);

newData=Arr(parabolic1,1)

finalMatrix = [];

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





dataset = [ parabolic1; parabolic2; parabolic3; parabolic4; gaussian1; gaussian2; gaussian3; gaussian4];
scatter(dataset(:,1), dataset(:,2))

%finalMatrix = [finalMatrix; data];

function gaussian = createGaussian(cov, n, mu)
gaussian = mvnrnd(mu, cov, n);
end

function parabolic = createParabolic(coeff1, coeff2, coeff3, coeff4, coeff5)
t = -2: 0.1: 2;
tLength = length(t);
thickness = 10;
parabolic = zeros(tLength*thickness, 2);
for i = 1: tLength
    tSlice = rand(thickness,2)*coeff1;
    x(1:thickness,1) = tSlice(:,1) + t(i) + coeff2;
    y(1:thickness,1) = coeff3*tSlice(:,2) + coeff4*t(i)^2 + coeff5;
    parabolic(i*thickness-(thickness-1): i*thickness, :) = [x,y];
end
end
