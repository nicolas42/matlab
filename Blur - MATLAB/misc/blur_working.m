clear all; close all; clc;

%% Load image
image_in = imread('Lenna.png');

%% Pass image through RGB to Luminance, Red-Difference and Blue-Difference
% Chrominances

[image_y, image_Cb, image_Cr] = RGB_2_YCbCr(image_in);

% Resultant luminance image
[image_yRGB] = YCbCr_2_RGB(image_y, 128, 128);
figure()
%imshow(uint8(image_y));
title('Test image represented with luminance')

I1 = image_y;

%% blur filter
% assumes square filter with odd size

kernel = uint8(ones(3));
I2 = filter1(image_y, kernel);
I3 = filter1(image_y, ones(9));
I4 = filter1(image_y, [1 2 1; 1 2 1; 1 2 1]);

%imshow([image_y, newimg]); % Assumes same number of rows in each.

figure(1),
set(gcf, 'Position', get(0,'Screensize')); 
subplot(2,2,1), imshow(I1); title('Original Image');
subplot(2,2,2), imshow(I2); title('ones(3)');
subplot(2,2,3), imshow(I3); title('ones(9)');
subplot(2,2,4), imshow(I4); title('[1 2 1; 1 2 1; 1 2 1]');
