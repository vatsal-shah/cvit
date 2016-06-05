load datafile.mat;
cd ./testing ;
im = imread('1.jpg');
cd ..
im1 = im(:,:,1);
im2 = im(:,:,2);
im3 = im(:,:,3);
x = imhist(im1);
y = imhist(im2);
z = imhist(im3);
x = x';y = y';z = z';
hist1 = [x y z];
hist1r = hist1(1:256);
hist1g = hist1(257:512);
hist1b = hist1(513:768);
for i=1:size(data,1)
    hist2 = data(i,:);
    hist2r = hist2(1:256);
    hist2g = hist2(257:512);
    hist2b = hist2(513:768);
    distanc(i,:) = norm(hist1r - hist2r) + norm(hist1g - hist2g) + norm(hist1b - hist2b);
    %distanc(i,:) = sum(abs(hist1 - hist2));
end
[mini,ind] = min(distanc);