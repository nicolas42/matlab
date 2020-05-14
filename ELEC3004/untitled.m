close all; clear; clc;
syms x1(t) x2(t) x3(t) x4(t) x5(t) x6(t) x7(t) x8(t) x9(t) x10(t) t xSol


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

B = [1; 0; 0; 0; 0; 0; 0; 0; 0; 0];

X = [x1;x2;x3;x4;x5;x6;x7;x8;x9;x10];

odes = diff(X) == A*X + B
%Solve the matrix equation using dsolve. Simplify the solution by using the simplify function.

xSol = dsolve(odes);

%Solve the system with the initial conditions u(0) = 2 and v(0) = ?1. When specifying equations in matrix form, you must specify initial conditions in matrix form too. dsolve finds values for the constants that satisfy these conditions.

C = X(0) == [0;0;0;0;0;0;0;0;0;0];
xSol = dsolve(odes,C)
