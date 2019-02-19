function out = hilbert_huang(data)
% INPUT:
%
% data       input data in GPR-O format
%
% OUTPUT:
%
% out    GPR-O hilbert-huang transformed ampltide data
out = data;
dataout = data.gprdata;

for i=1:size(dataout,2)
    dataout(:,i) = abs(hilbtm(dataout(:,i)));
end

out.gprdata = dataout;
end

