% Ex 2 -- bandpass sampling
% reducing the sampling frequency

close all;
clear;

% 1) conjugate symmetry x(n) = x*(-n)

% DFT
f = 3000;
f_s = 4000;
N = 64;
T_s = 1/f_s;
t = 0:T_s:100*T_s;

% computing the original
x1 = sin(2 * pi * f * t); 
    
% plotting
figure;
fx = zeros(1, N);
fidx = (f_s/N) * linspace(0,N-1,N);
spectrum = fft(x1, N);
stem(fidx, abs(spectrum));
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Spectrum of x1');

% using fftshift on the result
figure;
fidx = (f_s/N)*linspace(-N/2, N/2-1, N);
stem(fidx, abs(fftshift(spectrum)));
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Zero-centred frequency spectrum of x1');