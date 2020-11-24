% s(i) = r(i) - r(i-T) - T*u(i-T)
% i = 0:N
% T intarziere
% r = ramp
% u = unit step

N = 200;
T = 100;

figure;
u = ustep(N);

hold on;
r = ramp(N);
plot(r, 'g-');

hold on;
r_delayed = (-1).*[zeros(1, T), r(1:N-T)];
plot(r_delayed, 'b')

hold on;
u_delayed = (-1).*[zeros(1, T), u(1:N-T)];
plot(T*u_delayed, 'r')

hold on;
s = r + r_delayed + T * u_delayed;
plot(s, 'LineWidth', 2);

legend("r", "-r(t-T)", "-u(t-T)", "sum")
