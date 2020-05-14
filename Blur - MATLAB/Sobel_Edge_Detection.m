function [image_edges] = Sobel_Edge_Detection(image_y)
%% Finds edges of image using Sobel Edge Detection

%% Contruct Horizontal and Vertical Mask

M_v = [-1, -2, -1; 0, 0, 0; 1, 2, 1]; %Mask to detect vertical edges
M_h = [-1, 0, 1; -2, 0, 2; -1, 0, 1]; %Mask to detect horizontal edges

%% Convolve vertical and horizontal mask over image
[m, n] = size(image_y);
image_edges_y = zeros(m, n);
image_edges_x = zeros(m, n);
image_edges = zeros(m, n);
for j = 2:n-1
    for i = 2:m-1
        kernel = [image_y(i-1,j-1),image_y(i,j-1),image_y(i+1,j-1);...
            image_y(i-1,j),image_y(i,j),image_y(i+1,j);...
            image_y(i-1,j+1),image_y(i,j+1),image_y(i+1,j+1)];
        kernel = double(kernel);
        image_edges_y(i,j) = (sum(sum(M_v.*kernel))/sum(sum(abs(M_v))));
        image_edges_x(i,j) = (sum(sum(M_h.*kernel))/sum(sum(abs(M_h))));
    end
end
image_edges_y = image_edges_y./max(max(image_edges_y));
image_edges_x = image_edges_x./max(max(image_edges_x));
for j = 2:n-1
    for i = 2:m-1
        image_edges(i, j) = sqrt((image_edges_y(i,j)*image_edges_y(i,j))+(image_edges_x(i,j)*image_edges_x(i,j)));
    end
end
        
figure()
imshow(image_edges)
saveas(gcf, 'Edges.png');
end
