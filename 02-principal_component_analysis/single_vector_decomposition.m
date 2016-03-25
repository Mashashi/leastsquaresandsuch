close all;clear;clc;
image=double(rgb2gray(imread('lena.bmp')));
[u,s,v]=svd(image);
figure

imagesc(uint8(image));
colormap('gray');
figure
imagesc(u*s*v');
colormap('gray');

n=630;
eigen_values=diag(s);
l=size(eigen_values,1);
eigen_values(l-n:1:l)=0;
s(1:size(s,2)+1:end)=eigen_values;

figure
imagesc(u*s*v');
colormap('gray');