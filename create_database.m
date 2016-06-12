files = dir('/home/vatsal/CVIT/Honours/github/sift_training/*.jpg');
i=1;
for file=files'
    I = imread(file.name);
    I = single(rgb2gray(I));
    [f,d] = vl_sift(I);
    data(i:i+size(d,2)-1,:) = d';
    i = i+size(d,2);
end
data = double(data);
save('features','data');