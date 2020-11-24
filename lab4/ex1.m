% Ex 1 -- Signal approximation

close all;
clear;

% 1 -- creating the original signal as indicated
A = 1;
T = 100;
t = 1:T;
s = -A * ones(1, T);
s(1:(T/2)) = A;

% plotting the original signal
figure;
plot(t, s);
title('Original signal s(t)');
xlabel('Time');
ylabel('Amplitude');

% 2 -- approximating the signal
k_max = 500;
k = 0:k_max;
N = length(k);
c = zeros(1, N);

% computing the Fourier coefficients
for i = 1:N
    if mod(k(i), 2) == 1
        c(i) = 2 / (pi * 1i * k(i)) * A;
    end
end

c_res =  zeros(1, N);
for i = 1:N
    c_res(i) = abs(c(i)^2);
end

% plotting the amplitudes |c_k|^2
figure;
stem(k, c_res);
title('Fourier coefficients |c_k|^2');
xlabel('Frequency of component (k)');
ylabel('Magnitude ^2 of component');

% 3 -- computing the root mean square using perseval's theorem
% this is actually a squared value of what we want to achieve
rms = ones(1, N) .* (A^2); % all the elements are 1 since A .^ 2 = 1
for i = 1:k_max
    for k_idx = 2:i
        % subtracting the fourier coefficient 
        rms(i) = rms(i) - 2 * c_res(k_idx);
    end
    % the current rms value is squared, therefore compute sqrt
    rms(i) = sqrt(rms(i) - c_res(1)); % if 2 * is missing, the computation is not accurate (??)
end

% using multiple plots to showcase the result
figure;
plot(k, real(rms));
title('Root mean square using plot');
xlabel('Frequency component (k)');
ylabel('Relative rms error');

figure;
semilogy(k, real(rms));
title('Root mean square using semilogy');
xlabel('Frequency component (k)');
ylabel('Relative rms error');

figure;
loglog(k, real(rms));
title('Root mean square using loglog');
xlabel('Frequency component (k)');
ylabel('Relative rms error');

% 4 -- the smallest value for N is 164, as seen on the plot 
interval = find(rms < 0.05);
N = interval(1); % should be 164

t = 1:100;
s_rec = zeros(1, T);
k = 0:N; 
for t_idx = 1:T
    for k_idx = 1:length(k)
        aux1 = c(k_idx) * exp(2 * pi * k(k_idx) * t_idx * 1i /T);
        % adding conjugates
        aux2 = conj(c(k_idx)) * exp((-2) * pi * k(k_idx) * t_idx * 1i /T); 
        s_rec(t_idx) = s_rec(t_idx) + aux1 + aux2;
    end
end

figure;
plot(t, s_rec);
title('Reconstructed signal');
xlabel('Time');
ylabel('Amplitude');
xlim([0, 100]); % since the plot looks better this way