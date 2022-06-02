clear all
close all
clc

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
%Fz11=sum(M11');

M12=[Fz12_i; Fz12_s];
%Fz12=sum(M12');

M9A=[Fz9A_i; Fz9A_s];
%Fz9A=sum(M9A');

M8=[Fz8_i; Fz8_s];
%Fz8=sum(M8');

%% Haar transform

LiD=[ 0.7071 0.7071];
HiD=[-0.7071 0.7071];

Lf=(1/sqrt(2))*[1 0 0;
                1 1 0;
                0 1 1;
                0 0 1];
Hf=(1/sqrt(2))*[-1  0   0;
                 1 -1  0;
                 0  1 -1;
                 0  0  1];
 
Ns=4;
ngy=[];
coef=[];
Fzi=M11(:,11);

for i=1:(length(Fzi)-Ns)
    sig=Fzi(i:(i+Ns-1))'; 
    % coefficients
    cA=sig*Lf;
    % details
    cD=sig*Hf;
    %coef(i)=mean(cA);
    coef(i)=sum(cA.^2);
    ngy(i)=sum(cD.^2); 
end            



for i=1:(length(Fzi)-Ns)
    di=Fzi(i+Ns-1)'; 

    if abs(di) >=30
%         if (abs(ngy(i)/(coef(i))) <= 9) && (coef(i) <400) 
        if (coef(i)>= 520000)&&(ngy(i)/coef(i)) <= 0.015
            Labels(i)=1;
        else
            Labels(i)=-1;
        end
            
    else
        Labels(i)=0;
    end
end

Labelsf=medfilt1(Labels,5);

figure, 
subplot(311), plot(ngy),%hold on, plot(Labels*0.5*10e5,'b')
subplot(312), plot(coef),%hold on, plot(Labels*0.3*10e8,'b')
subplot(313), plot(Fzi(Ns:end),'r'),hold on, plot(Labelsf*500,'b')
