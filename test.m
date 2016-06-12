
files_test = dir('/home/vatsal/CVIT/Honours/github/sift_training/*.jpg');
i=1;j=1;
%load /home/vatsal/CVIT/Honours/github/features.mat ;
%% Creating database
for file_t=files_test'
    I = imread(file_t.name);
    I = single(rgb2gray(I));
    [f,d] = vl_sift(I);
    data_test(i:i+size(d,2)-1,:,j) = d';
    j = j+1;
    i = i+size(d,2);
end
data_test = double(data_test);