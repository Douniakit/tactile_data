% clear all
% close all
% clc
% 
% 
% 
% %% using data from data harvester
% 
% fileID = fopen('data2/nc_0.txt','r');
% my_data0=fscanf(fileID,'%f',[368*3+1 inf]);
% fclose(fileID);
% 
% my_data0=my_data0';
% % max0=max(my_data0);
% %my_data(:,1)=my_data(:,1)-my_data(1,1); %% wrong time !
% 
% %% using data from data harvester
% 
% fileID = fopen('data2/nc_1.txt','r');
% my_data1=fscanf(fileID,'%f',[368*3+1 inf]);
% fclose(fileID);
% 
% my_data1=my_data1';
% %my_data(:,1)=my_data(:,1)-my_data(1,1); %% wrong time !
% 
% %% using data from data harvester
% 
% fileID = fopen('data2/nc_2.txt','r');
% my_data2=fscanf(fileID,'%f',[368*3+1 inf]);
% fclose(fileID);
% 
% my_data2=my_data2';
% %my_data(:,1)=my_data(:,1)-my_data(1,1); %% wrong time !
% 
% 
% my_data=[my_data0; my_data1; my_data2];
% max_d=max(my_data);
% min_d=min(my_data);
% 
% 
% %% filtering
% % -------------------------------------------------------------------------
% 
% [n m]=size(my_data);
% dat_f_nc=my_data;
% for i=1:n
%    
%     for j=2:m
%         if (dat_f_nc(i,j)<=max_d(j)) && (dat_f_nc(i,j)>=min_d(j))
%         dat_f_nc(i,j)=0;        
%         end
%               
%     end
% end
%     
% 
% 
% facc=getFilteredDat(my_data,min_d,max_d);
% 
% save('thresholds.mat','min_d','max_d')
% save('data_nc.mat','dat_f_nc')

%% loading data

% fileID = fopen('data2/12_sc.txt','r');
% F12_sc=fscanf(fileID,'%f',[368*3+1 inf]);
% fclose(fileID);
% F12_sc=F12_sc';
% f12_sc=getsensForces(F12_sc,'12');
% %figure,plot(f12_sc)
% save('fxyz_sensors/f12_sc.mat','f12_sc')


%% GETTing forces for sensors
% clear all
% fileID = fopen('data2/11_12_ic_0.txt','r');
% M=fscanf(fileID,'%f',[368*3+1 inf]);
% fclose(fileID);
% M=M';
% f12_ic=getsensForces(M,'12');
% 
% save('fxyz_sensors/f12_ic.mat','f12_ic')
% 
%  figure,plot(f12_ic)


plotForces(f12_ic)
























