function ReviseColor()
close all;
global RC;
global R_ R;
global RGB;
R_=R;

%%load('output_color_detection_fixed.mat');

    RC.window = figure('units', 'pixels',...
                'position', [300 150 1000 600],...
                'menubar', 'figure',...
                'name', 'Please Revise Colors',...
                'numbertitle', 'off',...
                'resize', 'off');
    size = 50;
    x = 600;
    y = 250;
    delta = 5;
    
    for i = 0:2
        for j = 1:3
            RC.face1(3*i+j) = uicontrol('parent',RC.window,...
                             'style','pushbutton',...
                             'string',R_{3-i,j,1},...
                             'position',[x+size*(j-1),y+size*i,size,size],...
                             'visible','on',...
                             'backgroundcolor',RGB(R_{3-i,j,1},:),...
                             'callback',@(~,~)callbackFcn_1(3-i,j));
        end
    end
    
    x = x - 3 * size - delta;
    y = y;
    for i = 0:2
        for j = 1:3
            RC.face2(3*i+j) = uicontrol('parent',RC.window,...
                             'style','pushbutton',...
                             'string',R_{3-i,j,2},...
                             'position',[x+size*(j-1),y+size*i,size,size],...
                             'visible','on',...
                             'backgroundcolor',RGB(R_{3-i,j,2},:),...
                             'callback',@(~,~)callbackFcn_2(3-i,j));
        end
    end
    
    x = x - 3 * size - delta;
    y = y;
    for i = 0:2
        for j = 1:3
            RC.face3(3*i+j) = uicontrol('parent',RC.window,...
                             'style','pushbutton',...
                             'string',R_{3-i,j,3},...
                             'position',[x+size*(j-1),y+size*i,size,size],...
                             'visible','on',...
                             'backgroundcolor',RGB(R_{3-i,j,3},:),...
                             'callback',@(~,~)callbackFcn_3(3-i,j));
        end
    end
    
    x = x - 3 * size - delta;
    y = y;
    for i = 0:2
        for j = 1:3
            RC.face4(3*i+j) = uicontrol('parent',RC.window,...
                             'style','pushbutton',...
                             'string',R_{3-i,j,4},...
                             'position',[x+size*(j-1),y+size*i,size,size],...
                             'visible','on',...
                             'backgroundcolor',RGB(R_{3-i,j,4},:),...
                             'callback',@(~,~)callbackFcn_4(3-i,j));
        end
    end
    
    x = x + 3 * delta + 9 * size;
    y = y + delta + 3 * size;
    for i = 0:2
        for j = 1:3
            RC.face5(3*i+j) = uicontrol('parent',RC.window,...
                             'style','pushbutton',...
                             'string',R_{3-i,j,5},...
                             'position',[x+size*(j-1),y+size*i,size,size],...
                             'visible','on',...
                             'backgroundcolor',RGB(R_{3-i,j,5},:),...
                              'callback',@(~,~)callbackFcn_5(3-i,j));
        end
    end
    
    x = x;
    y = y - 2 * delta - 6 * size;
    for i = 0:2
        for j = 1:3
            RC.face6(3*i+j) = uicontrol('parent',RC.window,...
                             'style','pushbutton',...
                             'string',R_{3-i,j,6},...
                             'position',[x+size*(j-1),y+size*i,size,size],...
                             'visible','on',...
                             'backgroundcolor',RGB(R_{3-i,j,6},:),...
                              'callback',@(~,~)callbackFcn_6(3-i,j));
        end
    end
   
    RC.confirm = uicontrol('parent',RC.window,...
                             'style','pushbutton',...
                             'string',"确认",...
                             'position',[450,50,50,50],...
                             'visible','on',...
                             'callback',@(~,~)callbackFcn_confirm);
                         
     R=R_;
end

function callbackFcn_1(index1,index2)
global RC;
global R_;
global RGB;
%%load('output_color_detection_fixed.mat');
    RC.cb = figure('units', 'pixels',...
                'position', [550 300 500 300],...
                'menubar', 'figure',...
                'name', 'Please Revise Colors',...
                'numbertitle', 'off',...
                'resize', 'off');
           size = 80;
           x = 25;
            y = 180;
            delta=30;

            for i = 1:3
                   RC.color(i) = uicontrol('parent',RC.cb,...
                             'style','pushbutton',...
                              'string',i,...
                              'Fontsize',10,...
                             'position',[x+size*i,y,size,size],...
                             'visible','on',...
                             'backgroundcolor',RGB(i,:),...
                             'callback',@(~,~,~,~)callbackFcn_7(i,index1,index2,1));
                        x = x+delta;
            end
    x = 25;
    y = y-size-delta;
            for i = 4:6
                   RC.color(i) = uicontrol('parent',RC.cb,...
                             'style','pushbutton',...
                              'string',i,...
                              'Fontsize',10,...
                             'position',[x+size*(i-3),y,size,size],...
                             'visible','on',...
                             'backgroundcolor',RGB(i,:),...
                             'callback',@(~,~,~,~)callbackFcn_7(i,index1,index2,1));
                         x = x+delta;
            end
            
