clear
clc

n=800;
dim=7;
x2min=2;
x2max=4;




data=zeros(800,dim);

data(:,1)=abs(randn(n,1));
data(:,2)=x2min+ (x2max-x2min)*randn(n,1);

data(:,3)= data(:,2)*3;

data(:,4)=-data(:,2).*(0.2+randn(n,1)/20);

data(:,5)=log(data(:,1)+5);
data(:,6) = data(:,2) - 3*data(:,1);

data(:,7)=data(:,1) - 5*data(:,4) + 0.5*data(:,5) + 0.05*randn(n,1);

for i = 1:dim-1
    figure(i)
    scatter(data(:,i), data(:,7));
end