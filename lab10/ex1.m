%% Ex 1 -- Phase & modulation of the Fourier coefficients 

clear;
close all;

%% 1 -- load the image and convert values to [0, 1]
image = imread("fine.jpg");
image_gray = double(rgb2gray(image));
image_gray = image_gray/255;

figure;
imshow(image);
title('Initial image');

figure;
imshow(image_gray);
title('Image after rgb2gray');

%% 2 -- find spectrum using fft2
spectrum = fft2(image_gray);

%% 3 -- only keeping the module of the coefficients |S|
% recreating the image using ifft2

spectrum_abs = abs(spectrum);
result_spectrum = ifft2(spectrum_abs);

figure;
imshow(result_spectrum);
title('Recreated image (only module of coefficients)');

%% 4 -- only keeping the phase & reconstructing the image
phase = spectrum ./ spectrum_abs;
result_phase = ifft2(phase);

figure;
imshow(result_phase);
title('Recreated image (only phase)');

%% 5 -- normalize 
normalized_spectrum = normalize(result_spectrum);
figure;
imshow(normalized_spectrum);
title('Recreated image (normalized spectrum)');

normalized_phase = normalize(result_phase);
figure;
imshow(normalized_phase);
title('Recreated image (normalized phase)');