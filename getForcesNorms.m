function F=getForcesNorms(Fxyz)
%% computes the norms of the forces
[~,k]=size(Fxyz);
F=[];
    for idx=1:(k/3) 
        Fx=Fxyz(:,(idx-1)*3+1);
        Fy=Fxyz(:,(idx-1)*3+2);
        Fz=Fxyz(:,(idx-1)*3+3);
        F=[F sqrt(Fx.^2+Fy.^2+Fz.^2)];
    end
end