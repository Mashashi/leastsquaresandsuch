% For more information refeer to equalization features
% Build a set of test data.
hMod = comm.BPSKModulator; % BPSKModulator System object
x = step(hMod,randi([0 1],1000,1)); % BPSK symbols
rxsig = conv(x,[1 0.8 0.3]);  % Received signal
% Create an equalizer object.
eqlms = lineareq(8,lms(0.03));
% Change the reference tap index in the equalizer.
eqlms.RefTap = 4;
% Apply the equalizer object to a signal.
y = equalize(eqlms,rxsig,x(1:200));