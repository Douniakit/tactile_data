clear all
close all
clc



%% using data from data harvester

fileID = fopen('data2/nc_0.txt','r');
my_data=fscanf(fileID,'%f',[368*3+1 inf]);
fclose(fileID);

my_data=my_data';
%my_data(:,1)=my_data(:,1)-my_data(1,1); %% wrong time !