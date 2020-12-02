%% Function to compute the Discrete Fourier Transform for an input_signal given N samples

function dft_signal = compute_dft(input_signal, N)
    dft_signal = zeros(1, N);

    for k = 1:N
        for n = 1:N
           dft_signal(k) = input_signal(k) + input_signal(n)*exp(((-1i)*2*pi*(n-1)*(k-1))/N);
        end
    end

end