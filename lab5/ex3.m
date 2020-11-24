% Ex 3 -- reconstructing an amplitude modulated signal

close all;
clear;

load('lab05_modulated_sound.mat');

t_max = size(y0_modulated, 1);
t = 0:(1/Fs):t_max/Fs;

amp_mod = fft(y0_modulated);
 
figure;
%stem(abs(fft(y0_modulated)));
stem(abs(amp_mod));
title('Spectre of the amplitude modulated signal');

% getting the demodulated signal
f_c = Fs/8;
y0_demodulated = zeros(1, length(t));
for i = 1:length(t)-1
    y0_demodulated(i) = y0_modulated(i) * cos(2*pi*f_c*t(i));
end
amp_demod = fft(y0_demodulated);

figure;
% stem(abs(fft(y0_demodulated)));
stem(abs(amp_demod));
title('Spectre of the amplitude demodulated signal');

% choosing a treshhold 
% just stop somewhere before the end since thats's where the greatest
% values are
filtred_signal = amp_demod;
filtred_signal(end-350000:end) = 0;

original = ifft(filtred_signal);
sound(real(double(original)), Fs);

