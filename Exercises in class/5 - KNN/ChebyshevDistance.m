function value=ChebyshevDistance(point_1,point_2)
dimensionality = length(point_1);

vSum =0;

for i=1:dimensionality
    distance=abs(point_1(i)-point_2(i));
    if distance>=vSum
        vSum=distance
end

value = vSum;
end

%ChebyshevDistance([0,0],[3,3])