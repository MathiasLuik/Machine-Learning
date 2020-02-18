clear
clc

loadMatFile = load('data_for_modelling.mat');
D = loadMatFile;
%D(i,3)=0;
%D(3,:) = {0};
setting = ones(size(D));
%D(:,3)=ones(size(D));
%D(setting,3);
%D(:,3)=setting;
%D(:, 3) = zeros(1, size(D))
for i = 1:length(D)
    % set each element to 0
   
    D(i,3) = 1+((D(i,1)*D(i,2)))^2;
end




%function value=degreespolynominal(point_1,point_2)
%value = 1+(point_1*point_2)^2;
%degreepolynominal([3],[2])
%end

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
