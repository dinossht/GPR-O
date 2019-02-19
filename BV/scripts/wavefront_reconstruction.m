%{
1.2D fourier
2.Gange med kernel
3.Invers fourier i skann retning
4.Mapping fra sylinder->kartesisk
5.Interpolering
6.2D-IFFT
%}

%data = [];


load('x4_data/x4_20cm__3cm__8_5cm.mat');
Data = pkt_np_array;

Average_data = repmat(mean(Data),20,1);
len = 100;
newData = Data(1:20,1:len)-Average_data(1:20,1:len);
figure(1);
imshow(newData,[-0.2,0.18]);

tgainData = zeros(size(newData));
for i=1:len
    tgainData(:,i) = newData(:,i)*i^0.5;
end

figure(2);
imshow(tgainData,[-0.2,0.18]);
figure(3);
imshow(ACG(newData,10));
%%
figure(2);
fft2D = fft2(newData);
imshow(abs(fft2D(1:20,1:len)),[0,2.5]);

A = imread('flores.png');
BW = im2bw(A,0);
imshow(fft2(newData));

%Pwelch
Fs = 23.328e9; % [Hz]
window = 1535; % window  size
% Calculate  PSD
signal = Data(1,:);
[pxx ,f] = pwelch(signal ,window ,[],[],Fs);

% Find  max of plot
idxmax = find(pxx == max(pxx));

plot(f,pxx);
%plot(abs(fft(Data(1,:))));