function Rotate(op)
    switch op
        case 'R'
            R();
        case 'R-'   
            R_();
        case 'L'
            L();
        case 'L-'
            L_();
        case 'B'
            B();
        case 'B-'    
            B_(); 
        case 'D'
            D();
        case 'D-'   
            D_();
        case 'F'
            F();
        case 'F-'    
            F_();
        case 'U'
            U();
        case 'U-'    
            U_();
    end
end

function R()
    global R_Cube;
    s=R_Cube;
    vector=[0 1 0];step=5;Point0=[0 0 0];
    for ii=1:18
        for jj=1:3
            for kk=1:3
                rotate(R_Cube{3,jj,kk},vector,step,Point0);
            end
        end
        pause(0.01);
    end 
    R_Cube{3,1,1}=s{3,1,3};R_Cube{3,1,2}=s{3,2,3};R_Cube{3,1,3}=s{3,3,3};
    R_Cube{3,2,1}=s{3,1,2};R_Cube{3,2,2}=s{3,2,2};R_Cube{3,2,3}=s{3,3,2};
    R_Cube{3,3,1}=s{3,1,1};R_Cube{3,3,2}=s{3,2,1};R_Cube{3,3,3}=s{3,3,1};
end
function R_()
    global R_Cube;
    s=R_Cube;
    vector=[0 1 0];An=-5;Point1=[0 0 0];
    for ii=1:18
        for jj=1:3
            for kk=1:3
                rotate(R_Cube{3,jj,kk},vector,An,Point1);
            end
        end
        pause(0.01);
    end 
    R_Cube{3,1,1}=s{3,3,1};R_Cube{3,1,2}=s{3,2,1};R_Cube{3,1,3}=s{3,1,1};
    R_Cube{3,2,1}=s{3,3,2};R_Cube{3,2,2}=s{3,2,2};R_Cube{3,2,3}=s{3,1,2};
    R_Cube{3,3,1}=s{3,3,3};R_Cube{3,3,2}=s{3,2,3};R_Cube{3,3,3}=s{3,1,3};
end

function L()
    global R_Cube;
    s=R_Cube;
    vector=[0 1 0];An=-5;Point1=[0 0 0];
    for ii=1:18
        for jj=1:3
            for kk=1:3
                rotate(R_Cube{1,jj,kk},vector,An,Point1);
            end
        end
        pause(0.01);
    end 
    R_Cube{1,1,1}=s{1,3,1};R_Cube{1,1,2}=s{1,2,1};R_Cube{1,1,3}=s{1,1,1};
    R_Cube{1,2,1}=s{1,3,2};R_Cube{1,2,2}=s{1,2,2};R_Cube{1,2,3}=s{1,1,2};
    R_Cube{1,3,1}=s{1,3,3};R_Cube{1,3,2}=s{1,2,3};R_Cube{1,3,3}=s{1,1,3};
end
function L_()
    global R_Cube;
    s=R_Cube;
    vector=[0 1 0];An=5;Point1=[0 0 0];
    for ii=1:18
        for jj=1:3
            for kk=1:3
                rotate(R_Cube{1,jj,kk},vector,An,Point1);
            end
        end
        pause(0.01);
    end 
    R_Cube{1,1,1}=s{1,1,3};R_Cube{1,1,2}=s{1,2,3};R_Cube{1,1,3}=s{1,3,3};
    R_Cube{1,2,1}=s{1,1,2};R_Cube{1,2,2}=s{1,2,2};R_Cube{1,2,3}=s{1,3,2};
    R_Cube{1,3,1}=s{1,1,1};R_Cube{1,3,2}=s{1,2,1};R_Cube{1,3,3}=s{1,3,1};
end

function B()
    global R_Cube;
    s=R_Cube;
    vector=[1 0 0];An=-5;Point1=[0 0 0];   
    for ii=1:18
        for jj=1:3
            for kk=1:3
                rotate(R_Cube{jj,1,kk},vector,An,Point1);
            end
        end
        pause(0.01);
    end 
    R_Cube(1,1,1)=s(1,1,3);R_Cube(1,1,2)=s(2,1,3);R_Cube(1,1,3)=s(3,1,3);
    R_Cube(2,1,1)=s(1,1,2);R_Cube(2,1,2)=s(2,1,2);R_Cube(2,1,3)=s(3,1,2);
    R_Cube(3,1,1)=s(1,1,1);R_Cube(3,1,2)=s(2,1,1);R_Cube(3,1,3)=s(3,1,1);
end
function B_()
    global R_Cube;
    s=R_Cube;
    vector=[1 0 0];An=5;Point1=[0 0 0];   
    for ii=1:18
        for jj=1:3
            for kk=1:3
                rotate(R_Cube{jj,1,kk},vector,An,Point1);
            end
        end
        pause(0.01);
    end 
    R_Cube(1,1,1)=s(3,1,1);R_Cube(1,1,2)=s(2,1,1);R_Cube(1,1,3)=s(1,1,1);
    R_Cube(2,1,1)=s(3,1,2);R_Cube(2,1,2)=s(2,1,2);R_Cube(2,1,3)=s(1,1,2);
    R_Cube(3,1,1)=s(3,1,3);R_Cube(3,1,2)=s(2,1,3);R_Cube(3,1,3)=s(1,1,3);
