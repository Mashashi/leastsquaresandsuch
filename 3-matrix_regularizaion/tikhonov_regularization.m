%Ax=b
a=[1 1;-4 1];
eig(a)
[u,s,v]=svd(a);
b=[1 2]';
a_new=tikhonov(u,s,v,b,a);% Last parameter is assumed as 0 matrix of the same dimension as v
eig(a_new)