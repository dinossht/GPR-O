tc = gauspuls('cutoff',50e3,0.5,[],-40); 
t = -tc : 1e-6 : tc; 
yi = gauspuls(t,50e3,0.5); 
plot(t,yi);

hold;

tc = gauspuls('cutoff',100e3,0.25,[],-40); 
t = -tc : 1e-6 : tc; 
yi = gauspuls(t,100e3,0.25); 
plot(t,yi);