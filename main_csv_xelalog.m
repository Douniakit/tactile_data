%% using data from data harvester
clear all; close all; clc

addpath('xela_csv_050522/')


% %% 11 12
% %
% T = readtable('11_12_i.csv','NumHeaderLines',1);
% T=table2array(T);
% T2 = readtable('11_12_s_1.csv','NumHeaderLines',1);
% T2=table2array(T2);
% 
% d11_i=getsensForces(T,'11');
% d12_i=getsensForces(T,'12');
% d11_s=getsensForces(T2,'11');
% d12_s=getsensForces(T2,'12');
% 
% Fz11_i=getFz(d11_i);
% Fz11_s=getFz(d11_s);
% 
% Fz12_i=getFz(d12_i);
% Fz12_s=getFz(d12_s);
% 
% 
% figure(1),title('d11_i'),plotForces(d11_i-d11_i(1,:))
% figure(2),title('d12_i'),plotForces(d12_i-d12_i(1,:))
% figure(3),title('d11_s'),plotForces(d11_s-d11_s(1,:))
% figure(4),title('d12_s'),plotForces(d12_s-d12_s(1,:))


% save('Fz_11_12.mat','Fz11_i','Fz11_s','Fz12_i','Fz12_s')


%% 8
%%

% T = readtable('8_i.csv','NumHeaderLines',1);
% T=table2array(T);
% %T=T(:,2:end);
% 
% T2 = readtable('8_s.csv','NumHeaderLines',1);
% T2=table2array(T2);
% %T2=T2(:,2:end);
% 
% d8_i=getsensForces(T,'8');
% d8_s=getsensForces(T2,'8');
% 
% figure(1),title('d11_i'),plotForces(d8_i-d8_i(1,:))
% figure(2),title('d12_s'),plotForces(d8_s-d8_s(1,:))
% 
% Fz8_i=getFz(d8_i);
% Fz8_s=getFz(d8_s);


% save('Fz_8.mat','Fz8_i','Fz8_s')


%% 9A
%%

% T = readtable('9A_i.csv','NumHeaderLines',1);
% T=table2array(T);
% %T=T(:,2:end);
% T2 = readtable('9A_s.csv','NumHeaderLines',1);
% T2=table2array(T2);
% %T2=T2(:,2:end);
% 
% 
% d8_i=getsensForces(T,'9A');
% d8_i=d8_i(453:3187,:);
% Fz9A_i=getFz(d8_i);
% d8_in=getForcesNorms(d8_i);
% D8_in=sum(d8_in')/16;
% M_i=(d8_in(:,6));
% 
% 
% d8_s=getsensForces(T2,'9A');
% d8_s=[d8_s(520:2823,:); d8_s(3220:end,:)];
% Fz9A_s=getFz(d8_s);
% d8_sn=getForcesNorms(d8_s);
% D8_sn=sum(d8_sn')/16;
% M_s=(d8_sn(:,6));
% 
% figure(1),title('d9A_i'),plotForces(d8_i-d8_i(1,:))
% figure(2),title('d9A_s'),plotForces(d8_s-d8_s(1,:))
% 
% %save('data_9A_6.mat','M_s','M_i')
% save('Fz_9A.mat','Fz9A_i','Fz9A_s')

