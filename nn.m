% [1] http://www.stats.uwo.ca/faculty/aim/2015/9850/microarrays/FitMArray/chm/Golub.html
% [2] https://kr.mathworks.com/matlabcentral/fileexchange/14608-mrmr-feature-selection--using-mutual-information-computation-

%Start

clc
clear all
close all

%Load Golub et al. Leukemia Cancer DB
load Database/leukemia_dataset

feature_length=5;  % selecting top 5 most significant genes
train_data=train_data(feature_with_mRMr_d(1:feature_length),:)';
test_data=test_data(feature_with_mRMr_d(1:feature_length),:)';
%Neural Network's parameters
%(size/structure of the MLP)

N1=20;                  % Middle Layer Neurons
N2=1;                   % Output Layer Neurons
N0=feature_length+1;    % Input Layer Neurons (feature length + bias)

% Training parameters
eta = 0.5; % Learning Rate 0-1   eg .01, .05, .005
epoch=10;  % Training iterations

% Initialization of weights
w1=randn(N1,N0);    % Initial weights of input and middle layer connections
w2=randn(N2,N1);    % Initial weights of middle and output layer connections

for j=1:epoch
    % randomization of training data improves learning performance
    ind(j,:)=randperm(length(class_train));

    for k=1:size(train_data,1)

        Input=[1 train_data(ind(j,k),:)];  % {1} is for bias

        % Input layer
        n1 = w1*Input';
        a1=tansig(n1);

        % Hidden layer
        n2 = w2*a1;
        a2=logsig(n2);

        % output layer
        Output(k)=a2;
        e = class_train(ind(j,k)) - Output(k);

        % Training of NN using Backpropagation learning algorithm (gradient
        % descent-based learning rule)

        Y2 = 2*dlogsig(n2,a2)*e;  % local gradient of Output Layer
        Y1 = diag(dtansig(n1,a1),0)*w2'*Y2; % local gradient of Hidden Layer

        w1 = w1 + eta*Y1*Input;  % input layer neurons weight update
        w2 = w2 + eta*Y2*a1';    % hidden layer neurons weight update

        SE(j,k)= e*e';      % squared error
end
MSE(j)=mean(SE(j,:));       % objective function (mean squared error)

% Training classification error (classification accuracy in %)
TCE(j)=length(find((round(Output)-class_train(ind(j,:)))==0))*100/length(Output);
end

figure
semilogy(MSE)
xlabel('Training epochs')
ylabel('MSE (dB)')
title('Objective function')

figure
plot(TCE)
xlabel('Training epochs')
ylabel('Classification accuracy (%)')
title('Classification performance (Training)')

figure
plot(class_train(ind(j,:)),'or')
hold on
plot(round(Output))

legend('Actual class','Predicted class using MLP')
xlabel('Training sample #')
ylabel('Class Label')
title('Classification performance (Training)')

Training_Accuracy=length(find((round(Output)-class_train(ind(j,:)))==0))*100/length(Output);

Output=[];

for k=1:size(test_data,1)

        Input=[1 test_data(k,:)];

        n1 = w1*Input';
        a1=tansig(n1);    %%%% Hidden Layer Activation Function  % tansig for [-1,+1] % logsig for [0,1]
%
        n2 = w2*a1;
        a2=logsig(n2);    %%%% Output Layer Activation Function

        Output(k)=a2;

end

figure
plot(class_test,'or')
hold on
plot(round(Output))
legend('Actual class','Predicted class using MLP')
xlabel('Training sample #')
ylabel('Class Label')
title('Classification performance (Test)')

Testing_Accuracy=length(find((round(Output)-class_test)==0))*100/length(Output);

[Training_Accuracy Testing_Accuracy]