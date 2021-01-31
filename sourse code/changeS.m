function S= changeS(sol)
S=cell(1);
j=1;
k=length(sol);
    for i=1:k
        if strcmp(sol{1,i},'F')==1
            S{1,j}='R';
            j=j+1;
        elseif strcmp(sol{1,i},'L')==1
            S{1,j}='F';
            j=j+1;
        elseif strcmp(sol{1,i},'B')==1    
            S{1,j}='L';
            j=j+1;
        elseif strcmp(sol{1,i},'R')==1     
            S{1,j}='B';
            j=j+1;
        elseif strcmp(sol{1,i},'U')==1     
            S{1,j}='U';
            j=j+1;
         elseif strcmp(sol{1,i},'D')==1     
            S{1,j}='D';
            j=j+1;
        elseif strcmp(sol{1,i},'F''')==1     
            S{1,j}='R-';
            j=j+1;
        elseif strcmp(sol{1,i},'B''')==1     
            S{1,j}='L-';  
            j=j+1;
        elseif strcmp(sol{1,i},'L''')==1     
            S{1,j}='F-';   
            j=j+1;
        elseif strcmp(sol{1,i},'R''')==1     
            S{1,j}='B-';   
            j=j+1;
        elseif strcmp(sol{1,i},'U''')==1     
            S{1,j}='U-';   
            j=j+1;
        elseif strcmp(sol{1,i},'D''')==1     
            S{1,j}='D-';   
            j=j+1;   
        elseif strcmp(sol{1,i},'F2')==1     
            S{1,j}='R';   
            j=j+1;   
            S{1,j}='R';   
            j=j+1;   
        elseif strcmp(sol{1,i},'L2')==1     
            S{1,j}='F';   
            j=j+1;   
            S{1,j}='F';   
            j=j+1;      
        elseif strcmp(sol{1,i},'B2')==1     
            S{1,j}='L';   
            j=j+1;   
            S{1,j}='L';   
            j=j+1;   
        elseif strcmp(sol{1,i},'R2')==1     
            S{1,j}='B';   
            j=j+1;   
            S{1,j}='B';   
            j=j+1;     
        elseif strcmp(sol{1,i},'D2')==1     
            S{1,j}='D';   
            j=j+1;   
            S{1,j}='D';   
            j=j+1;   
        elseif strcmp(sol{1,i},'U2')==1     
            S{1,j}='U';   
            j=j+1;   
            S{1,j}='U';   
            j=j+1;   
            
        end    
    end



end