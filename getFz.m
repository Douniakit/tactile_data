function F=getFz(Fxyz)
%% computes the norms of the forces
[~,k]=size(Fxyz);
F=[];
    for idx=1:(k/3) 
        Fz=Fxyz(:,(idx-1)*3+3);(idx-1)*3+3;
        F=[F Fz];
    end
end