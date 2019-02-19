N = 1536;  % Number of samples
fs = 23.328e9; 
fc = 7.29e9;
bw = 1.4e9;
frame_duration = (N-1)/fs;  % A full radar frame duration
t = 0:frame_duration/(N-1):frame_duration;  % time array