end

function callbackFcn_2(index1,index2)
global RC;
global R_;
global RGB;
%%load('output_color_detection_fixed.mat');
    RC.cb = figure('units', 'pixels',...
                'position', [550 300 500 300],...
                'menubar', 'figure',...
                'name', 'Please Revise Colors',...
                'numbertitle', 'off',...
                'resize', 'off');
           size = 80;
           x = 25;
            y = 180;
            delta=30;

            for i = 1:3
                   RC.color(i) = uicontrol('parent',RC.cb,...
                             'style','pushbutton',...
                              'string',i,...
                              'Fontsize',10,...
                             'position',[x+size*i,y,size,size],...
                             'visible','on',...
                             'backgroundcolor',RGB(i,:),...
                             'callback',@(~,~,~,~)callbackFcn_7(i,index1,index2,2));
                        x = x+delta;
            end
    x = 25;
    y = y-size-delta;
            for i = 4:6
                   RC.color(i) = uicontrol('parent',RC.cb,...
                             'style','pushbutton',...
                              'string',i,...
                              'Fontsize',10,...
                             'position',[x+size*(i-3),y,size,size],...
                             'visible','on',...
                             'backgroundcolor',RGB(i,:),...
                             'callback',@(~,~,~,~)callbackFcn_7(i,index1,index2,2));
                         x = x+delta;
            end
              
end

function callbackFcn_3(index1,index2)
global RC;
global R_;
global RGB;
%%load('output_color_detection_fixed.mat');
    RC.cb = figure('units', 'pixels',...
                'position', [550 300 500 300],...
                'menubar', 'figure',...
                'name', 'Please Revise Colors',...
                'numbertitle', 'off',...
                'resize', 'off');
           size = 80;
           x = 25;
            y = 180;
            delta=30;

            for i = 1:3
                   RC.color(i) = uicontrol('parent',RC.cb,...
                             'style','pushbutton',...
                              'string',i,...
                              'Fontsize',10,...
                             'position',[x+size*i,y,size,size],...
                             'visible','on',...
                             'backgroundcolor',RGB(i,:),...
                             'callback',@(~,~,~,~)callbackFcn_7(i,index1,index2,3));
                        x = x+delta;
            end
    x = 25;
    y = y-size-delta;
            for i = 4:6
                   RC.color(i) = uicontrol('parent',RC.cb,...
                             'style','pushbutton',...
                              'string',i,...
                              'Fontsize',10,...
                             'position',[x+size*(i-3),y,size,size],...
                             'visible','on',...
                             'backgroundcolor',RGB(i,:),...
                             'callback',@(~,~,~,~)callbackFcn_7(i,index1,index2,3));
                         x = x+delta;
            end
              
end

function callbackFcn_4(index1,index2)
global RC;
global R_;
global RGB;
%%load('output_color_detection_fixed.mat');
    RC.cb = figure('units', 'pixels',...
                'position', [550 300 500 300],...
                'menubar', 'figure',...
                'name', 'Please Revise Colors',...
                'numbertitle', 'off',...
                'resize', 'off');
           size = 80;
           x = 25;
            y = 180;
            delta=30;

            for i = 1:3
                   RC.color(i) = uicontrol('parent',RC.cb,...
                             'style','pushbutton',...
                              'string',i,...
                              'Fontsize',10,...
                             'position',[x+size*i,y,size,size],...
                             'visible','on',...
                             'backgroundcolor',RGB(i,:),...
                             'callback',@(~,~,~,~)callbackFcn_7(i,index1,index2,4));
                        x = x+delta;
            end
    x = 25;
    y = y-size-delta;
            for i = 4:6
                   RC.color(i) = uicontrol('parent',RC.cb,...
                             'style','pushbutton',...
                              'string',i,...
                              'Fontsize',10,...
                             'position',[x+size*(i-3),y,size,size],...
                             'visible','on',...
                             'backgroundcolor',RGB(i,:),...
                             'callback',@(~,~,~,~)callbackFcn_7(i,index1,index2,4));
                         x = x+delta;
            end
             
end

function callbackFcn_5(index1,index2)
global RC;
global R_;
global RGB;
%%load('output_color_detection_fixed.mat');
    RC.cb = figure('units', 'pixels',...
                'position', [550 300 500 300],...
                'menubar', 'figure',...
                'name', 'Please Revise Colors',...
                'numbertitle', 'off',...
                'resize', 'off');
           size = 80;
           x = 25;
            y = 180;
            delta=30;

            for i = 1:3
                   RC.color(i) = uicontrol('parent',RC.cb,...
                             'style','pushbutton',...
                              'string',i,...
                              'Fontsize',10,...
                             'position',[x+size*i,y,size,size],...
                             'visible','on',...
                             'backgroundcolor',RGB(i,:),...
                             'callback',@(~,~,~,~)callbackFcn_7(i,index1,index2,5));
                        x = x+delta;
            end
    x = 25;
    y = y-size-delta;
            for i = 4:6
                   RC.color(i) = uicontrol('parent',RC.cb,...
                             'style','pushbutton',...
                              'string',i,...
                              'Fontsize',10,...
                             'position',[x+size*(i-3),y,size,size],...
                             'visible','on',...
                             'backgroundcolor',RGB(i,:),...
                             'callback',@(~,~,~,~)callbackFcn_7(i,index1,index2,5));
                         x = x+delta;
            end
            
