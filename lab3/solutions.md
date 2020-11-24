## Ex 1 Circuit analysis

Given is a high pass filter: passes signals which surpass the cutoff frequency and atenuates the ones below it. 



saved ex 2 :

k_max = 50;
k = [-k_max:k_max]
c_k = zeros(1, T);

for i = 1:T
    if mod(k(i), 2) == 1
        c_k(i) = (2/(j * pi * k(i))) * s(i);
    end
end
