im = imread('~/CVIT/Honours/github/images/old_trafford.jpg');
im1 = im(:,:,1);
im2 = im(:,:,2);
im3 = im(:,:,3);
x = imhist(im1);
y = imhist(im2);
z = imhist(im3);
x = x';y = y';z = z';
data(1,:) = [x y z];