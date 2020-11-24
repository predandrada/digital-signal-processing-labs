% Ex 1 -- Simple processing 

close all;
clear;

N = 128;
f = [1, 2, 10, 20, 100];
T_s = 1/128;
t = [0:T_s:N*T_s]; % len 129 

x = zeros(129, 1);
y = zeros(129, 1);

% creating each signal % processing it 
for i = 1:5

    % computing the original
    x = sin(2 * pi * f(i) * t); 
    
    % starting from index 5 since we need 5 values of x at a time
    for j = 5:N
       y(j) = 0.2 * (x(j-4) + x(j-3) + x(j-2) + x(j-1) + x(j)); 
    end
    
    % using filter
    %filt_y = zeros(128, 1);
    %filter(0.2.*t(1:129), x, filt_y);
    
    % plotting the result
    figure;
    plot(t, x, 'r');
    hold on;
    plot(t, y, 'b');
    %hold on;
    %plot(t, filt_y, 'g');
    title(sprintf('Results using frequency %d', f(i)));
    legend('original', 'processed');
end

