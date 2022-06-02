clear all; close all; clc;
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
Fz11=sum(M11');

M12=[Fz12_i; Fz12_s];
Fz12=sum(M12');

M9A=[Fz9A_i; Fz9A_s];
Fz9A=sum(M9A');

M8=[Fz8_i; Fz8_s];
Fz8=sum(M8');

%% Haar transform
%%
[LoD,HiD,LoR,HiR] = wfilters('haar');
%[cA,cD] = dwt(sig,LoD,HiD);
% cA low filter contains the coefficients
% cD high passed contains the details

Ns=4;
ngy=[];
coef=[];

for i=1:(length(Fz8)-Ns)
    sig=Fz8(i:(i+Ns-1)); 

    [cA,cD] = dwt(sig,LoD,HiD);
    coef(i)=mean(cA);
    ngy(i)=sum(cD.^2); 
    %plot(sig)
    %pause
end

% figure,
% subplot(211), plot(ngy)
% subplot(212), plot(Fz8,'r'),hold on, plot(coef,'b')
% 
% figure, 
% subplot(211), plot(ngy)
% subplot(212), plot(Fz8,'r'),hold on, plot(coef,'b')

%% Labels for all
%%

Labels=[]

Fct=[]
for i=1:length(Fz8)-Ns
    
        %% nc
        if abs(Fz8(i+(Ns-1)))>=60
            if ngy(i) <= 4400 %&& abs(coef(i))>= 900
                Labels(i)=1;
            else
                Labels(i)=-1;
            end     
%              Fct(i)=(ngy(i)*40)/(coef(i));
%             if abs(Fct(i)) <15
%                 Labels(i)=1;
%             else
%                 Labels(i)=-1;
%             end
%             

            %Labels(i)=1;
            
        else
            Labels(i)=0; 
        end
    end

figure, 
subplot(411), plot(abs(Fz8(Ns:end))), legend('sig'),hold on,bar(Labels*3000), legend('label') , xlim([0 13000])
subplot(412), plot(ngy), legend('energy'), xlim([0 13000])
subplot(413), bar(coef), legend('coef'), xlim([0 13000])
subplot(414), plot(Fct), legend('label'), xlim([0 13000])



%figure,plot(Fz8),hold on, plot(ngy./coef,'g')

