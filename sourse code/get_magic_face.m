function [ret] = get_magic_face(pic)
show_remove_shadow=0;
show_before_canny=0;
before_show_region=0;
show_convex_image=0;
show_4points=0;
show_res=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% dont change
% https://blog.csdn.net/wangzhen_cv/article/details/50618147
img = rgb2gray(pic);
%构造高通滤波器
% rotate 6
% not rotate 8
filter1 = fspecial('gaussian', [36 36], 6);
filter2 = fspecial('gaussian', [36 36], 12);
high_pass = filter1 - filter2;

%利用对数变换将入射光和反射光部分分开
log_img = log(1.0 + double(img));

%将高斯高通滤波器与对数转换后的图像卷积
high_log_part = imfilter(log_img, high_pass, 'symmetric', 'conv');

%幂变换回来
high_part = exp(high_log_part) - 1.0;
minv = min(min(high_part));
maxv = max(max(high_part));

%显示结果图像
resultImg = (high_part - minv) / (maxv - minv);
%resultImg = histeq(resultImg);


% filter1 = fspecial('gaussian', [36 36], 6);
% resultImg= imfilter(resultImg, filter1, 'symmetric', 'conv');

if show_remove_shadow
    figure,imshow(resultImg);
    %pause();
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% https://blog.csdn.net/m0_37565736/article/details/79840428#1-%E7%BB%93%E6%9E%84%E5%85%83%E7%B4%A0%E7%9A%84%E6%9E%84%E9%80%A0%E4%B8%8E%E5%88%86%E8%A7%A3
% morphology

pic_ = resultImg;

%pic_ = histeq(pic);
%imshowpair(pic, pic_, 'montage');
%pause();




bw=im2bw(pic_);
%figure,imshow(bw);

%figure, imshow(bw);

se_sz = round(sqrt(numel(bw)) / 30);
% se_sz = 10;
se=strel('rectangle',[se_sz se_sz]);
bw = imdilate(bw, se);
% figure, imshow(bw);

bw = bwareaopen(bw, 10000);
bw = imerode(bw, se);
%figure, imshow(bw);


%pause();
%se=strel('sphere',10);

%figure,imshow(bw);

se=strel('rectangle',[10 10]);
bw = imerode(bw, se);
bw = bwareaopen(bw, 10000);

% bw = imopen(bw, se);

if show_before_canny
    figure,imshow(bw);
end

%%%% not change
se=strel('rectangle',[10 10]);
total_area = numel(bw);
[e,s]=edge(bw, 'canny');
e = imdilate(e, se);
%%%%%%%%
if before_show_region
    figure,imshow(e);
    %pause();
end

% https://blog.csdn.net/langb2014/article/details/49886787
% regionprops
stats = regionprops(e, 'BoundingBox', 'Image', 'ConvexImage', 'ConvexHull');
best_area = 0;
for i=1:numel(stats)
    img = stats(i).Image;
    area = numel(img);    
    sz = size(img);
    if sz(1) > 1.5 * sz(2) || sz(2) > 1.5 * sz(1)
        continue
    end
    
    box=stats(i).BoundingBox;
    
    if area > total_area * 0.01 && area < total_area * 0.5
        disp([num2str(size(img)) ' ' num2str(area)]);
        if area > best_area
            best_area = area;
            best_box = box;
            best_img = img;
            best = stats(i);
        end
        %disp();
        %figure(1);
        %imshow(img);
        %pause();
        
        %figure(2);
        %imshow(pic);
        %rectangle('Position', box, 'LineWidth', 10)
        
        %pause();
    end
end

%figure(2);


%       'Area'              'EulerNumber'        'MinoraxisLength'               
%       'BoundingBox'       'Extent'             'Orientation'          
%       'Centroid'          'Extrema'            'Perimeter' 
%       'ConvexArea'        'FilledArea'         'PixelIdxList'
%       'ConvexHull'        'FilledImage'        'PixelList' 
%       'ConvexImage'       'Image'              'Solidity'            
%       'Circularity'       'MaxFeretProperties' 'SubarrayIdx'
%       'Eccentricity'      'MinFeretProperties'                 
%       'EquivDiameter'     'MajoraxisLength'


if show_convex_image
    figure,imshow(best.ConvexImage);
end
%best.ConvexImage
hull=best.ConvexHull;
% p1 RD; p2 LD; p3 LU; p4 RU
[a,idx_1]=max(hull(:, 1) + hull(:, 2));
[a,idx_2]=max(hull(:, 2) - hull(:, 1));
[a,idx_3]=min(hull(:, 1) + hull(:, 2));
[a,idx_4]=min(hull(:, 2) - hull(:, 1));
p1 = hull(idx_1, :);
p2 = hull(idx_2, :);
p3 = hull(idx_3, :);
p4 = hull(idx_4, :);


if show_4points
    figure,imshow(pic);
    hold on;
    %plot([p1(1) p1(2)],'*');
    %plot([p1(2) p1(1)],'*');%'MarkerSize', 20);
    plot(p1(1), p1(2), '*', 'MarkerSize', 20, 'MarkerEdgeColor', 'r')
    plot(p2(1), p2(2), '*', 'MarkerSize', 20, 'MarkerEdgeColor', 'b')
    plot(p3(1), p3(2), '*', 'MarkerSize', 20, 'MarkerEdgeColor', 'g')
    plot(p4(1), p4(2), '*', 'MarkerSize', 20, 'MarkerEdgeColor', 'k')
end
% p1 RD; p2 LD; p3 LU; p4 RU
pos = [0 0;1000 0;0 1000; 1000 1000];
% pos = [2000 0;3000 0;2000 1000; 3000 1000];
tform = fitgeotrans([p3;p4;p2;p1], pos, 'projective');



%J = imwarp(pic, tform, 'cubic');
J = imwarp(pic, tform, 'OutputView', imref2d([1000, 1000]));
% p1 = p1 * tform.T;
% if show_res
%     
%     figure
%     plot([166, 166], [0, 1000], 'Linewidth', 5)
%     plot([499 499], [0, 1000], 'Linewidth', 5)
%     plot([832 832], [0, 1000], 'Linewidth', 5)
%     plot([0, 1000],[166, 166],'Linewidth', 5)
%     plot([0, 1000],[499 499], 'Linewidth', 5)
%     plot([0, 1000],[832 832], 'Linewidth', 5)
%     imshow(J);
%     hold on;
% 
% end
ret=J;


if show_res
for i=[166 0 166 1000; 499 0 499 1000; 832 0 832 1000; 
        0 166 1000 166; 0 499 1000 499 ; 0 832 1000 832
        ]'
    J = insertShape(J,'Line', i','LineWidth',5,'Color','r');
    
end
figure, imshow(J);
end
%figure, imshow(J);
% imwrite(J, wdir);
% plot([166, 166], [0, 1000], 'Linewidth', 5, 'EdgeColor', 'r')
% plot([499 499], [0, 1000], 'Linewidth', 5, 'EdgeColor', 'r')
% plot([832 832], [0, 1000], 'Linewidth', 5, 'EdgeColor', 'r')
% plot([0, 1000],[166, 166],'Linewidth', 5, 'EdgeColor', 'r')
% plot([0, 1000],[499 499], 'Linewidth', 5, 'EdgeColor', 'r')
% plot([0, 1000],[832 832], 'Linewidth', 5, 'EdgeColor', 'r')



% ret = J;
%rectangle('Position', best_box, 'LineWidth', 10);
end