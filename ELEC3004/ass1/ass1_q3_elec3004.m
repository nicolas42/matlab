%% 3a

t = linspace(0,1,44100); 
v = @(t) 0.42 * cos(1760 * pi * t) + 0.314 * cos(100 * pi * t) + 1; 
plot(t,v(t));
title("Voltage Signal From Microphone")
xlabel("Time (s)")
ylabel("Voltage (V)");


%% 3b
t = linspace(0,1,1044); 
v = @(t) 0.42 * cos(1760 * pi * t) + 0.314 * cos(100 * pi * t)  + 1; 
stem(t,v(t));
xlabel("Time (s)")
ylabel("Voltage (V)");



%%

clear; clc
% Signal is 880 Hz, noise is 50 Hz
t = linspace(0,1,1044); % sample at 2kHz >2x signal frequency
v = @(t) 0.42 * cos(1760 * pi * t) + 0.314 * cos(100 * pi * t)  + 1; 

d = fdesign.highpass('Fst,Fp,Ast,Ap',0.2,0.4,60,1);

Hd = design(d,'equiripple');
%fvtool(Hd)
y = filter(Hd,v(t));

stem(y)
title("Signal after applying highpass filter")
xlabel("Samples")
ylabel("Voltage (V)");

%% 

plot(y(1:100))