end

function D()
    global R_Cube;
    s=R_Cube;
    vector=[0 0 1];An=5; Point1=[0 0 0];   
    for ii=1:18
        for jj=1:3
            for kk=1:3
                rotate(R_Cube{jj,kk,1},vector,An,Point1);
            end
        end
        pause(0.01);
    end 
    R_Cube(1,1,1)=s(3,1,1);R_Cube(1,2,1)=s(2,1,1);R_Cube(1,3,1)=s(1,1,1);
    R_Cube(2,1,1)=s(3,2,1);R_Cube(2,2,1)=s(2,2,1);R_Cube(2,3,1)=s(1,2,1);
    R_Cube(3,1,1)=s(3,3,1);R_Cube(3,2,1)=s(2,3,1);R_Cube(3,3,1)=s(1,3,1);
end
function D_()
    global R_Cube;
    s=R_Cube;
    vector=[0 0 1];An=-5; Point1=[0 0 0];   
    for ii=1:18
        for jj=1:3
            for kk=1:3
                rotate(R_Cube{jj,kk,1},vector,An,Point1);
            end
        end
        pause(0.01);
    end 
    R_Cube(1,1,1)=s(1,3,1);R_Cube(1,2,1)=s(2,3,1);R_Cube(1,3,1)=s(3,3,1);
    R_Cube(2,1,1)=s(1,2,1);R_Cube(2,2,1)=s(2,2,1);R_Cube(2,3,1)=s(3,2,1);
    R_Cube(3,1,1)=s(1,1,1);R_Cube(3,2,1)=s(2,1,1);R_Cube(3,3,1)=s(3,1,1);
end

function F()
    global R_Cube;
    s=R_Cube;
    vector=[1 0 0];An=5;Point1=[0 0 0];   
    for ii=1:18
        for jj=1:3
            for kk=1:3
                rotate(R_Cube{jj,3,kk},vector,An,Point1);
            end
        end
        pause(0.01);
    end 
    R_Cube(1,3,1)=s(3,3,1);R_Cube(1,3,2)=s(2,3,1);R_Cube(1,3,3)=s(1,3,1);
    R_Cube(2,3,1)=s(3,3,2);R_Cube(2,3,2)=s(2,3,2);R_Cube(2,3,3)=s(1,3,2);
    R_Cube(3,3,1)=s(3,3,3);R_Cube(3,3,2)=s(2,3,3);R_Cube(3,3,3)=s(1,3,3);
end
function F_()
    global R_Cube;
    s=R_Cube;
    vector=[1 0 0];An=-5;Point1=[0 0 0];   
    for ii=1:18
        for jj=1:3
            for kk=1:3
                rotate(R_Cube{jj,3,kk},vector,An,Point1);
            end
        end
        pause(0.01);
    end 
    R_Cube(1,3,1)=s(1,3,3);R_Cube(1,3,2)=s(2,3,3);R_Cube(1,3,3)=s(3,3,3);
    R_Cube(2,3,1)=s(1,3,2);R_Cube(2,3,2)=s(2,3,2);R_Cube(2,3,3)=s(3,3,2);
    R_Cube(3,3,1)=s(1,3,1);R_Cube(3,3,2)=s(2,3,1);R_Cube(3,3,3)=s(3,3,1);
end

function U()
    global R_Cube;
    s=R_Cube;
    vector=[0 0 1];An=-5; Point1=[0 0 0];   
    for ii=1:18
        for jj=1:3
            for kk=1:3
                rotate(R_Cube{jj,kk,3},vector,An,Point1);
            end
        end
        pause(0.01);
    end 
    R_Cube(1,1,3)=s(1,3,3);R_Cube(1,2,3)=s(2,3,3);R_Cube(1,3,3)=s(3,3,3);
    R_Cube(2,1,3)=s(1,2,3);R_Cube(2,2,3)=s(2,2,3);R_Cube(2,3,3)=s(3,2,3);
    R_Cube(3,1,3)=s(1,1,3);R_Cube(3,2,3)=s(2,1,3);R_Cube(3,3,3)=s(3,1,3);
end
function U_()
    global R_Cube;
    s=R_Cube;
    vector=[0 0 1];An=5; Point1=[0 0 0];   
    for ii=1:18
        for jj=1:3
            for kk=1:3
                rotate(R_Cube{jj,kk,3},vector,An,Point1);
            end
        end
        pause(0.01);
    end 
    R_Cube(1,1,3)=s(3,1,3);R_Cube(1,2,3)=s(2,1,3);R_Cube(1,3,3)=s(1,1,3);
    R_Cube(2,1,3)=s(3,2,3);R_Cube(2,2,3)=s(2,2,3);R_Cube(2,3,3)=s(1,2,3);
    R_Cube(3,1,3)=s(3,3,3);R_Cube(3,2,3)=s(2,3,3);R_Cube(3,3,3)=s(1,3,3);
end
