x4_specs;
tc = gauspuls('cutoff',fc,bw,[],-40); 
t = -tc : 1e-6 : tc; 
x4puls = gauspuls(t,fc,bw/fc); 
plot(t,x4puls)