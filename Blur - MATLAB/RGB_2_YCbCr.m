function [image_y, image_Cb, image_Cr] = RGB_2_YCbCr(image)
%% Convert Image to YCbCr
% Converts an RGB image into Y, Cb, Cr coordinates.

% Where image(:,:,1), image(:,:,2) & image(:,:,3) corresponds to
% red, green & blue respectively.

image_y = (0.299 * image(:,:,1)) + (0.587 * image(:,:,2))...
    + (0.114 * image(:,:,3));
image_Cb = (-0.169 * image(:,:,1)) + (-0.334 * image(:,:,2))...
    + (0.5 * image(:,:,3)) + 128;
image_Cr = (0.5 * image(:,:,1)) + (-0.419 * image(:,:,2))...
    + (-0.081 * image(:,:,3)) +128;
end