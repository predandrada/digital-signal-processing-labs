%% Ex 3

clear;
close all;

img = imread('peppers.png');

figure;
imshow(img);
title('Original image');

img = double(rgb2gray(img))/255;

figure;
imshow(img);
title('Grayscale');

S = fft2(img);

% choosing a value for the cut
k = 20;

%% cutting out low freq
[lin col] = size(img);

S1 = zeros(lin, col);
for i = 1:lin
    for j = 1:col
        if i < k || i > (lin - k)
            if j < k || j > (col - k)
                S1(i, j) = S(i,j);    
            end
        end 
    end
end

%% cutting out high freq

S2 = S;
for i = 1:lin
    for j = 1:col
        if i < k || i > (lin - k)
            if j < k || j > (col - k)
                S2(i, j) = 0;    
            end
        end 
    end
end
reconstructed_img1 = ifft2(S1);
reconstructed_img2 = ifft2(S2);

figure;
imshow(real(reconstructed_img1));
title('After low-pass filter');

figure;
imshow(real(reconstructed_img2));
title('After high-pass filter');