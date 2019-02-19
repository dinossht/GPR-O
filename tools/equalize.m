function out = equalize(data)
%EQUALIZE Summary of this function goes here
% Equalizes traces by making the sum of the absolute values 
% of all samples in a trace the same for all traces. For instance, 
% if the trace that is selected to be  used  for  equalization  has  
% a  sum  of  all  absolute  values  of  1000  (base  =  1000), then the 
% sum of absolute values of every trace in the data set will be set  to  
% 1000  using  a  multiplying  factor.  The  routine  initializes  a  GUI,  
% in  which the user specifies the trace which will be used as the BASE. 
% This can be: a) the first trace; b) the mean (average) trace; c) 
% the median trace; d) the n'th trace (i.e. any trace); e) Any positive 
% number (base value). Then, it will  process  the  data  via  the  
% function  handle  callback  "eqlz".  The  reduced  data set returns from 
% "eqlz" by means of an interim global variable that are kept strictly 
% within the scope of "equalize". The interim variable are copied onto the 
% output variables just before "equalize" returns.

% INPUT:
%
% data       input data in GPR-O format
%
% OUTPUT:
%
% out    GPR-O data with equalized traces
out = data;
dataout = data.gprdata;
base = 0;
for i=1:size(dataout,2)
    base = base + sum(dataout(:,i).^2);
    %display(sum(dataout(:,i).^2));
end
base = base / size(dataout,2);

for i=1:size(dataout,2)
    dataout(:,i) = dataout(:,i) * base / sum(dataout(:,i).^2);
    %display(sum(dataout(:,i).^2));
end

out.gprdata = dataout;
