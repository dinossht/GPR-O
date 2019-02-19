function out = removeDC(data)
%REMOVEDC Remove DC part of the signals and return only AC
out = data;
dataout = out.gprdata;
for i=1:size(data,2)
    dataout(:,i,:) = dataout(:,i,:) - mean(dataout(:,i,:));
end
out.gprdata = dataout;

