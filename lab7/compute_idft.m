%% Function to compute the IDFT for an input_signal given N samples

function idft_signal = compute_idft(input_signal, N)
    idft_signal = zeros(1, N);

    for n = 1:N
        for k = 1:N
           idft_signal(n) = idft_signal(n) + (input_signal(k)*exp((1i*2*pi*(n-1)*(k-1))/N))/N;
        end
    end

end