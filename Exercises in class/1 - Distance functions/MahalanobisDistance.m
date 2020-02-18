function value=MahalanobisDistance(point_1,point_2)
dimensionality = length(point_1);

vSum =0;

Y = [1.55 5 32];
%Y = [12.3650 22.50 12.50];
X = [5.76 43 34;6.7 32 5;3 3 5;34 12 6];
%X = [5.76, 43,34],[6.7,32,5],[3,3,5],[34,12,6];
%U = cov(T);
S = cov(X);
mu = mean(X,1);
N=(Y-mu)
L=(N/S);
I=(Y-mu)';
%k=
d = (L*I);
%d = (Y-mu)*inv(S)*(Y-mu)'
for i=1:dimensionality
    vSum=vSum+abs(point_1(i)-point_2(i));
end

%value = mu;
value = pdist2(X,Y,'mahalanobis')
%value = mahal(X,Y)
end

%MahalanobisDistance([0,0],[1,1])
%mahal([1,1],[2,2],[3,2])