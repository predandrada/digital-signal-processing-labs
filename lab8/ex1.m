%% Ex 1 -- DFT leakage & zero-padding

clear;
close all;

A1 = 1;
A2 = 0.5;
fs = 8000;
f1 = 1000;
f2 = 2000;
N = 8;
ts = 1/fs;
%plot_t = linspace(0, 8000, N);
plot_t = linspace(0, N-1, N) * (fs/N);

t = 0:N-1;
s1 = A1 * sin(2*pi*f1*t*ts);
s2 = A2 * sin(2*pi*f2*t*ts);
s = s1 + s2;

figure;
plot(t, s1);
hold on;
plot(t, s2);
hold on;
plot(t, s);
title('Two sinewaves');
xlabel('Sample index');
ylabel('Amplitude');
legend('s1', 's2', 's1 + s2');

%% computing dft using fft
dft_s = fft(s);

figure;
stem(plot_t, abs(dft_s));
title('FFT of signal');
xlabel('DFT frequency index');
ylim([0, 4]);

%% f1 = 0
% there should only be values hitting 2kHz

dft_s2 = fft(s2);

figure;
stem(plot_t, abs(dft_s2));
title('FFT for f1 = 0');
xlabel('DFT frequency index');

%% f2 = 2500Hz
% the energy from f2 should be distributed to the adjacent frequencies
f2 = 2500;
s2 = A2 * sin(2*pi*f2*t*ts);
dft_s2 = fft(s2);

figure;
stem(plot_t, abs(dft_s2));
title('FFT for f2 = 2500');
xlabel('DFT frequency index');

%% increasing the number of samples for a better observation of the leakage
% only N = 8 samples are not 0
K = 64;
k = zeros(1, K);
s1_k = zeros(1, K);
s2_k = zeros(1, K);
s_k = zeros(1, K);
v = linspace(0, fs, K);

for i = 1:N
   s1_k(K-i+1) =  A1 * sin(2*pi*f1*i*ts);
   s2_k(K-i+1) =  A2 * sin(2*pi*f2*i*ts);
   s_k(K-i+1) = s1_k(K-i+1) + s2_k(K-i+1);
end

plot_t_k = linspace(0, 8000, K);

dft_s_k = fft(s_k);
figure;
stem(v, abs(dft_s_k));
title('FFT of signal with zero padding');
xlabel('DFT frequency index');
%ylim([0, 4]);


%% f2 = 2000 Hz, still using zero padding 
f2 = 2000;
for i = 1:N
   s2_k(K-i+1) =  A2 * sin(2*pi*f2*i*ts);
end
s_k = s1_k + s2_k;
dft_s_k = fft(s_k);

figure;
stem(v, abs(dft_s_k));
title('FFT for f2 = 2000 with zero padding');
xlabel('DFT frequency index');
