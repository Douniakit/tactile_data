clear all; close all; clc 

load no_contact.mat
load s_contact.mat
load i_contact.mat



%% one sensor 

i=6
offset6=52260
% the offset for fx fy fz are different filter arbitrary values


fx6_nc=D_nc(:,(i-1)*3+1);
fy6_nc=D_nc(:,(i-1)*3+2);
fz6_nc=D_nc(:,(i-1)*3+3);


f6_nc=sqrt(fx6_nc.^2+fy6_nc.^2+fz6_nc.^2);
mm=preprocess1(f6_nc)
figure, plot(f6_nc,'b'), hold on, plot (mm,'r')




fx6_sc=D_sc(:,(i-1)*3+1);
fy6_sc=D_sc(:,(i-1)*3+2);
fz6_sc=D_sc(:,(i-1)*3+3);

f6_sc=sqrt(fx6_sc.^2+fy6_sc.^2+fz6_sc.^2);
%mm2=preprocess1(f6_sc)

%figure, plot(f6_sc,'b'), hold on, plot (mm2,'r')