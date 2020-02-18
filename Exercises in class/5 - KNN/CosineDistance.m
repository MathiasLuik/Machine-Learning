function value=CosineDistance(point_1,point_2)
%spmd
 %  % Create the data.  Don't use floor because that will return all zeros.
%   r = rand(100,codistributor1d(1));
%end
% Find the norm of each row
value = pdist2([0,0],[3,3],'cosine')
n_row = size(point_1,1);
norm_r = sqrt(sum(abs(point_1).^2,2)); % same as norm(S1,2,'rows')
S2 = zeros(n_row,n_row);
for i = 1:n_row
  for j = i:n_row
    S2(i,j) = dot(point_1(i,:), point_2(j,:)) / (norm_r(i) * norm_r(j));
    S2(j,i) = S2(i,j);
  end
end
S2 = squareform(1-pdist(point_1,point_2,'cosine')) + eye(size(point_1,point_2,1));

%MyManhattanDistance([0,0],[1,1])