function value=MyEucledeanDistance(point_1,point_2)

dimensionality = length(point_1);

vSum =0;

for i=1:dimensionality
    vSum=vSum+(point_1(i)-point_2(i))^2;
end
value = sqrt(vSum);

end
%MyEucledeanDistance([0,0],[1,1])