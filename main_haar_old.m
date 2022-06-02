clear all; close all; clc;
%% dump old data not good for classification because we loose the time components
%% Reading data
%%
load Fz_11_12.mat
load Fz_8.mat
load Fz_9A.mat

%% Removing the offsets
%%
Fz11_i=Fz11_i-Fz11_i(1,:);
Fz11_s=Fz11_s-Fz11_s(1,:);
Fz12_i=Fz12_i-Fz12_i(1,:);
Fz12_s=Fz12_s-Fz12_s(1,:);
Fz9A_i=Fz9A_i-Fz9A_i(1,:);
Fz9A_s=Fz9A_s-Fz9A_s(1,:);
Fz8_i=Fz8_i-Fz8_i(1,:);
Fz8_s=Fz8_s-Fz8_s(1,:);

M11=[Fz11_i; Fz11_s];
Fz11=sum(M11')/24;

M12=[Fz12_i; Fz12_s];
Fz12=sum(M12')/24;

M9A=[Fz9A_i; Fz9A_s];
Fz9A=sum(M9A')/16;

M8=[Fz8_i; Fz8_s];
Fz8=sum(M8')/30;

%% Haar transform
%%
% [LoD,HiD,LoR,HiR] = wfilters('haar');
% %[cA,cD] = dwt(sig,LoD,HiD);
% % cA low filter contains the coefficients
% % cD high passed contains the details
% 
% Ns=6;
% ngy=[];
% coef=[];
% 
% for i=1:(length(Fz8)-Ns)
%     sig=Fz8(i:(i+Ns));    
%     [cA,cD] = dwt(sig,LoD,HiD);
%     coef(i)=mean(cA);
%     ngy(i)=sum(cD.^2);   
% end
% 
% 


% figure, 
% subplot(211), plot(ngy)
% subplot(212), plot(Fz8,'r'),hold on, plot(coef,'b')

%% LAbels for details
%%
    % Labelsd=[];
    % %Labels(1)=0;
    % for i=1:length(Fz8)-Ns
    %     %% nc
    %     if ngy(i)<=3
    %         Labelsd(i)=0; 
    %     else
    %         Labelsd(i)=1; 
    %     end
    % end
% 
% figure, 
% subplot(411), plot(Fz8), legend('sig'),hold on,bar(Labelsd*300), legend('label') 
% subplot(412), plot(ngy), legend('energy')
% subplot(413), bar(coef), legend('coef')
% subplot(414), plot(Labelsd), legend('label')

%% Labels for coeficient
%%

    % Labelsc=[]
    % %Labels(1)=0;
    % for i=1:length(Fz8)-Ns
    %     %% nc
    %     if abs(coef(i))>=15
    %         Labelsc(i)=1; 
    %     else
    %         Labelsc(i)=0; 
    %     end
    % end

% figure, 
% subplot(411)plot(Fz8), legend('sig'),hold on,bar(Labelsc*300), legend('label') 
% subplot(412), plot(ngy), legend('energy')
% subplot(413), bar(coef), legend('coef')
% subplot(414), plot(Labelsc), legend('label')



%% LAbels for coeficients and details
%%
clear all; close all; clc

load Fz_11_labels.mat
load Fz_11_12.mat


Fz11_i=Fz11_i-Fz11_i(1,:);
Fz11_s=Fz11_s-Fz11_s(1,:);
M11=[Fz11_i; Fz11_s];
Fz11=sum(M11')/24;


dat_ic=[];
ngy_ic=[];
coef_ic= [];
lab_ic=[];

dat_nc=[];
ngy_nc=[];
coef_nc= [];
lab_nc=[];

dat_sc=[];
ngy_sc=[];
coef_sc= [];
lab_sc=[];
    
l=[];
ub_v=[];
gi=[];
ci=[];
gi=[];
%figure,


%sig


[LoD,HiD,LoR,HiR] = wfilters('haar');
Ns=4;
ngy=[];
coef=[];

for i=1:(length(Fz11)-Ns)
    sig=Fz11(i:(i+Ns));    
    [cA,cD] = dwt(sig,LoD,HiD);
    coef(i)=mean(cA);
    ngy(i)=sum(cD.^2);   
end

sig=Fz11; 


% no contact
for nc=1:height(ls.Labels.nc{1,1})            
        lbi=ls.Labels.nc{1,1}.ROILimits(nc,1)+1; 
        ubi=ls.Labels.nc{1,1}.ROILimits(nc,2)+1;
        if ubi > 12263
            ubi=12263;
        end

        di=sig(lbi+Ns-1:ubi+Ns-1);
        gi=ngy(lbi:ubi);
        ci=coef(lbi:ubi);
        li=0*ones(length(di),1)';

dat_nc= [dat_nc di];
ngy_nc= [ngy_nc gi];
coef_nc=[coef_nc ci];
lab_nc= [lab_nc li];

end
 
% instable contact
for ic=1:height(ls.Labels.is{1,1})
                 
        lbi=ls.Labels.is{1,1}.ROILimits(ic,1)+1; 
        ubi=ls.Labels.is{1,1}.ROILimits(ic,2)+1;
        
        if ubi > 12263
            ubi=12263;
        end

        di=sig(lbi+Ns-1:ubi+Ns-1);
        gi=ngy(lbi:ubi);
        ci=coef(lbi:ubi);
        li=0.5*ones(length(di),1)';
        
dat_ic=[ dat_ic di];
ngy_ic=[ ngy_ic gi];
coef_ic=[coef_ic ci];
lab_ic=[ lab_ic li];


end

% stable contact  
for sc=1:height(ls.Labels.sc{1,1})
               
        lbi=ls.Labels.sc{1,1}.ROILimits(sc,1)+1; 
        ubi=ls.Labels.sc{1,1}.ROILimits(sc,2)+1;
        
        if ubi > 12263
            ubi=12263;
        end
            
        di=sig(lbi+Ns-1:ubi+Ns-1);
        gi=ngy(lbi:ubi);
        ci=coef(lbi:ubi);
        li=1*ones(length(di),1)';
        
dat_sc =[ dat_sc di];
ngy_sc =[ ngy_sc gi];
coef_sc=[ coef_sc ci];
lab_sc =[ lab_sc li];


end
% figure,plot(dat_ic,'r'),hold on,plot(dat_nc,'b')
% %figure,


data_all=[dat_nc  dat_ic  dat_sc];
ngy_all= [ngy_nc  ngy_ic  ngy_sc];
coef_all=[coef_nc coef_ic coef_sc];
labells= [lab_nc  lab_ic  lab_sc]';

X=[data_all' ngy_all' coef_all']';
labells= labells';

figure, 
subplot(411),plot(data_all)
subplot(412),plot(ngy_all)
subplot(413),plot(coef_all)
subplot(414),bar(labells)
%%
