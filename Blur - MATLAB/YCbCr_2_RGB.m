function [image_RGB] = YCbCr_2_RGB(image_y, image_Cb, image_Cr)
%% Convert Image to RGB
% Converts an YCbCr image into RGB coordinates.
[m, n] = size(image_y);
image_RGB = zeros(m, n, 3);
image_RGB(:,:,1) = image_y + (1.4*(image_Cr-128));
image_RGB(:,:,2) = image_y + (-.343*(image_Cb-128))+(-0.711*(image_Cr-128));
image_RGB(:,:,3) = image_y + (1.765*(image_Cb-128));

image_RGB = uint8(image_RGB);
end