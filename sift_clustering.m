clear all;close all;clc;
files = dir('/home/vatsal/CVIT/Honours/github/sift_training/*.jpg');
no_im = size(files,1);
i=1;j=1;k=300;
load /home/vatsal/CVIT/Honours/github/features.mat ;
load /home/vatsal/CVIT/Honours/github/histograms.mat ;
load /home/vatsal/CVIT/Honours/github/means.mat ;
load /home/vatsal/CVIT/Honours/github/clusters.mat ;
%% k means clustering
% [clusters,means] = kmeans(data,k);
% m = randperm(size(data,1),k);
% 
% %Initializing random means
% for i = 1:k
%     index = m(i);
%     means(i,:) = data(index,:);
% end
% means = double(means);
% 
% for iter = 1:10
%     iter
%     for i = 1:size(data,1)
%         point = data(i,:);
%         for j = 1:k
%             mu = means(j,:);
%             dis(j) = norm(point-mu);
%         end
%         [mindist,ind] = min(dis);
%         cluter(i) = ind;
%     end
% 
%     %Recomputing means
%     for i=1:k
%         var = find(cluter == i);
%         for j=1:size(var)
%             temp = var(j);
%             temp2(j,:) = data(temp,:);
%         end
%         means(i,:) = mean(temp2,1);
%         clear temp2;
%     end
% end
% for i = 1:size(data,1)
%     point = data(i,:);
%     for j = 1:k
%         mu = means(j,:);
%         dis(j) = norm(point-mu);
%     end
%     [mindist,ind] = min(dis);
%     cluter(i) = ind;
% end


%% Creating histogram for each image
% count = 0;
% im_count = 1;
% histo = zeros(no_im,k);
% for file = files'
%     I = imread(file.name);
%     I = single(rgb2gray(I));
%     [f,d] = vl_sift(I);
%     d = d';
%     for it=1:size(d,1)
%         temp = clusters(count+it);
%         histo(im_count,temp) = histo(im_count,temp) + 1;
%     end
%     im_count = im_count + 1;
%     count = count + size(d,1);
% end

%% Computing histogram for query image

I = imread('/home/vatsal/CVIT/Honours/github/sift_training/12.jpg');
I = single(rgb2gray(I));
[f,d] = vl_sift(I);
d=d';
d = double(d);
histo2 = zeros(1,k);
for i=1:size(d,1)
    point1 = d(i,:);
    for j=1:k
        point2 = means(j,:);
        dis(j) = norm(point1-point2);
    end
    [val,ind] = min(dis);
    histo2(ind)=histo2(ind) + 1;
end
clear dis;
for i=1:no_im
    point = histo(i,:);
    dis(i) = norm(histo2-point);
end
[val,ind] = sort(dis);
figure
for i=1:6
    subplot(3,2,i);
    filename = strcat('/home/vatsal/CVIT/Honours/github/sift_training/',files(ind(i)).name);
    In = imread(filename);
    imshow(In);
end;