end

function callbackFcn_6(index1,index2)
global RC;
global R_;
global RGB;
%%load('output_color_detection_fixed.mat');
    RC.cb = figure('units', 'pixels',...
                'position', [550 300 500 300],...
                'menubar', 'figure',...
                'name', 'Please Revise Colors',...
                'numbertitle', 'off',...
                'resize', 'off');
           size = 80;
           x = 25;
            y = 180;
            delta=30;

            for i = 1:3
                   RC.color(i) = uicontrol('parent',RC.cb,...
                             'style','pushbutton',...
                              'string',i,...
                              'Fontsize',10,...
                             'position',[x+size*i,y,size,size],...
                             'visible','on',...
                             'backgroundcolor',RGB(i,:),...
                             'callback',@(~,~,~,~)callbackFcn_7(i,index1,index2,6));
                        x = x+delta;
            end
    x = 25;
    y = y-size-delta;
            for i = 4:6
                   RC.color(i) = uicontrol('parent',RC.cb,...
                             'style','pushbutton',...
                              'string',i,...
                              'Fontsize',10,...
                             'position',[x+size*(i-3),y,size,size],...
                             'visible','on',...
                             'backgroundcolor',RGB(i,:),...
                             'callback',@(~,~,~,~)callbackFcn_7(i,index1,index2,6));
                         x = x+delta;
            end
              
end

function callbackFcn_7(index,index1,index2,face)
%%load('output_color_detection_fixed.mat');
global RC;
global R_;
global RGB;

    button_state = index; 
    switch face
        case 1
            set(RC.face1(3*(3-index1)+index2),'backgroundcolor',RGB(button_state,:));
            set(RC.face1(3*(3-index1)+index2),'string',button_state);
            R_{index1,index2,1} = button_state;
        case 2
            set(RC.face2(3*(3-index1)+index2),'backgroundcolor',RGB(button_state,:));
            set(RC.face2(3*(3-index1)+index2),'string',button_state);
            R_{index1,index2,2} = button_state;
        case 3
            set(RC.face3(3*(3-index1)+index2),'backgroundcolor',RGB(button_state,:));
            set(RC.face3(3*(3-index1)+index2),'string',button_state);
            R_{index1,index2,3} = button_state;
        case 4
            set(RC.face4(3*(3-index1)+index2),'backgroundcolor',RGB(button_state,:));
            set(RC.face4(3*(3-index1)+index2),'string',button_state);
            R_{index1,index2,4} = button_state;
        case 5
            set(RC.face5(3*(3-index1)+index2),'backgroundcolor',RGB(button_state,:));
            set(RC.face5(3*(3-index1)+index2),'string',button_state);
            R_{index1,index2,5} = button_state;
        case 6
            set(RC.face6(3*(3-index1)+index2),'backgroundcolor',RGB(button_state,:));
            set(RC.face6(3*(3-index1)+index2),'string',button_state);
            R_{index1,index2,6} = button_state;
        otherwise
    end
            close(RC.cb);       
end

function callbackFcn_confirm()
%load('output_color_detection_fixed.mat');
global R_;
global RC;
flag=0; %为1代表仍有错

    num1=0;num2=0;num3=0;num4=0;num5=0;num6=0;
            for i=1:3
                for j=1:3
                    for k=1:6
                         switch(R_{i,j,k})
                             case 1
                                 num1 = num1 + 1;
                             case 2
                                 num2 = num2 + 1;
                             case 3
                                 num3 = num3 + 1;
                             case 4
                                 num4 = num4 + 1;
                             case 5
                                 num5 = num5 + 1;
                             case 6
                                 num6 = num6 + 1;
                             otherwise
                         end      
                    end
                end
            end
            if num1==9&&num2==9&&num3==9&&num4==9&&num5==9&&num6==9
               flag=1;
            end
            if flag==1
               % h=msgbox('结果正确！', '正确');
                 RC.window2 = figure('units', 'pixels',...
                'position', [630 450 250 100],...
                'menubar', 'none',...
                'name', '正确',...
                'numbertitle', 'off',...
                'resize', 'off');
                
                RC.prompt = uicontrol('parent',RC.window2,...
                             'style','text',...
                             'string',"结果正确!",...
                             'position',[100,30,60,50],...
                             'Fontsize',10.0,...
                             'visible','on');
                RC.end = uicontrol('parent',RC.window2,...
                             'style','pushbutton',...
                             'string',"确认",...
                             'position',[110,10,40,20],...
                             'visible','on',...
                             'callback',@(~,~)callbackFcn_end);
            else
                h=errordlg('结果仍有误！', 'error');
            %   close(h);
            end
end

function callbackFcn_end()
    global R R_;
    R = R_;
    Show_Raw_Cube();
end
