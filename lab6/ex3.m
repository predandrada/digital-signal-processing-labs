% Ex 3 -- signal reconstruction

close all;
clear;

f = 1;
N = 5000;
t = linspace(0, 3, N);

% computing the 'analog' signal
x = sin(2 * pi * f * t);

%plotting 
figure;
stem(t, x);
title('Analog signal');

% the smaller signal
t_smol = linspace(0, 3, N/100);
x_smol = sin(2 * pi * f * t_smol);

% plotting
figure;
stem(t_smol, x_smol);
title('Digital-ish signal');

% reconstructing the digital signal
x_reconstructed = zeros(5000,1);
for i = 1:50
    x_reconstructed(i*100) = x_smol(i);
end

% plotting
figure;
stem(t, x_reconstructed);
title('Reconstructed analog signal');

% convolution
N_sinc = N;
samples_digital = 5000/3/100;
t_sinc = linspace(-0.2, 0.2, N_sinc/10);
sincvec = sinc(samples_digital*t_sinc);
s_cont_filtered = conv(x_reconstructed', sincvec, 'same');

% plotting 
figure;
stem(t, s_cont_filtered);
title('Convolution');

