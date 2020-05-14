function [newimg] = filter(image_y, kernel)

img = image_y
%img=rand(5);
%kernel=uint8(ones(9));
kernel=uint8(kernel);

% kernel=uint8([1 2 1; 1 2 1; 1 2 1]); % triangular filter
[m n]=size(img);
newimg=uint8(img);

total = sum(sum(kernel));

margin = (max(size(kernel))-1)/2;

% column major traversal
% i,j is center of kernel
for j = 1+margin:n-margin
    for i = 1+margin:m-margin
        subimg=img(i-margin:i+margin,j-margin:j+margin);
        newimg(i,j)=sum(sum(kernel .* subimg))/total;
    end
end

% imshow([image_y, newimg]); % Assumes same number of rows in each.

