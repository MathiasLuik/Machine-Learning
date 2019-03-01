clear
clc

dataFile = load("DS.mat");
DS = dataFile.DS;
% scatter(DS(:,1), DS(:,2))
shuffled = DS(randperm(size(DS, 1)),:);


trainData = shuffled(1:length(shuffled)*0.8,:);
testData = shuffled(length(shuffled)*0.8:length(shuffled),:);
disp(length(trainData))

model = fitcknn(trainData(:,1:2), trainData(:,3), 'NumNeighbors',5);

targets = testData(:,3);
predicted = predict(model, testData(:,1:2));

vect = targets == predicted;
accuracy = sum(vect)/length(targets);
disp(accuracy);
