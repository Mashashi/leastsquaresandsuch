Fs = 800; L = 1000; 
t = (0:L-1)'/Fs;
x = sin(2*pi*250*t) + 0.75*cos(2*pi*340*t); 
y = x;%+ .5*randn(size(x)); % noisy signal
hfft = dsp.FFT('FFTLengthSource', 'Property', 'FFTLength', 1024);
Y = step(hfft, y);
% Plot the single-sided amplitude spectrum
plot(Fs/2*linspace(0,1,512), 2*abs(Y(1:512)/1024));
title('Single-sided amplitude spectrum of noisy signal y(t)');
xlabel('Frequency (Hz)'); 
ylabel('|Y(f)|')