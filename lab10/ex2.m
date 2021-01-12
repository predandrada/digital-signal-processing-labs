%% Ex 2 -- Decoding a hidden image
clear;
close all;

%% 1 --  compute spectrum 
initial_image = imread("stego_img.bmp");

figure;
imshow(initial_image);
title('Initial image');
spectrum = abs(fft2(initial_image));
figure, imagesc(log(spectrum)); 

%% 2 -- why is the image mirrored 3 times?
% because of the symmetry of the spectrum in real & complex? complex
% conjugate?

%% 3 & 4 -- normalize the spectrum & select only the secret image
normalized_spectrum = normalize(double(spectrum(101:340, 101:420)));

figure;
imshow(normalized_spectrum);
title('also this');