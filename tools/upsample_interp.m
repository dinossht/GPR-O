function out = upsample_interp(data,timeScale,scanScale)
% INPUT:
%
% data       input data in GPR-O format
% timeScale  factor by upscaling time data
% scanScale  factor by upscaling scan data
%
% OUTPUT:
%
% out    GPR-O hilbert-huang transformed ampltide data
out = data;
dataout1 = zeros(size(data.gprdata,1)*timeScale,size(data.gprdata,2));
timedata = interp(data.finalti,timeScale);
for i=1:size(dataout1,2)
    dataout1(:,i) = interp(data.gprdata(:,i),timeScale);
end

distdata = interp(data.finalex,scanScale);
dataout2 = zeros(size(dataout1,1),size(dataout1,2)*scanScale);
for i=1:size(dataout2,1)
    dataout2(i,:) = interp(dataout1(i,:),scanScale);
end

out.gprdata = dataout2;
out.finalti = timedata;
out.finalex = distdata;
out
end
