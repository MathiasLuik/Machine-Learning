
function value=sigmuid_kernel(point_1,point_2,k_1,k_2)
value = tanh(k_1*point_1*point_2+k_2);
%sigmuid_kernel(3,2,1,2)

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
