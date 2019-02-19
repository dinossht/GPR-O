function out = zerophase_bandpass(data,fLow,fHigh,fs)
%ZEROPHASE_BANDPAS Summary of this function goes here
%   Detailed explanation goes here
dataout = data.gprdata;

bpFilt = designfilt('bandpassfir','FilterOrder',floor(size(dataout,1)/3), ...
         'CutoffFrequency1',fLow,'CutoffFrequency2',fHigh, ...
         'SampleRate',fs);
fvtool(bpFilt)

out = data;

for tr=1:size(dataout,2)
    dataout(:,tr,:) = filtfilt(bpFilt,dataout(:,tr,:));
end

out.gprdata = dataout;



