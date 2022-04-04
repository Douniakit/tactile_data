clear all; close all; clc

%% using data from data harvester
% fileID = fopen('1A_sc_0.txt','r');
% my_data=fscanf(fileID,'%f\n');
% fclose(fileID);
% b=(368*3+1); 
% a=length(my_data)/b;
% 
% 
% 
% my_data=reshape(my_data,[b a]);
% my_data=my_data';


my_data= readtable('data/4x4_ctc_s0.csv','NumHeaderLines',1);
my_data=table2array(my_data);

id_4x4=[10, 11, 12, 13, 24, 25, 26, 27, 38, 39, 40, 41, 51, 52, 53, 54]';
%id_4x4=[14, 15, 16, 17, 28, 29, 30, 31, 42, 43, 44, 45, 55, 56, 57, 58]';
id_4x6=[120, 121, 122, 123, 141, 142, 143, 144, 149, 150, 151, 152, 153, 154, 155, 156, 161, 162, 163, 164, 182, 183, 184, 185]';
id_tip=[63, 64, 65, 66, 67, 68, 69, 70, 71, 84, 85, 86, 87, 88, 89, 102, 103, 104, 105, 106, 107, 124, 125, 126, 127, 128, 145, 146, 147, 148]';
f_im=[];

%% 4x4
FFFF=[]
figure,
for k=1:(4*4)
  
% (id_4x4(k)-1)*3+2 %% +2 because of time
% (id_4x4(k)-1)*3+3
% (id_4x4(k)-1)*3+4
Fx=my_data(:,((id_4x4(k)-1)*3+2));
Fy=my_data(:,((id_4x4(k)-1)*3+3));
Fz=my_data(:,((id_4x4(k)-1)*3+4));
F=sqrt(Fx.^2+Fy.^2+Fz.^2);

% i=fix((k-1)/4)+1;
% j=k-(i-1)*4;  
  
%f_im(i,j,:)=  F;
 FFFF=[FFFF Fx Fy Fz];

subplot(4,1,1),plot(Fx),xlabel('t'),ylabel('Fx'),hold on
subplot(4,1,2),plot(Fy),xlabel('t'),ylabel('Fy'),hold on
subplot(4,1,3),plot(Fz),xlabel('t'),ylabel('Fz'),hold on
subplot(4,1,4),plot(F),xlabel('t'),ylabel('F'),hold on

end
hold off

FF=getsensForces(my_data,"1A");
Fn=getForcesNorms(FF);


% figure,
% clims = [0 11000]; 
% for i =3000:10000;
% imagesc(f_im(:,:,i),clims), colorbar
% pause(0.000001)
% 
% end
%% tip
%%%
% 
% % 
% % 
% figure,
% for i=1:30
%     
% Fx=my_data(:,(id_tip(i)+1));
% Fy=my_data(:,(id_tip(i)+2));
% Fz=my_data(:,(id_tip(i)+3));
% F=sqrt(Fx.^2+Fy.^2+Fz.^2);
% 
% 
% 
% subplot(5,1,1),plot(Fx),xlabel('t'),ylabel('Fx'),hold on
% subplot(5,1,2),plot(Fy),xlabel('t'),ylabel('Fy'),hold on
% subplot(5,1,3),plot(Fz),xlabel('t'),ylabel('Fz'),hold on
% subplot(5,1,4),plot(F),xlabel('t'),ylabel('F'),hold on
% 
% end
% hold off
% 

%% 4x4
% figure,
% for i=1:16
%     
% Fx=my_data(:,(id_4x4(i)+1));
% Fy=my_data(:,(id_4x4(i)+2));
% Fz=my_data(:,(id_4x4(i)+3));
% F=sqrt(Fx.^2+Fy.^2+Fz.^2);
% 
% 
% 
% subplot(5,1,1),plot(Fx),xlabel('t'),ylabel('Fx'),hold on
% subplot(5,1,2),plot(Fy),xlabel('t'),ylabel('Fy'),hold on
% subplot(5,1,3),plot(Fz),xlabel('t'),ylabel('Fz'),hold on
% subplot(5,1,4),plot(F),xlabel('t'),ylabel('F'),hold on
% 
% end
% hold off
