interval = [0:0.01:1];

sine_1 = sin(2*pi*1*interval);
sine_2 = sin(2*pi*2*interval);

sine_sum = sine_1 + sine_2;

figure;
plot(sine_1);
title('sine 1');

figure;
plot(sine_2);
title('sine 2');

figure;
plot(sine_sum);
title('sine sum');

figure;
plot(sine_1, 'r');
hold on;
plot(sine_2, 'g');
hold on; 
plot(sine_sum, 'b');

legend('freq 1', 'freq 2', 'sum');