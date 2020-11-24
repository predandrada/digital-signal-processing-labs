% Ex 1 -- frequency shifting 

clear;
close all;

% creating & plotting the original signal
T = 100;
A = 1;
t = 1:T;

s = ones(1, T);
s(T/2:T) = -A;

figure;
plot(t, s);
title('The original signal s(t)');
xlabel('Time');
ylabel('Amplitude');
ylim([-A-1, A+1]); % for a better observation

% computing Fourier coefficients for k = {-81..81}
k_max = 81;
k = -k_max:k_max;
N = length(k);
c_k = zeros(1, N);

for i = 1:N
    if mod(k(i), 2) == 1
        c_k(i) = (2/(1i*pi*k(i))) * A;
    end
end

figure;
stem(k, abs(c_k));
title('The Fourier coefficients c_k before the shift');
xlabel('Frequency component (k)');
ylabel('Magnitude of component');

% shift spectrum in frequency by T/4
shift = T/4;
shifted_c = zeros(1, N);
for i = 1:N
   % disp(exp(-1i*2*pi*shift*f));
   % shifted_c(i) = c_k(i) * exp(-(1i)*2*pi*k(i)*shift/T);
   shifted_c(i) = c_k(i) * exp(-(1i)*pi*k(i)/2); % simplified
end

% plotting the coefficients
figure;
stem(k, abs(shifted_c));
title('The Fourier coefficients c_k after the shift');
xlabel('Frequency component (k)');
ylabel('Magnitude of component');

% Observing the coefficients
figure;
plot(rad2deg(angle(shifted_c)));
title('Observing the coefficients');

% reconstructing the signal
sr = zeros(1, T);
f = 1/T;
for t=1:T
    for i=1:N
        % aux1 = shifted_c(i) * exp(1i*2*pi*k(i)*t*f);
        % aux2 = conj(shifted_c(i) * exp(1i*(-2)*pi*k(i)*t*f));
        % sr(t) = sr(t) + aux1 + aux2;
        sr(t) = sr(t) + shifted_c(i) * exp(1i*2*pi*k(i)*t*f);
    end
end

t = 1:100;

figure;
plot(t, real(sr));
ylim([-A-2, A+2]); % for a better observation
title('The reconstructed signal s_r_e_c(t)');
xlabel('Time');
ylabel('Amplitude');
