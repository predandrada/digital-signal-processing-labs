% Bonus exercise

close all;
clear;

T = 100;
t = 1:100;

% create random sequence 
rand_seq = randi(3, 10, 1);

F_t = 1/100;
f1 = 1 * f_t;
f2 = 2 * f_t;

corresp_sin = zeros(1, T);

for i = 1:9
    for t = i * 10 : (i+1) * 10
        if rand_seq(i) == 0
            corresp_sin = 0;
        else if rand_seq(i) == 1
            corresp_sin = sin;
    