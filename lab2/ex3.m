t = [0, pi/6, pi/4, pi/3, pi/2]; 
figure;
plot(exp(1i*t), 'ro'); 

hold on;
plot(exp(-1i*t), 'go');


ss = (exp(1i*t) + exp(-1i*t)).*(1/2);



hold on;
plot(real(ss), imag(ss), 'bo'); % x = real(ss), y =  imag(ss)

