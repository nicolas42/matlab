close all; clear;

MIN = 0;
MAX = 10;
STEP = 1/50;
f1 = 2*pi*15;
f2 = 2*pi*20;

t = MIN:STEP:MAX-STEP;
x = sin(f1*t);% + sin(f2*t);
y = fft(x);     
f = (0:length(y)-1)*50/length(y);
%When you plot the magnitude of the signal as a function of frequency, the spikes in magnitude correspond to the signal's frequency components of 15 Hz and 20 Hz.

figure('units','normalized','outerposition',[0.5 0 0.5 1]) % [left bottom width height] % https://au.mathworks.com/matlabcentral/answers/102219-how-do-i-make-a-figure-full-screen-programmatically-in-matlab
subplot(2,1,1)
plot(t,x)
subplot(2,1,2)
plot(f,abs(y))
title('Magnitude')
