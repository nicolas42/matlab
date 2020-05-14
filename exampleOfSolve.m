%% Example of how to use solve to solve an equation
syms q k d a h
solve((q*k*d)^2/h == a^2*(d^2 - (q*k)^2/h), a)

%%
syms x
solve(1/(x+2)-2/x == 3/(x-1), x)