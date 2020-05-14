clear;clc
%% golden ratio
syms x y(x);
roots = double(solve(x^2-x-1==0))

%% solve ODE
syms x y(x);
eqns = dsolve(diff(y)+y==0, y(0)==1);


%% Ians Math Assignment April 2019
% There's a coffee cup. Find how long it will take to cool down.
% Solve diff(T)+k*T==k*Tinf given that the temperature of the coffee cup is
% originally 95 and the ambient temperature is 25

clear;clc;
syms t k T(t) Tinf b;

%%
clear;clc; syms t k T(t) Tinf b T0;

% The basic system
dsolve( diff(T)+k*T == k*Tinf, T(0)==T0)

% Solve for coffee initially 95 degrees and ambient temperature 25
T0 = 95; Tinf = 25;
dsolve( diff(T)+k*T == k*Tinf, T(0)==T0)

% Find what'll happen when there's an oscillating ambient temperature
T0 = 95; Tinf = 7*sin(pi*t/12)+25;
dsolve( diff(T)+k*T == k*Tinf, T(0)==T0)


%% Make answer pretty again
clear;clc; syms t k T(t) Tinf b T0;
Tinf = 7*sin(b*t)+T0;
dsolve( diff(T)+k*T == k*Tinf, T(0)==T0)
latex(ans)


%% References
MATLAB Online R2019a
https://matlab.mathworks.com/

(18) Symbolic Mathematics in Matlab - YouTube
https://www.youtube.com/watch?v=Anrm7B6yD18

notes - Online LaTeX Editor Overleaf
https://www.overleaf.com/project/5cb3f98ee51a152e6d1dd2bb

How do I get pretty symbolic expressions in MATLAB using fancy? - MATLAB Answers - MATLAB Central
https://au.mathworks.com/matlabcentral/answers/650-how-do-i-get-pretty-symbolic-expressions-in-matlab-using-fancy

How to display answers in original form, rather than automatically in pretty() form ? - MATLAB Answers - MATLAB Central
https://au.mathworks.com/matlabcentral/answers/262113-how-to-display-answers-in-original-form-rather-than-automatically-in-pretty-form

Pretty Equation Viewer - File Exchange - MATLAB Central
https://au.mathworks.com/matlabcentral/fileexchange/55477-pretty-equation-viewer

Polynomial Regression filter implementation - MATLAB Answers - MATLAB Central
https://au.mathworks.com/matlabcentral/answers/285570-polynomial-regression-filter-implementation

8 Handy MATLAB Shortcuts That Will Save You a Ton of Time
https://interestingengineering.com/8-handy-matlab-shortcuts-that-will-save-you-a-ton-of-time
