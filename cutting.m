clear all; close all; clc;


% id_4x4=[10, 11, 12, 13, 24, 25, 26, 27, 38, 39, 40, 41, 51, 52, 53, 54]';  

% no_ctc0= readtable('data/4x4_ctc_s2.csv','NumHeaderLines',1);
% no_ctc0=table2array(no_ctc0);
% t_no_ctc0=no_ctc0(:,1);
% t_no_ctc0=t_no_ctc0-t_no_ctc0(1);

% fi_no_ctc_0=[];
% for i=1:length(id_4x4)
%         fi_no_ctc_0=[fi_no_ctc_0 no_ctc0(:,(id_4x4(i))*3-1:(id_4x4(i))*3+1)];
% end
% 
% offsets=mean(fi_no_ctc_0);
% f_im=[];
% 
% for k=1:16
%   k
%   i=fix((k-1)/4)+1;
%   j=k-(i-1)*4;
%     fx=fi_no_ctc_0(:,(i-1)*3+1);
%     fy=fi_no_ctc_0(:,(i-1)*3+2);
%     fz=fi_no_ctc_0(:,(i-1)*3+3);
%     f=sqrt(fx.^2+fy.^2+fz.^2);
%     plot(t_no_ctc0,f)
%     
%      f_im(i,j,:)=  f;
%      
% end
%% drawing in image

%  clims=[50000 70000];
% for i =1:4019
% imagesc(f_im(:,:,i),clims), colorbar
% pause(0.005)
% end

% D0= readtable('data/4x4_ctc_i0.csv','NumHeaderLines',1);
% D1= readtable('data/4x4_ctc_i1.csv','NumHeaderLines',1);
% D2= readtable('data/4x4_ctc_i2.csv','NumHeaderLines',1);
% 
% D0=table2array(D0);
% t0=D0(:,1);
% t0=t0-t0(1);
% D0=D0(:,2:end);
% 
% D1=table2array(D1);
% t1=D1(:,1);
% t1=t1-t1(1);
% D1=D1(:,2:end);
% 
% D2=table2array(D2);
% t2=D2(:,1);
% t2=t2-t2(1);
% D2=D2(:,2:end);
% 
% 
% 
% D=[D0; D1; D2];
% t1=t1+t0(end);
% t2=t2+t1(end);
% 
% t_ic=[t0; t1; t2];
% id_4x4=[10, 11, 12, 13, 24, 25, 26, 27, 38, 39, 40, 41, 51, 52, 53, 54]';  
% 
% D_ic=[];
% for i=1:length(id_4x4)
%         D_ic=[D_ic D(:,(id_4x4(i))*3-2:(id_4x4(i))*3)];
% end
% 
% 
% %save('i_contact.mat','t_ic','D_ic')
% 







