%% using data from data harvester
clear all; close all; clc
fileID = fopen('tactile_cal_test.txt','r');
my_data=fscanf(fileID,'%f',[368*3+1 inf]);
fclose(fileID);

my_data=my_data';
f12_sc=getsensForces(my_data,'11');
plotForces(f12_sc)

