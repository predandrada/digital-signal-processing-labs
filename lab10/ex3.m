%% Ex 3 -- Encoding an image in the spectrum of another image

clear;
close all;

%% 1 -- compute spectrum of transport image
transport_image = imresize(imread("fine.jpg"), 2);
transport_spectrum = fft2(transport_image);

secret_image = imresize(imread("pikachu.jpg"), 0.5);

%% 2 -- select the area for secret injection -> I chose to go 200p in
[transp_height, transp_width] = size(transport_image);
[secret_height, secret_width] = size(secret_image);

%% 3 -- replace values in spectrum
abs_transp_spectrum = abs(transport_spectrum);

medie = mean(mean(abs_transp_spectrum(200:(200+secret_height-1), 200:(200+secret_width-1))));
scaled_secret_image = secret_image * 3 * medie;
abs_transp_spectrum(200:(200+secret_height-1), 200:(200+secret_width -1)) = scaled_secret_image;