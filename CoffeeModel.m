%%Coffee Model April 2019
% There's a coffee cup. Find how long it will take to cool down.
% Use law of cooling T' = k(T(t)-Tinf) ; T Temperature and Tinf ambient
% temperature

clear;clc; syms t k T(t) Tinf b T0;

% The basic system
dsolve( diff(T)+k*T == k*Tinf, T(0)==T0)

% Solve for coffee initially 95 degrees and ambient temperature 25
T0 = 90; Tinf = 30;
dsolve( diff(T)+k*T == k*Tinf, T(0)==T0)

% Find what'll happen when there's an oscillating ambient temperature
T0 = 95; Tinf = 7*sin(pi*t/12)+25;
dsolve( diff(T)+k*T == k*Tinf, T(0)==T0)


%% 
clear;clc; syms t k T0 T(t) Tinf(t) ;
digits(4)
k = 0.1 %-6*log(3/10) %vpa(-6*log(3/10))
T0 = 90
Tinf(t) = 7*sin(pi*t/12)+25 % vpa(7*sin(pi*t/12)+T0)
Tsol(t) = dsolve( diff(T)+k*T == k*Tinf, T(0)==T0)

T = linspace(0,100,1001); Temps = []; Ambs = [];
for t = T
    Ambs = [Ambs; Tinf(t)];
    Temps = [Temps; Tsol(t)];

end
plot(T, Ambs, T, Temps);
title("Temperature of Coffee with Oscillating Ambient Temperature");
xlabel("Seconds"); ylabel("Degrees C");


%% Plot flow

[t, T] = meshgrid(linspace(0,100,11),linspace(0,100,11));
k = 0.1; %-6*log(3/10);
T0 = 90; Tinf = 30;
figure();
quiver(t, T, ones(length(t)), -k*(T-Tinf))


%% References
% MATLAB Online R2019a
% https://matlab.mathworks.com/
% 
% (18) Symbolic Mathematics in Matlab - YouTube
% https://www.youtube.com/watch?v=Anrm7B6yD18
% 
% notes - Online LaTeX Editor Overleaf
% https://www.overleaf.com/project/5cb3f98ee51a152e6d1dd2bb
% 
% How do I get pretty symbolic expressions in MATLAB using fancy? - MATLAB Answers - MATLAB Central
% https://au.mathworks.com/matlabcentral/answers/650-how-do-i-get-pretty-symbolic-expressions-in-matlab-using-fancy
% 
% How to display answers in original form, rather than automatically in pretty() form ? - MATLAB Answers - MATLAB Central
% https://au.mathworks.com/matlabcentral/answers/262113-how-to-display-answers-in-original-form-rather-than-automatically-in-pretty-form
% 
% Pretty Equation Viewer - File Exchange - MATLAB Central
% https://au.mathworks.com/matlabcentral/fileexchange/55477-pretty-equation-viewer
% 
% Polynomial Regression filter implementation - MATLAB Answers - MATLAB Central
% https://au.mathworks.com/matlabcentral/answers/285570-polynomial-regression-filter-implementation
% 
% 8 Handy MATLAB Shortcuts That Will Save You a Ton of Time
% https://interestingengineering.com/8-handy-matlab-shortcuts-that-will-save-you-a-ton-of-time
