clc; close all;
%% BV data
initialize;
addpath('BV/scripts')
addpath('BV/plotting')
path = '/home/dino/Documents/Work/Birdsview/Code/GPR-O/BV/data/x4_20cm__00cm__00cm.mat';

framelen = 80;
data = get_x4Data(path, framelen);

x4_specs;
%%
figure;
plotGPRline(data,0);
%% band pass in time and scan axis

%% upscaling data
figure;
Updata = upsample_interp(data,5,5);
plotGPRline(Updata,0);
%% dewow
figure;
WowData = dewowData(Updata,50);
plotGPRline(WowData,0);
%% time zero adjust
figure;
Tdata = timeZeroAdjust(WowData,0);
plotGPRline(Tdata,0);
%%
figure;
dataH=removeHorizontal(Tdata,19);  % Remove airgap by subtracting averaged data, number of traces to average over
plotGPRline(dataH,0);
%% Works nice to see objects deep down, not much for surface objects
figure;
dataHGt=gainDataTPOW(dataH,0.85);  % Apply t-power gain
plotGPRline(dataHGt,0);
%% More appropriate for Birdsview application
figure;
dataHGa=gainDataAGC(dataH,100);  % Apply automated gain control (AGC). Uses averaged energy over a time interval to normalize data in that inverval
plotGPRline(dataHGa,0);
%% Plotting with depth
vel = 0.17; % 0.17 m/ns: velocity in sand (3 relative permittivity),
figure;
plotGPRline(dataHGa,0,[],0.17);  
%% Plotting threshold
figure;
plotGPRline(thresh(dataHGa,0.3),0); 
%% stolt fk mig
s_fk = stolt_fk_mig(dataH,0.17,0,fc-5*bw,fc+5*bw);
plotGPRline(s_fk,0); 
%% smooth data
sData = smoothData(dataH,framelen);
plot(((dataH.gprdata(:,1))));
%% Renorm traces
RNData = renormTraces(dataH);
plotGPRline(RNData,0); 
%% Remove DC
DCData = removeDC(Updata);
plotGPRline(DCData,0); 
%% Zerophase bandpass filter
ZPData = zerophase_bandpass(dataH,fc-0.5*bw,fc+0.5*bw,5*fs);
plotGPRline(ZPData,0);
%% Zerophase bandpass filter scan data
n = ZPData;
n.gprdata = ZPData.gprdata';
temp = zerophase_bandpass(n,1,4.5,10);
temp.gprdata = temp.gprdata';
plotGPRline(temp,0);
%% time zero adjust
Tdata = timeZeroAdjust(data,0);
plotGPRline(Tdata,0);
%% Amplitude plot
for i = 1:10
    fftAmplitude(ZPData.gprdata(i,:),10);
    hold on;
end
%% Amplitude plot scan
fftAmplitude(ZPData.gprdata(:,1),fs);
%%
EData = equalize(dataH);
plotGPRline(EData,0);
figure;
plotGPRline(dataH,0);
%% Hilbert huang
HHData = hilbert_huang(dataH);
plotGPRline(HHData,0);
%plotMaxLines(data,[1 400;1 100]);
%plot(HHData.gprdata);
%% Plot max lines
figure;
window = [1 100;1 100];
plotMaxLines(dataH,window);
figure;
plotGPRline(dataH,0);
%% Saving data to .mat
%save('exercise1dataHGa.mat','dataHGa');

%%
