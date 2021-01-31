function R10=changeR(R)

R9=R;

R(:,:,2)=R9(:,:,4);
R(:,:,4)=R9(:,:,2);
for side = 1 : 6
    for row = 1 : 3
        for col = 1 : 3
            if R(row,col,side)==2
                R(row,col,side)=4;
            elseif R(row,col,side)==4
                R(row,col,side)=2;
            end
        end    
    end        
end


R10=R;






