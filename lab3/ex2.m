% use ylim to adjust the vertical limit of the plot
% Fourier coefficients c_k for k = [-k_max, k_max]

% part 1 -- recreating the original signal 

T = 100;
A = 3;
t = [1:100];

% signal with an amplitude of 3 over the first 50 samples
% amplitude of -3 over the last 50 samples
s_rec = ones(1, T);
for i = 1:T
    if i/50 < 1
        s_rec(i) = 3;
    else 
        s_rec(i) = -3;
    end 
end

figure;
plot(s_rec);
title("Original signal s(t)");
ylim([-A-1, A+1]);
xlabel("Time");
ylabel("Amplitude");


% part 2 -- Fourier coefficients 
% using stem for better data visualisation

k_max = 50;
k = [-k_max:k_max]
c_k = zeros(1, T+1);

for i = 1:T
    if mod(k(i), 2) == 1
        c_k(i) = (2/(j * pi * k(i))) * A;
    end
end


figure;
title("Fourier coefficients");
xlabel("Frequency component (k)");
ylabel("Magnitude of component");
stem(k, abs(c_k));


% part 3 -- reconstructing the signal
% syms k x
% sum = symsum(c_k * exp(j*(2*pi*k*t)/T), k, -T, T);

t = 1:101
k_max = 50;
k = [-k_max:k_max]
total_sum = 0;

s_rec = zeros(1, T+1)
for i = 1:100
    s_rec(i) = 0;
    for idx = 1:100
        s_rec(i) = s_rec(i) + c_k(idx) * exp(j*((2 * pi * i * k(idx))/T));
    end 
end

figure;
plot(t, s_rec);
title("Reconstructed signal s(t)");
xlabel("Time");
ylabel("Amplitude");
xlim([0, 100]);





