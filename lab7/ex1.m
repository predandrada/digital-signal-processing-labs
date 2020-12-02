%% Ex 1 

clear;
close all;

load('noisy_signal.mat');
N = 128;
fs = N;

%% Compute DFT and compare with fft

dft_signal = compute_dft(noisy_signal, N);
%t = -N:N;
t = linspace(0, 1, N);
figure;
plot(t, real(dft_signal));
title('Signal with noise');
xlabel('Time(s)');

%figure;
%plot(t, fft(noisy_signal));
%title('Signal with fft noisy');

figure;
stem(abs(fft(noisy_signal)));
title('Frequency spectrum of noisy signal (fft)');
xlabel('DFT frequency index');


figure;
stem(fftshift(abs(fft(noisy_signal))));
title('Frequency spectrum of noisy signal (fftshift)');
xlabel('DFT frequency index');

%% compute SNR
% we are interested in k = -9 ... 9 
% going from 10 to 120
signal_power = 0;
aux = dft_signal;

%% computing signal pow
for k = 1:9
   signal_power = signal_power + abs(aux(k))^2;
end

for k = 120:N
   signal_power = signal_power + abs(aux(k))^2;
end

signal_power = signal_power/19;

%% computing noise pow
noise_power = 0;

for k = 1:N
   noise_power = noise_power + abs(aux(k))^2;
end

noise_power = noise_power/N;

%% snr
snr = signal_power/noise_power;

disp(log10(snr));

%% reconstruct using idft
clean_signal = fft(noisy_signal);
clean_signal(11:119) = 0;

idft_signal = compute_idft(clean_signal, N);
figure;
plot(t, real(idft_signal));
title('Digital signal using idft');
xlabel('Time(s)');

%% reconstruct using ifft
idft_signal = ifft(clean_signal);

figure;
plot(t, real(idft_signal));
title('Digital signal using ifft');
xlabel('Time(s)');