%% using data from data harvester
clear all; close all; clc

T = readtable('4x4_ctc_i0.csv','NumHeaderLines',1);
d1=table2array(T);
figure,plot(d1(:,2:end))

% 
% fileID = fopen('nc_0d.txt','r');
% my_data=fscanf(fileID,'%f',[368*3+1 inf]);
% fclose(fileID);
% 
% my_data=table2array(T);
% f12_sc=getsensForces(my_data,'1A');
% plotForces(f12_sc)
% 
% 
% fileID = fopen('tactile_cal_test.txt','r');
% my_data=fscanf(fileID,'%f',[368*3+1 inf]);
% fclose(fileID);
% 
% % 
% % f12_sc=getsensForces(my_data,'11');
% % plotForces(f12_sc)
% 
% fileID = fopen('1A_4x4_sc_0.txt','r');
% my_data=fscanf(fileID,'%f',[368*3+1 inf]);
% fclose(fileID);
% my_data=my_data';
% 
% f12_sc=getsensForces(my_data,'3A');
% figure,plotForces(f12_sc)
% 
