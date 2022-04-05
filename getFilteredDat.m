function dat_f=getFilteredDat(my_data,min_d,max_d)
[n m]=size(my_data);
dat_f=my_data;
for i=1:n
   
    for j=2:m
        if (dat_f(i,j)<=max_d(j)) && (dat_f(i,j)>=min_d(j))
            dat_f(i,j)=0;        
        end
              
    end
end
end