function plotForces(Fxyz)
[~,k]=size(Fxyz);
F=[];
figure,
for idx=1:(k/3) 
        Fx=Fxyz(:,(idx-1)*3+1);
        Fy=Fxyz(:,(idx-1)*3+2);
        Fz=Fxyz(:,(idx-1)*3+3);
        F=[F sqrt(Fx.^2+Fy.^2+Fz.^2)];
        %title('i='+string(idx))
        subplot(4,1,1),plot(Fx),xlabel('t'),ylabel('Fx'),hold on
        subplot(4,1,2),plot(Fy),xlabel('t'),ylabel('Fy'),hold on
        subplot(4,1,3),plot(Fz),xlabel('t'),ylabel('Fz'),hold on
        subplot(4,1,4),plot(F),xlabel('t'),ylabel('F'),hold on
end
end