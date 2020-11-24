% Ex 2 -- Filtering 

close all;
clear;

% 1 -- creating the original signal and plotting it
A = 1;
T = 100;
t = [1:T];
delta = T/5;
s = zeros(1, T);

% delta points are not 0
for i = 40:40+delta
    s(i) = 1;
end

figure;
plot(t, s);
title('Original signal s(t)');
xlabel('Time');
ylabel('Amplitude');

% 2 -- computing the first N = 30 coefficients
k_max = 30;
k = 0:k_max;
N = length(k);
c = zeros(1, N);

for i = 1:N
    c(i) = A * exp((-1) * 1i * pi * k(i) * delta / T) * (delta / T) * sinc(pi * k(i) * delta / T);
end

figure;

stem(k, abs(c));
xlabel('Frequency component (k)');
ylabel('Magnitude of component');
title('Fourier coefficients c_k');

% 3 -- fourier coefficients for output signal
% chosen cutoff frequencies:
f_c1 = 0.1/T; % strong filtering
f_c2 = 1/T; % fundamental freq, half power
f_c3 = 10/T; % weak filtering

% fc_1
c_y = zeros(1, N);
RC = (1 / 2 * pi * f_c1);

for i = 1:N
    c_y(i) = c(i) / (1 + 1i * 2 * pi * RC * k(i) / T); 
end

figure;
stem(k, abs(c_y));
title('Fourier coefficients for f_c1');
xlabel('Frequency component (k)');
ylabel('Magnitude of component');

% fc_2
c_y = zeros(1, N);
RC = (1 / 2 * pi * f_c2);

for i = 1:N
    c_y(i) = c(i) / (1 + 1i * 2 * pi * RC * k(i) / T); 
end

figure;
stem(k, abs(c_y));
title('Fourier coefficients for f_c2');
xlabel('Frequency component (k)');
ylabel('Magnitude of component');

% fc_3
c_y = zeros(1, N);
RC = (1 / 2 * pi * f_c3);

for i = 1:N
    c_y(i) = c(i) / (1 + j * 2 * pi * RC * k(i) / T); 
end

figure;
stem(k, abs(c_y));
title('Fourier coefficients for f_c3');
xlabel('Frequency component (k)');
ylabel('Magnitude of component');

% 4 -- reconstructing the output signal 
s_rec = zeros(1, T);
k = 0:k_max; 
for t_idx = 1:T
    for k_idx = 1:length(k)
        aux1 = c_y(k_idx) * exp(2 * pi * k(k_idx) * t_idx * 1i /T);
        % adding conjugates
        aux2 = conj(c_y(k_idx)) * exp((-2) * pi * k(k_idx) * t_idx * 1i /T); 
        s_rec(t_idx) = s_rec(t_idx) + aux1 + aux2;
    end
end

figure;
plot(t, s_rec);
title('Reconstructed output signal');
xlabel('Time');
ylabel('Amplitude');
