clear
clc

parabolic1 = createParabolic(1.2, 10, -1, 1, -20);
parabolic2 = createParabolic(0.9, 10, 1, -1, 25);
parabolic3 = createParabolic(0.9, 15, 1, -1, 25);
parabolic4 = createParabolic(1.2, 15, -1, 1, -20);

gaussian1 = createGaussian([1 -2; -2, 7], 350, [13,-6]);
gaussian2 = createGaussian([1, 0.5; 0.5, 1], 400, [9,-6]);
gaussian3 = createGaussian([1, -2; -2, 6], 350, [10,10]);
gaussian4 = createGaussian([2, 1; 1, 2], 400, [18,4]);

dataset = [ parabolic1; parabolic2; parabolic3; parabolic4; gaussian1; gaussian2; gaussian3; gaussian4];
scatter(dataset(:,1), dataset(:,2))

function gaussian = createGaussian(cov, n, mu)
gaussian = mvnrnd(mu, cov, n);
end

function parabolic = createParabolic(coeff1, coeff2, coeff3, coeff4, coeff5)
t = -2: 0.1: 2;
tLength = length(t);
thickness = 10;
parabolic = zeros(tLength*thickness, 2);
for i = 1: tLength
    tSlice = rand(thickness,2)*coeff1;
    x(1:thickness,1) = tSlice(:,1) + t(i) + coeff2;
    y(1:thickness,1) = coeff3*tSlice(:,2) + coeff4*t(i)^2 + coeff5;
    parabolic(i*thickness-(thickness-1): i*thickness, :) = [x,y];
end
end