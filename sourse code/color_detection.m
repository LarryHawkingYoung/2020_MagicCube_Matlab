% author: ������
% date: 2020.12.10
% email: 827330379@qq.com
% pic_cell: 1x6Ԫ�����飬ÿ��Ԫ���ڰ�����һ��3ͨ��RGBͼ���������{}��ʹ�ò�������
% rubic_scale: ħ��������������Ϊ3��
function [R, RGB] = color_detection(pic_cell, rubik_scale)
    plot_hsv = 0;
    plot_scatter = 0;

    if (isempty(pic_cell))
        % ���Խ׶δ���һ��Ŀ¼����ȡ�Ѿ��зֺõ�ͼ��
        fileFolder=fullfile('.\fixed_pic');
        dirOutput=dir(fullfile(fileFolder,'*.jpg'));
        fileNames={dirOutput.name};
        pic_cell = cell(1,6);
        for i = 1 : length(fileNames)
            pic_cell{1, i} = imread(['fixed_pic/',fileNames{1, i}]);
        end
    end

    R = cell(rubik_scale, rubik_scale, 6);
    index_mat = gen_idx_mat(rubik_scale);
    % ��ʼ����ͨ������
    hue_mat = zeros(rubik_scale, rubik_scale, 6);
    sat_mat = zeros(rubik_scale, rubik_scale, 6);
    val_mat = zeros(rubik_scale, rubik_scale, 6);

    % ��ȡ���������Ϣ
    for side = 1 : 6
        hsv_pic = rgb2hsv(pic_cell{1, side});
        hue_channel = hsv_pic(:,:,1);
        sat_channel = hsv_pic(:,:,2);
        val_channel = hsv_pic(:,:,3);

        [pic_h,pic_w,~] = size(pic_cell{1, side});

        center_hs = ceil((1/(rubik_scale * 2) : 1/rubik_scale: 1) * pic_h);
        center_ws = ceil((1/(rubik_scale * 2) : 1/rubik_scale: 1) * pic_w);

        center_hs = repmat(center_hs',1,rubik_scale);
        center_ws = repmat(center_ws,rubik_scale,1);
        
        if (plot_hsv)
            % չʾHSV���ĵ���ȡ
            plot_hs = reshape(center_hs, 1, rubik_scale * rubik_scale);
            plot_ws = reshape(center_ws, 1, rubik_scale * rubik_scale);
            figure(side);
            imshow(permute(pic_cell{1, side}, [2 1 3]));
            hold on;
            plot(plot_hs,plot_ws, 'x');
        end
        for i = 1 : rubik_scale
            for j = 1 : rubik_scale
                % ��ȡ���ĵ�ɫ�ʷ������
                hue_mat(i,j,side) = hue_channel(center_ws(i,j),center_hs(i,j));
                sat_mat(i,j,side) = sat_channel(center_ws(i,j),center_hs(i,j));
                val_mat(i,j,side) = val_channel(center_ws(i,j),center_hs(i,j));
                if (plot_hsv)
                    text(center_ws(i,j)-30,center_hs(i,j)-30,...
                        ['H:',num2str(hue_mat(i,j))],'FontSize', 16);
                    text(center_ws(i,j)-30,center_hs(i,j)+30,...
                        ['S:',num2str(sat_mat(i,j))],'FontSize', 16);
                    text(center_ws(i,j)-30,center_hs(i,j)+60,...
                        ['V:',num2str(val_mat(i,j))],'FontSize', 16);
                end
                %R{i,j,side} = 
            end
        end
        if (plot_hsv)
            hold off;
        end
    end

    % ����۲�
    if (plot_scatter)
        figure(7);
        scatter3(reshape(hue_mat, 1, rubik_scale * rubik_scale * 6), ...
            reshape(sat_mat, 1, rubik_scale * rubik_scale * 6), ...
            reshape(val_mat, 1, rubik_scale * rubik_scale * 6));
    end
    
    % K-means����
    scatter_mat = [reshape(hue_mat, 1, rubik_scale * rubik_scale * 6);...
        reshape(sat_mat, 1, rubik_scale * rubik_scale * 6);...
        reshape(val_mat, 1, rubik_scale * rubik_scale * 6)]';
    
    % ��ȡ���ķ�����ɫ������ΪK-Means����ʼ��
    C_pri = [reshape(hue_mat(2,2,:), 1, 6);...
             reshape(sat_mat(2,2,:), 1, 6);...
             reshape(val_mat(2,2,:), 1, 6)]';

    
    [idx, C] = kmeans(scatter_mat, 6, 'Start', C_pri);

    % ��дħ����ɫ��Ϣ
    for i = 1 : length(idx)
        side = index_mat(2, i);
        row = index_mat(3, i);
        col = index_mat(4, i);
        R{row,col,side} = idx(i,1);
    end

    % ������ɫ��Ϣ
    RGB = hsv2rgb(C);
end

% �������������;���Ķ�Ӧ��ϵ����
function idx_mat = gen_idx_mat(rubik_scale)
    idx_mat = zeros(4, rubik_scale * rubik_scale * 6);
    count = 1;
    for side = 1 : 6
        for row = 1 : 3
            for col = 1 : 3
                idx_mat(:,count) = [count,side, row, col]';
                count = count + 1;
            end
        end
    end
end