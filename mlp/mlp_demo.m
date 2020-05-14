clear; close all;
n = 200;
x = linspace(-10,10,n); %,2*pi,n);
y = sin(x) %1./(1+exp(-x));

k = [3,4];            % two hidden layers with 3 and 4 hidden nodes
lambda = 1e-2;
[model, L] = mlpReg(x,y,k);
t = mlpRegPred(model,x);
plot(L);
figure;
hold on
plot(x,y,'.');
plot(x,t);
hold off