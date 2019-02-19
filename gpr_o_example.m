%% Refer to: GPR-O.pdf 
%% https://github.com/NSGeophysics/GPR-O/blob/master/doc/GPR-O.pdf

setup;  % This will download some external program files that are necessary to run GPR-O
initialize;  % access to all the subprograms you need to run
example1;
preprawdata(surveyparams,0);
data=readdata(surveyparams);
%%
figure;
plotGPRline(data,0);
%%
figure;
dataH=removeHorizontal(data,10000);  % Remove airgap by subtracting averaged data, 10000 = number of traces to average over
plotGPRline(dataH,0);
%% Works nice to see objects deep down, not much for surface objects
figure;
dataHGt=gainDataTPOW(dataH,0.85);  % Apply t-power gain
plotGPRline(dataHGt,0);
%% More appropriate for Birdsview application
figure;
dataHGa=gainDataAGC(dataH,5);  % Apply automated gain control (AGC). Uses averaged energy over a time interval to normalize data in that inverval
plotGPRline(dataHGa,0);
%% Plotting with depth
figure;
plotGPRline(dataHGa,0,[],0.06);  % 0.06 m/ns: velocity in clay,
%% Plotting with stolt_fk_mig
figure;
plotGPRline(stolt_fk_mig(dataHGa,0.06,0),0);  % 0.06 m/ns: velocity in clay,
%% Equalize
figure
dataE=equalize(dataH)
plotGPRline(dataE,0);
figure
plotGPRline(dataH,0);
%% Saving data to .mat
%save('exercise1dataHGa.mat','dataHGa');
%% 
% AREA PLOTTING
% bird’s eye plot of all 24 profiles
figure;
plotdata2Dgpr(dataHGa,surveyparams,30,0); 
%% CMP (Common MidPoint) AND WARR (Wide Aperture Reflection and Refraction) to determine travel time in material
%
example2;
preprawdata(surveyparams,0);
data=readdata(surveyparams);
%%
figure;
plotWARR(data);
%%
plotWARRlinear(3,0.1,8);
%%
figure;
plotWARRlinSemblance(data,1:0.3:20,0.04:0.003:0.35,8);
%%
plotWARR(data);
plotWARRlinear(1,0.3,8);
plotWARRlinear(6.5,0.3,8);
plotWARRlinear(9,0.085,8);
%% 
% TOPOLOGY CORRECTION
%run_Dune_Line32