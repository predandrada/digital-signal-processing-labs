% v_in = 7;
% v_out = 0;
% e_in = 0;

N = 20;
y = zeros(1,N);
y(1) = 7;
x = 60.*ones(1, N); % pilot sequence
e = zeros(1, N); 

for i=1:N-1
    % computing the difference:
    e(i) = x(i) - y(i);
    y(i+1) = S1(y(i), e(i));
end

figure;
plot(y);
