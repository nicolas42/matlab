clear all; close all; clc;

% Load image
original = imread('Lenna.png');
BW = rgb2gray(original);

% Kernels
sobel_kernel_v = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
sobel_kernel_h = [-1, 0, 1; -2, 0, 2; -1, 0, 1];

[m, n] = size(BW);
result = zeros(m, n);
result_x = zeros(m, n);
result_y = zeros(m, n);
for j = 2:n-1
    for i = 2:m-1
        
        window = [BW(i-1,j-1),BW(i,j-1),BW(i+1,j-1); BW(i-1,j),BW(i,j),BW(i+1,j); BW(i-1,j+1),BW(i,j+1),BW(i+1,j+1)];
        window = double(window);

        result_y(i,j) = (sum(sum(sobel_kernel_v .* window)) / sum(sum(abs(sobel_kernel_v))));
        result_x(i,j) = (sum(sum(sobel_kernel_h .* window)) / sum(sum(abs(sobel_kernel_h))));
    end
end

result_y = result_y./max(max(result_y));
result_x = result_x./max(max(result_x));
for j = 2:n-1
    for i = 2:m-1
        result(i, j) = sqrt( (result_y(i,j)*result_y(i,j)) + (result_x(i,j)*result_x(i,j)) );
    end
end

montage({BW, result})
