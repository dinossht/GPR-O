function plotMaxLines(data,window)
%PLOTMAXLINES Summary of this function goes here
%   Detailed explanation goes here
figure;
dataout = data.gprdata;
ss = window(2,1);
se = window(2,2);
ts = window(1,1);
te = window(1,2);

if ss < 1
    ss = 1;
end
if se > size(dataout,2)
    se = size(dataout,2);
end
if ts < 1
    ts = 1;
end
if te > size(dataout,1)
    te = size(dataout,1)
end
for i=ss:se
    [Y,I] = max(dataout(ts:te,i));
    hold on; % Prevent image from being blown away.
    plot(i,I,'r.', 'MarkerSize', 5);
end
