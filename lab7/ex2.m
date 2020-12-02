%% Ex 2

clear;
close all;

S = load('noisy_sound.mat');
s = S.noisy_sound;
fs = S.fs;

% listen to this 
% sound(s);

N = length(s);
t = linspace(0, 1, N);

% each element corresponds to k/3 (from formula k*8000/24000) -> sound in
% 1->1500 & 22500->25000 (??)

%% computing signal pow
fft_s = fft(s);
signal_power = 0;

for k = 1:1500
   signal_power = signal_power + abs(fft_s(k))^2;
end

for k = 22500:N
   signal_power = signal_power + abs(fft_s(k))^2;
end

signal_power = signal_power/3000;

%% computing noise pow
% update: here the noise is only where there is no actual sound
noise_power = 0;

for k = 1501:22499
   noise_power = noise_power + abs(fft_s(k))^2;
end

noise_power = noise_power/N;

%% snr
snr = signal_power/noise_power;

disp(log10(snr));

%% recreating the signal
clean_signal = fft_s;
clean_signal(1500:22499) = 0;

sound(real(ifft(clean_signal)));

%idft_signal = compute_idft(clean_signal, N);
%figure;
%plot(t, real(idft_signal));
%title('Digital signal using idft');
%xlabel('Time(s)');
%sound(real(compute_idft(clean_signal, N)));

%idft_signal = ifft(clean_signal);
%figure;
%plot(t, real(idft_signal));
%title('Digital signal using ifft');
%xlabel('Time(s)');
