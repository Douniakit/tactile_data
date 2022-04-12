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
% my_data(:,1)=my_data(:,1)-my_data(1,1); %% wrong time !

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
%save('fxyz_sensors/f12_sc.mat','f12_sc')


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


%plotForces(f12_ic)


% clear al;
% close all; clc
% load f11_ic.mat
% load f12_ic.mat 
% load f3B_ic.mat
% load f5_ic.mat
% load f8_ic.mat
% 
% load f12_sc.mat
% load f1A_sc.mat
% load f3B_sc.mat
% load f4A_sc.mat
% load f8_sc.mat
% 
% %% ic
% % -------------------------------------------------------------------------
% fn_11_ic=getForcesNorms(f11_ic); 
% 
% fn_12_ic=getForcesNorms(f12_ic);
% 
% fn_3B_ic=getForcesNorms(f3B_ic);
% 
% fn_5_ic=getForcesNorms(f5_ic);
% 
% fn_8_ic=getForcesNorms(f8_ic);
% %% sc
% % -------------------------------------------------------------------------
% 
% fn_12_sc=getForcesNorms(f12_sc);
% 
% fn_1A_sc=getForcesNorms(f1A_sc);
% 
% fn_3B_sc=getForcesNorms(f3B_sc);
% 
% fn_4A_sc=getForcesNorms(f4A_sc);
% 
% fn_8_sc=getForcesNorms(f8_sc);
% 
% 
% clear f11_ic f12_ic f3B_ic f5_ic f8_ic f12_sc f1A_sc f3B_sc f4A_sc f8_sc
%% vectors
% -------------------------------------------------------------------------

% fn_ic=[fn_11_ic(:);fn_12_ic(:);fn_3B_ic(:);fn_5_ic(:);fn_8_ic(:)];
% 
% fn_sc=[fn_12_sc(:);fn_1A_sc(:);fn_3B_sc(:);fn_4A_sc(:);fn_8_sc(:)];
% 
% Fall=[fn_ic;fn_sc];
% %csvwrite('test.csv',fn_ic)
% data_sample={}
% figure,
% for i=1:(length(fn_sc)/10)
%     data_sample{i}=fn_sc(10*(i-1)+1:10*(i-1)+10);
%     plot(data_sample{i})
%     prompt = "label? ";
%     labels(i)=input(prompt);
%     
% end

%% 
% format Long
% 
% % load datass
% d1_i=fn_11_ic(:,12);
% d2_i=fn_12_ic(:,12);
% d3_i=fn_8_ic(:,15);
% d4_i=fn_3B_ic(:,8);
% d5_i=fn_5_ic(:,15);
% 
% d1_s=fn_12_sc(:,12);
% d2_s=fn_1A_sc(:,8);
% d3_s=fn_3B_sc(:,8);
% d4_s=fn_4A_sc(:,8);
% d5_s=fn_8_sc(:,15);
% save('fxyz_sensors/datass.mat','d1_i','d2_i','d3_i','d4_i','d5_i','d1_s','d2_s','d3_s','d4_s','d5_s')
%% 
% load datass.mat
% DATA=[d1_i;d2_i;d3_i;d4_i;d5_i;d1_s;d2_s;d3_s;d4_s;d5_s];
%% 
% %
clear all; close all; clc
load data_samp.mat
addpath fxyz_sensors/

% samples={}
% labels={}
    dat_ic=[];
    lab_ic=[];
    
    dat_nc=[];
    lab_nc=[];
    
    dat_sc=[];
    lab_sc=[];
    
    l=[];
    ub_v=[];
%figure,
for i=1:height(ls.Labels)
    sig=ls.Source{i,1};
    sig_s=rescale(sig,0,1);
    %% no contact
    for nc=1:height(ls.Labels.nc{i,:})
        
        [k,~]=size(ls.Labels.nc{i,:});
        if k>0 & i~=5 & nc~=5                
            lbi=ls.Labels.nc{i,:}.ROILimits(nc,1); 
            if lbi==0
                lbi=1;
            end
            ubi=ls.Labels.nc{i,:}.ROILimits(nc,2);
          
            di=sig_s(lbi:ubi);
           % plot(di),title('i='+string(i)+'  nc='+string(nc)), pause
            li=0*ones(length(di),1);
        dat_nc=[dat_nc; di];
        lab_nc=[lab_nc; li];
        end
        
    end
    
    %% instable contact
    for ic=1:height(ls.Labels.ic{i,:})
        
        [k,~]=size(ls.Labels.ic{i,:});
        if k>0                   
            lbi=ls.Labels.ic{i,:}.ROILimits(ic,1); 
            if lbi==0
                lbi=1;
            end

            ubi=ls.Labels.ic{i,:}.ROILimits(ic,2);

          
            di=sig_s(lbi:ubi);
            li=0.5*ones(length(di),1);
        dat_ic=[dat_ic; di];
        lab_ic=[lab_ic; li];
        end
        
    end
    %% stable contact
    
    for sc=1:height(ls.Labels.sc{i,:})
        
        [k,~]=size(ls.Labels.sc{i,:});
        if k>0                   
            lbi=ls.Labels.sc{i,:}.ROILimits(sc,1); 
            if lbi==0
                lbi=1;
            end

            ubi=ls.Labels.sc{i,:}.ROILimits(sc,2);

          
            di=sig_s(lbi:ubi);
            li=1*ones(length(di),1);
        dat_sc=[dat_sc; di];
        lab_sc=[lab_sc; li];
        end
        
    end
    
end
% figure,plot(dat_ic,'r'),hold on,plot(dat_nc,'b')
% %figure,


data_all=[dat_nc; dat_ic; dat_sc];
labells=[lab_nc; lab_ic; lab_sc];

csvwrite('dat_classif/input.csv',data_all)
csvwrite('dat_classif/output.csv',labells)



















