clear all; close all; clc 

load no_contact.mat
load s_contact.mat
load i_contact.mat




% 
% for i=1:16
%     
% Fx=D_nc(:,(i-1)*3+1);
% Fy=D_nc(:,(i-1)*3+1);
% Fz=D_nc(:,(i-1)*3+3);
% F=sqrt(Fx.^2+Fy.^2+Fz.^2);
% F_d=F(2:end)-F(1:end-1);
% 
% 
% subplot(5,1,1),plot(t_nc,Fx,'.'),xlabel('t'),ylabel('Fx'),hold on
% subplot(5,1,2),plot(t_nc,Fy,'.'),xlabel('t'),ylabel('Fy'),hold on
% subplot(5,1,3),plot(t_nc,Fz,'.'),xlabel('t'),ylabel('Fz'),hold on
% subplot(5,1,4),plot(t_nc,F,'.'),xlabel('t'),ylabel('F'),hold on
% subplot(5,1,5),plot(t_nc(2:end),F_d,'.'),xlabel('t'),ylabel('F_d'),hold on
% end
% hold off

%% one sensor 

i=6
offset6=56257
% the offset for fx fy fz are different filter arbitrary values


fx6_nc=D_nc(:,(i-1)*3+1);
fy6_nc=D_nc(:,(i-1)*3+1);
fz6_nc=D_nc(:,(i-1)*3+1);
f6_nc=sqrt(fx6_nc.^2+fy6_nc.^2+fz6_nc.^2);

idx=find(f6_nc==0);
for k=1:length(idx)
    f6_nc(idx(k))=offset6;    
end


fx6_sc=D_sc(:,(i-1)*3+1);
fy6_sc=D_sc(:,(i-1)*3+1);
fz6_sc=D_sc(:,(i-1)*3+1);
f6_sc=sqrt(fx6_sc.^2+fy6_sc.^2+fz6_sc.^2);

idx=find(f6_sc==0);
for k=1:length(idx)
    f6_sc(idx(k))=offset6;    
end

fx6_ic=D_ic(:,(i-1)*3+1);
fy6_ic=D_ic(:,(i-1)*3+1);
fz6_ic=D_ic(:,(i-1)*3+1);
f6_ic=sqrt(fx6_ic.^2+fy6_ic.^2+fz6_ic.^2);

idx=find(f6_ic==0);
for k=1:length(idx)
    f6_ic(idx(k))=offset6;    
end
% figure,
% subplot(4,1,1),plot(t_nc,fx6_nc,'r'),xlabel('t'),ylabel('Fx'),hold on, plot(t_sc,fx6_sc,'g'),hold on, plot(t_ic,fx6_ic,'b'),
% subplot(4,1,2),plot(t_nc,fy6_nc,'r'),xlabel('t'),ylabel('Fy'),hold on, plot(t_sc,fy6_sc,'g'),hold on, plot(t_ic,fy6_ic,'b'),
% subplot(4,1,3),plot(t_nc,fz6_nc,'r'),xlabel('t'),ylabel('Fz'),hold on, plot(t_sc,fz6_sc,'g'),hold on, plot(t_ic,fz6_ic,'b'),
% subplot(4,1,4),plot(t_nc,f6_nc,'r'),xlabel('t'),ylabel('F'),hold on, plot(t_sc,f6_sc,'g') ,hold on, plot(t_ic,f6_ic,'b'),


 figure,plot(t_nc,f6_nc,'r'),xlabel('t'),ylabel('F'),hold on, plot(t_sc,f6_sc,'g') ,hold on, plot(t_ic,f6_ic,'b'),



% td=t_nc(2:end)-t_nc(1:(end-1))
% figure,plot(td,'.')

t_s=0.001;
i=1;
t_sc_d=t_sc(i);
f_sc_d=f6_sc(i);


for k=2:length(t_sc)
    d=t_sc(k)-t_sc_d(i);
    if (d<=t_s)
        i=i+1;
        t_sc_d(i)=t_sc_d(i-1)+t_s;
        f_sc_d(i)=f6_sc(k);
    else 
        n=fix(d/t_s);
        for j=1:n
            i=i+1;
            t_sc_d(i)=t_sc_d(i-1)+t_s;
            f_sc_d(i)=f6_sc(k);            
        end        
    end
    
end

figure,plot(t_sc,f6_sc,'r'),xlabel('t'),ylabel('F'),hold on, plot(t_sc_d,f_sc_d,'m')% ,hold on, plot(t_ic,f6_ic,'b'),















