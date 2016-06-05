clear all;clc;close all;
cd ./training ;
files = dir('*.jpg');
i = 1;
for file=files'
    im = imread(file.name);
    im1 = im(:,:,1);
    im2 = im(:,:,2);
    im3 = im(:,:,3);
    x = imhist(im1);
    y = imhist(im2);
    z = imhist(im3);
    x = x';y = y';z = z';
    data(i,:) = [x y z];
    i = i+1;
end
cd .. ;
save('datafile','data');