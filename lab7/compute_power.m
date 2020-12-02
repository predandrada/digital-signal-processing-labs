%% Function to compute the power of an input_signal given N samples and an interval [start, stop]

function result = compute_power(input_signal, N, start, stop)
    result = 0;
    
    for k = start:stop
        result = result + abs(input_signal(k))^2;
    end
    
    if start > 0
        result = result/(stop-start);
    else 
        result = result/N;
    end
end