function Show_Raw_Cube()
    close all;
    global Raw_Cube R_Cube RGB R;
%     load('output_color_detection.mat');
    Raw_Cube=cell(3,3,3);
    % 六个面
    x=[-0.5 +0.5 +0.5 -0.5 -0.5 -0.5;
       +0.5 +0.5 -0.5 -0.5 +0.5 +0.5;
       +0.5 +0.5 -0.5 -0.5 +0.5 +0.5;
       -0.5 +0.5 +0.5 -0.5 -0.5 -0.5;];
    y=[-0.5 -0.5 +0.5 -0.5 -0.5 -0.5;
       -0.5 +0.5 +0.5 +0.5 -0.5 -0.5;
       -0.5 +0.5 +0.5 +0.5 +0.5 +0.5;
       -0.5 -0.5 +0.5 -0.5 +0.5 +0.5;];
    z=[-0.5 -0.5 -0.5 -0.5 -0.5 +0.5;
       -0.5 -0.5 -0.5 -0.5 -0.5 +0.5;
       +0.5 +0.5 +0.5 +0.5 -0.5 +0.5;
       +0.5 +0.5 +0.5 +0.5 -0.5 +0.5;];

        x1=x+1.05;x2=x-1.05;
        y1=y+1.05;y2=y-1.05;
        z1=z+1.05;z2=z-1.05;
    dc = 'w'; % default color

    % 中间块，六个内部面
    Raw_Cube{2,2,2}=fill3(x,y,z,dc);hold on;
    % 六个面的中心面，一个外部面，五个内部面
    Raw_Cube{3,2,2}=fill3(x,y2,z,dc,x(:,1),y2(:,1),z(:,1),RGB(R{2,2,1},:));hold on;
    Raw_Cube{2,3,2}=fill3(x2,y,z,dc,x2(:,4),y(:,4),z(:,4),RGB(R{2,2,2},:));hold on;
    Raw_Cube{1,2,2}=fill3(x,y1,z,dc,x(:,3),y1(:,3),z(:,3),RGB(R{2,2,3},:));hold on;
    Raw_Cube{2,1,2}=fill3(x1,y,z,dc,x1(:,2),y(:,2),z(:,2),RGB(R{2,2,4},:));hold on;
    Raw_Cube{2,2,3}=fill3(x,y,z1,dc,x(:,6),y(:,6),z1(:,6),RGB(R{2,2,5},:));hold on;
    Raw_Cube{2,2,1}=fill3(x,y,z2,dc,x(:,5),y(:,5),z2(:,5),RGB(R{2,2,6},:));hold on;

    Raw_Cube{3,3,2}=fill3(x2,y2,z,dc,x2(:,4),y2(:,4),z(:,4),RGB(R{2,3,2},:),x2(:,1),y2(:,1),z(:,1),RGB(R{2,1,1},:));hold on;
    Raw_Cube{1,3,2}=fill3(x2,y1,z,dc,x2(:,3),y1(:,3),z(:,3),RGB(R{2,3,3},:),x2(:,4),y1(:,4),z(:,4),RGB(R{2,1,2},:));hold on;
    Raw_Cube{1,1,2}=fill3(x1,y1,z,dc,x1(:,2),y1(:,2),z(:,2),RGB(R{2,3,4},:),x1(:,3),y1(:,3),z(:,3),RGB(R{2,1,3},:));hold on;
    Raw_Cube{3,1,2}=fill3(x1,y2,z,dc,x1(:,1),y2(:,1),z(:,1),RGB(R{2,3,1},:),x1(:,2),y2(:,2),z(:,2),RGB(R{2,1,4},:));hold on;

    Raw_Cube{3,2,3}=fill3(x,y2,z1,dc,x(:,6),y2(:,6),z1(:,6),RGB(R{3,2,5},:),x(:,1),y2(:,1),z1(:,1),RGB(R{1,2,1},:));hold on;
    Raw_Cube{2,3,3}=fill3(x2,y,z1,dc,x2(:,6),y(:,6),z1(:,6),RGB(R{2,1,5},:),x2(:,4),y(:,4),z1(:,4),RGB(R{1,2,2},:));hold on;
    Raw_Cube{1,2,3}=fill3(x,y1,z1,dc,x(:,6),y1(:,6),z1(:,6),RGB(R{1,2,5},:),x(:,3),y1(:,3),z1(:,3),RGB(R{1,2,3},:));hold on;
    Raw_Cube{2,1,3}=fill3(x1,y,z1,dc,x1(:,6),y(:,6),z1(:,6),RGB(R{2,3,5},:),x1(:,2),y(:,2),z1(:,2),RGB(R{1,2,4},:));hold on;

    Raw_Cube{3,2,1}=fill3(x,y2,z2,dc,x(:,5),y2(:,5),z2(:,5),RGB(R{1,2,6},:),x(:,1),y2(:,1),z2(:,1),RGB(R{3,2,1},:));hold on;
    Raw_Cube{2,3,1}=fill3(x2,y,z2,dc,x2(:,5),y(:,5),z2(:,5),RGB(R{2,1,6},:),x2(:,4),y(:,4),z2(:,4),RGB(R{3,2,2},:));hold on;
    Raw_Cube{1,2,1}=fill3(x,y1,z2,dc,x(:,5),y1(:,5),z2(:,5),RGB(R{3,2,6},:),x(:,3),y1(:,3),z2(:,3),RGB(R{3,2,3},:));hold on;
    Raw_Cube{2,1,1}=fill3(x1,y,z2,dc,x1(:,5),y(:,5),z2(:,5),RGB(R{2,3,6},:),x1(:,2),y(:,2),z2(:,2),RGB(R{3,2,4},:));hold on;

    Raw_Cube{3,3,1}=fill3(x2,y2,z2,dc,x2(:,5),y2(:,5),z2(:,5),RGB(R{1,1,6},:),x2(:,4),y2(:,4),z2(:,4),RGB(R{3,3,2},:),x2(:,1),y2(:,1),z2(:,1),RGB(R{3,1,1},:));hold on;
    Raw_Cube{1,3,1}=fill3(x2,y1,z2,dc,x2(:,5),y1(:,5),z2(:,5),RGB(R{3,1,6},:),x2(:,3),y1(:,3),z2(:,3),RGB(R{3,3,3},:),x2(:,4),y1(:,4),z2(:,4),RGB(R{3,1,2},:));hold on;
    Raw_Cube{1,1,1}=fill3(x1,y1,z2,dc,x1(:,5),y1(:,5),z2(:,5),RGB(R{3,3,6},:),x1(:,2),y1(:,2),z2(:,2),RGB(R{3,3,4},:),x1(:,3),y1(:,3),z2(:,3),RGB(R{3,1,3},:));hold on;
    Raw_Cube{3,1,1}=fill3(x1,y2,z2,dc,x1(:,5),y2(:,5),z2(:,5),RGB(R{1,3,6},:),x1(:,1),y2(:,1),z2(:,1),RGB(R{3,3,1},:),x1(:,2),y2(:,2),z2(:,2),RGB(R{3,1,4},:));hold on;

    Raw_Cube{3,3,3}=fill3(x2,y2,z1,dc,x2(:,6),y2(:,6),z1(:,6),RGB(R{3,1,5},:),x2(:,4),y2(:,4),z1(:,4),RGB(R{1,3,2},:),x2(:,1),y2(:,1),z1(:,1),RGB(R{1,1,1},:));hold on;
    Raw_Cube{1,3,3}=fill3(x2,y1,z1,dc,x2(:,6),y1(:,6),z1(:,6),RGB(R{1,1,5},:),x2(:,3),y1(:,3),z1(:,3),RGB(R{1,3,3},:),x2(:,4),y1(:,4),z1(:,4),RGB(R{1,1,2},:));hold on;
    Raw_Cube{1,1,3}=fill3(x1,y1,z1,dc,x1(:,6),y1(:,6),z1(:,6),RGB(R{1,3,5},:),x1(:,2),y1(:,2),z1(:,2),RGB(R{1,3,4},:),x1(:,3),y1(:,3),z1(:,3),RGB(R{1,1,3},:));hold on;
    Raw_Cube{3,1,3}=fill3(x1,y2,z1,dc,x1(:,6),y2(:,6),z1(:,6),RGB(R{3,3,5},:),x1(:,1),y2(:,1),z1(:,1),RGB(R{1,3,1},:),x1(:,2),y2(:,2),z1(:,2),RGB(R{1,1,4},:));hold on;

    R_Cube=Raw_Cube;

    axis([-3 3 -3 3 -3 3]);
    axis square;
    grid on;
    title('Show the Raw Cube','Color','m');
    xlabel('X');ylabel('Y');zlabel('Z');
    pause(1);
    
    R_t = zeros(3,3,6);
    
    for i = 1 : 6
        for j = 1:3
            for k = 1:3
                R_t(j,k,i) = R{j,k,i};
            end
        end
    end
    R = R_t;
    R_t=changeR(R);
    sol=Solve45(R_t);
    sol2=changeS(sol);
    
    uicontrol('style','pushbutton',...
             'string','开始',...
             'position',[0,0,80,40],...
             'visible','on',...
             'callback',{@Start, sol2});

end

function Start(~,~,sol)
    for i = 1:length(sol)
        Rotate(sol{1,i});
%         pause(0.01);
    end
end

