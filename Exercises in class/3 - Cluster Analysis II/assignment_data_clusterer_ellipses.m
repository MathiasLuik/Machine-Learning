clear 
clc

loadMatFile = load('lab_generate_gauss_others.mat');
DD = loadMatFile.data;


% expected number of clusters 
K=4;
estim_mu=randn(K,2); %generates 2 rows of values between -k and +k
cPi=ones(K)*1/K; %genereerib 4x4 ühtesi ja selle jagab 4'ga
[rows,~]=size(DD); %1500 rowi
% generate initial  responsibilities pi and sigma matrices for each cluster
%centroids 
orient=[1,3;4,2]; %row 1 ja 3, mille all on 4,2 
radiuses = [3,0 ;0, 2];

for k=1:K
    estim(k).sigma = orient*radiuses*orient'; % ring
end

fh(2)=figure(2);
exit_flag=0;
l=1;
iteration=1;
while(exit_flag==0)
    clf(fh(2))
    scatter(DD(:,1),DD(:,2))
    hold on
    %E-step
    for i=1:rows
        for k=1:K
            cpikp(k)=cPi(k)*mvnpdf(DD(i,:),estim_mu(k,:),estim(k).sigma);
            %y = mvnpdf(X,MU,SIGMA) returns the density of the multivariate normal distribution with mean MU and covariance SIGMA,
            %y = mvnpdf(X,MU,SIGMA)
            %x käib läbi kõik kordinaadid
            % müü on keskmine ehk normal distribution pea
            % sigma on std.
            %mvn - Multivariate normal probability density function

        end
        sum_cpikp=sum(cpikp); % liidad kõik probabilitid kokku ja saad 1. Mille tõttu saad niiöelda tn kuhu kuulub
        for k=1:K
            r(i,k)=cpikp(k)/sum_cpikp; % leiad osakaalud.
        end
    end
    
    % M-step
    for k=1:K
        cPi(k)=sum(r(:,k))/rows;
        
        rxx = zeros(2,2);
        for i=1:rows
            rx(i,:)=DD(i,:).*r(i,k); % osakaalude läbikorrutamine
            rxx=rxx+DD(i,:)'*DD(i,:)*r(i,k);
        end
        estim_mu(k,:)=sum(rx)/sum(r(:,k));
        estim(k).sigma=rxx./sum(r(:,k))-estim_mu(k,:)'*estim_mu(k,:);
        
        %in order todraw
        % perform eigen decomposition
        [Vect,Vals]=eig(estim(k).sigma);
        Vals=Vals.*9;
        ellipse = ellipse2D(sqrt(Vals(1,1)),sqrt(Vals(2,2)),estim_mu(k,1),estim_mu(k,2),Vect,20);
        plot(ellipse(:,1),ellipse(:,2))
        hold on
        plot(estim_mu(k,1),estim_mu(k,2),'o','MarkerFaceColor','magenta','MarkerEdgeColor','green','MarkerSize',10)
        clear ellipse
        
        
        if (iteration == 50)
            fprintf('Cluster %d\n', k)
            fprintf('[Vect] - %d\n',Vect)
            fprintf('[Vals] - %d\n',Vals)
            %fprintf('Mean - %d\n',estim_mu(k,1))
            fprintf('estim(k).sigma - %d\n',estim(k).sigma)
            fprintf('X cordinates - %d\n',estim_mu(k,1))
            fprintf('Y cordinates - %d\n',estim_mu(k,2))
            fprintf('cPi(k) - %d\n',cPi(k))
            fprintf('rxx. - %d\n',rxx)
            fprintf('Mean - %d\n',estim_mu(k,1))
            %(sqrt(Vals(1,1)),sqrt(Vals(2,2)),estim_mu(k,1),estim_mu(k,2),Vect,20);
            %seal on keskmine
            %
        end
        
    end
    pause(0.002)
    if(iteration == 51)
        break
    end
    %fprintf('Iteration %d\n',iteration)
    
    iteration = iteration + 1;
end