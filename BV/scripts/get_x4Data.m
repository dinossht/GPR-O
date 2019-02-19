function data = get_x4Data(filepath,framelen)
% load x4 specs such as fs,fc,fw...
x4_specs;

% load x4 data
x4Data = (load(filepath));
x4Data = x4Data.pkt_np_array;

% cast x4 data to gpr-o struct
x4_data.gprdata = (x4Data(:,1:framelen))';
x4_data.finalex = 1:size(x4Data,1);
x4_data.finalti = t(1:framelen); 
x4_data.finalti = x4_data.finalti*1e9;  % scale from second to ns
data = x4_data;
end

