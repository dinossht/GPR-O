function [data,head] = dt1read(filename)
%Read PULSEKKO radar data -> data matrix & headers
%Need headerstruct.m dt1struct.m dimstruct.m
%
%lbaradello@ogs.trieste.it
%
%Todo: to extract comments
%Thanx: Lian Zhao for info
   fid = fopen(filename,'rb');    
   dt1=dt1struct;     
   h=dimstruct;            
   fseek(fid,h.samples,-1); 
   samples = fread(fid,1,dt1.samples);         
   dimension_trace=samples*2+128  ;                                  
   fseek(fid,-dimension_trace,1);
   max_traces = fread(fid,1,dt1.traces);
   i = 1;
   fseek(fid,0,'bof');
   for j = 1:max_traces,
        i = i + 1;  
        head(i-1)  = headerstruct(fid,j); 
        traccia = fread(fid,samples,dt1.traccia);
        data(:,i-1)  = traccia(:); 
        position=dimension_trace*j;
        fseek(fid,position,-1);
   end 
   fclose(fid);
