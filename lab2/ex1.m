% x(t) = A1 * sin (2*pi*f1*t) + A2 * sin (2*pi*f2*t)

% What is the smallest interval to be used in a transmission with 1200 - 1600 Hz so
% that the number of cycles resulted is an integer?
% the least common multiplier?
figure;

f1 = 1600;
f2 = 1800;
t1 = [0:100:1600];
t2 = [0:100:1800];
t3 = [0:1/200000:1/200];
A1 = 1;
A2 = 1;

figure;
t = t3;
x = A1 * sin (2*pi*f1*t);
plot(x);
hold on;

t = t3;
x = A2 * sin (2*pi*f2*t);
plot(x);
hold on;

t = t3;
x = A1 * sin (2*pi*f1*t) + A2 * sin(2*pi*f2*t);
plot(x);

title("Exercitiul 1");
xlabel("t")
ylabel("x")
hold off;

legend("0:100:1600", "0:100:1800", "0:100:14400")