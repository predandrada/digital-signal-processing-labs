%% Ex 3 -- DFT leakage & windows on a longer signal

clear;
close all;

load('notes_signal_long.mat');

[dk N] = size(notes_signal);
t = linspace(0, N-1, N) * (1/fs);
plot_t = linspace(0, N-1, N) * (fs/N);
window = hann(N);

figure;
plot(t, notes_signal);
title('Original signal');
xlabel('Time(s)');
ylabel('Amplitude');

figure;
plot(t, window);
title('Hanning windowed');
xlabel('Time(s)');
ylabel('Amplitude');


% computing dft
dft_s = fft(notes_signal);

figure;
stem(plot_t, abs(dft_s));
title('FFT of signal');
xlabel('DFT frequency index');
xlim([0, 500]);

% applying a hanning window
signal_h = notes_signal .* window';

figure;
plot(t, signal_h);
title('Signal after Hanning Window');

dft_hanning = fft(signal_h);

figure;
stem(plot_t, abs(dft_hanning));
title('FFT of signal');
xlabel('DFT frequency index');
xlim([0, 500]);

sound(real(double(dft_hanning)));