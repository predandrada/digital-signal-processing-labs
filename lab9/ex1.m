%% Ex 1 -- Convolution

close all;
clear;

x = [1, 3, 5, 7, 5, 4, 2];
h = [0.1, 0.3, 0.1];

[~, N] = size(x);
[~, M] = size(h);

% 1)
y_len = N - M + 1; 

%% 2)
y = zeros(y_len, 1);
reversed_x = flip(x);

y = conv(h, x);

figure;
plot(y);
title('Ex 1 -- 2)');

%% 3)
N = 64;
f = 3000;
fs = 64000;
h = [0.1, 0.2, 0.2, 0.2, 0.1];

ts = 1/fs;

s = zeros(1, N);
for i = 1:N
    s(i) = sin(2*pi*f*ts*i);
end

[~, N] = size(s);
[~, M] = size(h);
y_len = N - M + 1; 

y = conv(h, s);

figure;
stem(y);
title('Ex 1 -- part 3');

%% 4)

new_x = [0, 0, 0, 0, 1, 0, 0, 0, 0];
y = conv(h, new_x);

figure;
stem(y);
title('Ex 1 -- part 4');