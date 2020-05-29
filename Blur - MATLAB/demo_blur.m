clear all; close all; clc;

% Load image
original = imread('Lenna.png');
BW = rgb2gray(original);

% Kernels
% M_v = [-1, -2, -1; 0, 0, 0; 1, 2, 1]; %Mask to detect vertical edges
% M_h = [-1, 0, 1; -2, 0, 2; -1, 0, 1]; %Mask to detect horizontal edges
blur_kernel = [1,1,1;1,1,1;1,1,1]; 

[m, n] = size(BW);
result = zeros(m, n);
for j = 2:n-1
    for i = 2:m-1
        
        window = [BW(i-1,j-1),BW(i,j-1),BW(i+1,j-1); BW(i-1,j),BW(i,j),BW(i+1,j); BW(i-1,j+1),BW(i,j+1),BW(i+1,j+1)];
        window = double(window);

        result(i,j) = (sum(sum(blur_kernel .* window)) / sum(sum(abs(blur_kernel))));

%         image_edges_y(i,j) = (sum(sum(M_v.*kernel))/sum(sum(abs(M_v))));
%         image_edges_x(i,j) = (sum(sum(M_h.*kernel))/sum(sum(abs(M_h))));
    end
end

% image_edges_y = image_edges_y./max(max(image_edges_y));
% image_edges_x = image_edges_x./max(max(image_edges_x));
% for j = 2:n-1
%     for i = 2:m-1
%         image_edges(i, j) = sqrt( (image_edges_y(i,j)*image_edges_y(i,j)) + (image_edges_x(i,j)*image_edges_x(i,j)) );
%     end
% end
        
% saveas(gcf, 'blur.png');

montage({uint8(BW), uint8(result)})
