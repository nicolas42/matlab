clear all; close all; clc;

%% Load image
image_in = imread('Lenna.png');

%% Pass image through RGB to Luminance, Red-Difference and Blue-Difference
% Chrominances

[image_y, image_Cb, image_Cr] = RGB_2_YCbCr(image_in);

% Resultant luminance image
[image_yRGB] = YCbCr_2_RGB(image_y, 128, 128);
figure()
imshow(uint8(image_y));
title('Test image represented with luminance')

%% Pass image through Sobel Edge detection

[image_edges] = Sobel_Edge_Detection(image_y);