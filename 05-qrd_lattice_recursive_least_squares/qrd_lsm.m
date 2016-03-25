clear;clc;
D  = 16;                       % Number of samples of delay
b  = exp(1j*pi/4)*[-0.7 1];    % Numerator coefficients of channel
a  = [1 -0.7];                 % Denominator coefficients of channel
ntr= 1000;                     % Number of iterations
s  = sign(randn(1,ntr+D))+1j*sign(randn(1,ntr+D)); % Baseband  QPSK signal
n  = 0.1*(randn(1,ntr+D) + 1j*randn(1,ntr+D));   % Noise signal
r  = filter(b,a,s)+n;      % Received signal
x  = r(1+D:ntr+D);         % Input signal (received signal)
d  = s(1:ntr);             % Desired signal (delayed QPSK signal)
lam = 0.995;               % Forgetting factor
del = 1;                   % Soft-constrained initialization factor
ha = adaptfilt.qrdlsl(32,lam,del);
[y,e] = filter(ha,x,d);
subplot(2,2,1); plot(1:ntr,real([d;y;e]));
title('In-Phase Components'); legend('Desired','Output','Error');
xlabel('Time Index'); ylabel('Signal Value');
subplot(2,2,2); plot(1:ntr,imag([d;y;e]));
title('Quadrature Components'); legend('Desired','Output','Error');
xlabel('Time Index'); ylabel('Signal Value');
subplot(2,2,3); plot(x(ntr-100:ntr),'.'); axis([-3 3 -3 3]);
title('Received Signal Scatter Plot'); axis('square');
xlabel('Real[x]'); ylabel('Imag[x]'); grid on;
subplot(2,2,4); plot(y(ntr-100:ntr),'.'); axis([-3 3 -3 3]);
title('Equalized Signal Scatter Plot'); axis('square');
xlabel('Real[y]'); ylabel('Imag[y]'); grid on;