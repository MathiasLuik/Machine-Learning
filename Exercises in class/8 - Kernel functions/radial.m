
function value=radial(point_1,point_2,standard_dev)
value = exp((1/2*standard_dev^2)*abs((point_1*point_2)^2));
%radial([3],[2])
%radial(3,2,1)
end

%D(3).set = 0; 
%DD=[DD;D(3).set];
%degree_polynominal([0,0],[3,3])

%clear 
%clc
%loadMatFile = load('lin_regr_data.mat');
%D = loadMatFile.data;
%for( i = 1:length(D) )
%    % set each element to 0
 %   D(3) = 0;
%end
