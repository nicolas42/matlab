close all; clear; clc;

A = [-3 1 1 0 0 0 0 0 0 0;
    1 -1 0 0 0 0 0 0 0 0;
    1 0 -2 1 0 0 0 0 0 0;
    0 0 1 -2 0 1 0 0 0 0;
    0 0 0 0 -1 0 0 0 0 0;
    0 0 0 1 0 -2 1 0 0 0;
    0 0 0 0 0 1 -2 0 1 0;
    0 0 0 0 0 0 0 -1 0 0;
    0 0 0 0 0 0 1 0 -2 1;
    0 0 0 0 0 0 0 0 1 -1;
    ];

B = [2; 0; 0; 0; 0; 0; 0; 0; 0; 0];


syms s;
I = eye(10);
resolvent = inv(s*I - A);
Tf = inv(s*I - A)*B;
eigenvalues = eig(A);
[Q R] = qr(A);
[V,D] = eig(A);



% Section C Find settling time of the last voltage x10
t = linspace(0,200,200001); % millisecond accuracy
sys = ss(A,B,I,0);
plot(step(sys,t)); 
axis([])
xlabel('Time (milliseconds)');
ylabel('Voltage (Volts)');
title('Response of Rather Dynamical Circuit')
legend('x1','x2','x3','x4','x5','x6','x7','x8','x9','x10');

[x10,t] = step(sys(10),t);

% get the index of the first element which is above 0.99
t(find(x10 > 0.99, 1) )

%% Section D
% Find settling time of the last voltage x10
t = linspace(0,200,200001); % millisecond accuracy
sys = ss(A,B,I,0);
plot(step(sys,t)); 
axis([0 113000 0 1])
xlabel('Time (milliseconds)');
ylabel('Voltage (Volts)');
title('Response of Rather Dynamical Circuit')
legend('x1','x2','x3','x4','x5','x6','x7','x8','x9','x10');


%% Section E Effect of doubling input voltage and Determination of t=0.3004 Voltage
clc
Vin = 2
% found by successive approximations with logspace and linspace for loops
%Vin = 3.7778e+07;

A = [-3 1 1 0 0 0 0 0 0 0;
    1 -1 0 0 0 0 0 0 0 0;
    1 0 -2 1 0 0 0 0 0 0;
    0 0 1 -2 0 1 0 0 0 0;
    0 0 0 0 -1 0 0 0 0 0;
    0 0 0 1 0 -2 1 0 0 0;
    0 0 0 0 0 1 -2 0 1 0;
    0 0 0 0 0 0 0 -1 0 0;
    0 0 0 0 0 0 1 0 -2 1;
    0 0 0 0 0 0 0 0 1 -1;
    ];

B = [Vin; 0; 0; 0; 0; 0; 0; 0; 0; 0];


syms s;
I = eye(10);
resolvent = inv(s*I - A);
Tf = inv(s*I - A)*B;
eigenvalues = eig(A);
QR = qr(A);

% Find settling time of the last voltage x10
t = linspace(0,200,2000001); % millisecond accuracy
sys = ss(A,B,I,0);
%plot(step(sys,t)); xlim([0, 200000]); legend('x1','x2','x3','x4','x5','x6','x7','x8','x9','x10');

[x10,t] = step(sys(10),t);

% get the index of the first element which is above 0.99
display(Vin)
display(t(find(x10 > 0.99, 1) ))



%% Section B: Outputs for Latex
digits(4);

display('Matrix A')
display(['$$' latex(sym(A)) '$$'])
display('Matrix B')
display(['$$' latex(sym(B)) '$$'])
display('Eigenvectors')
display(['$$' latex(sym((vpa(eigenvalues)))) '$$'])
display('Resolvent')
display(['$$' latex(sym(resolvent)) '$$'])
display('Transfer')
display(['$$' latex(sym(Tf)) '$$'])
display('Q')
display(['$$' latex(sym(vpa(Q))) '$$'])
display('R')
display(['$$' latex(sym(vpa(R))) '$$'])

%% 

digits(4)
[V D] = eig(A)
display('V')
display(['$$' latex(sym(vpa(V))) '$$'])
