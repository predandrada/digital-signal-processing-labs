%% Ex 2 -- FIR filter
% creating the x sequence for a low-pass filter

clear;
close all;

N = 256;
plot_t = linspace(0, 1, N);
% the first & last 16 elements are 1, the rest should be zeros

HK = ones(1, N);
HK(17:N-16) = 0;

figure;
plot(plot_t, HK);
title('Ideal low-pass filter');

%% 1) applying ifft

hk = ifftshift(ifft(HK));

figure;
stem(real(hk));
title("hk after ifft");

%% 2) truncating hk
L = 65;

[max_el, max_ind] = max(hk);

% 32 from the left & 32 from the right of the max
trunc_hk = hk(max_ind - 32: max_ind + 32);

figure;
stem(real(trunc_hk));
title("trunc_hk");

%% 3) apply DFT and plot spectrum
trunc_dft = fft(trunc_hk);
plot_trunc = linspace(0, 1, L);

figure;
plot(plot_trunc, abs(trunc_dft));
title('DFT on truncated sequence');

%% 4) using blackman
res_blk = trunc_hk .* blackman(L)';

figure;
plot(plot_trunc, abs(fft(res_blk)));
title('DFT on blackman');

%% 5) reuse sin from Ex 1 and do conv with the result of 4)
N = 64;
f = 3000;
fs = 64000;
ts = 1/fs;

x = zeros(1, N);
for i = 1:N
    x(i) = sin(2*pi*f*ts*i);
end

% filter by conv
res = conv(x, res_blk);

figure;
stem(real(res));
title('Conv between sin & blackman');
