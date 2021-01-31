clear; close all;

for i='URLFDB'
    dir = i;
    rs=['testpic/' dir '.jpg'];
    pic=imread(rs);
    imshow(get_magic_face(pic));
    pause();
end