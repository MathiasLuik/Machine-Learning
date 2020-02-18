function value=CanberraDistance(point_1,point_2)
dimensionality = length(point_1);

vSum =0;

for i=1:dimensionality
    %vSum=vSum+abs(point_1(i)-point_2(i));
    %sum(abs(p - q)./(abs(p) + abs(q)))
    vSum=vSum+sum(abs(point_1(i) - point_2(i))/abs((point_1(i) + abs(point_2(i)))));
    %cd = canb_dist(p,q)
end

value = vSum;
end

%CanberraDistance([0,3],[7,6])=1,33