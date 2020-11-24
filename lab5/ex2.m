% Ex 2 -- amplitude modulation

close all;
clear;

T = 128;
t = 1:T;
a = 0.05;

% creating the original signal
s = exp(-a*t);

figure;
plot(t, s);
title('Original signal s(t)');
xlabel('Time');
ylabel('Amplitude');

% computing the spectre using DFT
K = T;
N = T;
dft = zeros(1, K);

for k = 1:K
    for n = 1:N
        dft(k) = dft(k) + s(n) * exp(-1i * 2 * pi * n * k / T);
    end
end

% plotting the custom DFT
figure;
stem(1:T, abs(dft));
title('Old-style Discrete Fourier Transform')
xlabel('Frequency of component (k)');
ylabel('Magnitude of component');

% using fft
figure;
fx = zeros(1, T);
findex = T/2*linspace(0,1,T/2);
fx((T/2)+1:end) = findex;
fx(1:T/2) = [-T/2, -findex(end:-1:2)];
fs = fft(s);
stem(fx, abs(fftshift(fs)));
xlabel('Frequency component (k)');
ylabel('Magnitude of component');
title('Fourier coefficients before amplitude modulation');

% the actual amplitude modulation
f_c = 20/T; 
mod_s = zeros(1, T);
for t = 1:T
   mod_s(t) = (1 + s(t)) * cos(2*pi*f_c*t); 
end

figure;
fx = zeros(1, T);
findex = T/2*linspace(0,1,T/2);
fx((T/2)+1:end) = findex;
fx(1:T/2) = [-T/2, -findex(end:-1:2)];
fs = fft(mod_s);
stem(fx, abs(fftshift(fs)));
xlabel('Frequency component (k)');
ylabel('Magnitude of component');
title('Fourier coefficients after amplitude modulation');