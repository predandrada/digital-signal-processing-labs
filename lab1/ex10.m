interval = [0:0.01:1];
f = 1;

% plot with green color:
% plot(sin(2*pi*f*interval), 'g');

% plot with different line:
% plot(sin(2*pi*f*interval), 'x');

% mat_sin = [sin(2*pi*1*interval); sin(2*pi*2*interval)];
% plot(mat_sin);

plot(interval, sin(2*pi*1*interval), 'g');
hold on;
plot(interval, sin(2*pi*2*interval), 'r');
legend('freq 1', 'freq 2');
title('Ex 10, plotting sine waves')
ylabel('sine values');
xlabel('period');

