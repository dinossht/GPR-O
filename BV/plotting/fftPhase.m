function fftPhase(data,L,fs)
Y = fft(data(1,:));
P2 = angle(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = fs*(0:(L/2))/L;
plot(f,P1/pi) 
title('Single-Sided Phase Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P(f)|')
end

