
% mean values
mean(1).mu = [-8,-7];
mean(2).mu = [1,0];
mean(3).mu = [-5,-2];
mean(4).mu = [5,6];
mean(5).mu = [6,-4];

% sample sizes
n(1) = 300;
n(2) = 300;
n(3) = 300;
n(4) = 300;
n(5) = 300;

for i=1:5
    D(i).set = mvnrnd(mean(i).mu, cov(i).matrix, n(i)); 
end

X = []

for i=1:5
    
        %X[300*i + j].set = get(d[i], j)
        X = [X; D(i).set];
    
end

%print(X)

fh(1) = figure(1);
clf(fh(1))
for i=1:5
    scatter(D(i).set(:,1),D(i).set(:,2))
    hold on
end




