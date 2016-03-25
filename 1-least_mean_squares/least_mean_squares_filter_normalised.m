close all;clear;clc;
a=30;b=10;
k = sym('k');j = sym('j');
f(k,j)=k*a+j*b;%f(k,j)=sin(((k*a+j*b)/(30*100+10*100))*2*pi);
cx=1:1:100;cy=1:1:100;%cx=0:0.01:2*pi;cy=0:0.01:2*pi;
z=f(cx(1,:),cy(1,:))';
cx=cx';cy=cy';
z=double(z);%z=addNoise(1, 1, z);
clearvars -except z k j a b cx cy
figure;
hold on;
mu=0.05;%mu=1 optimal learning rate if there is no intereference in z
h=[0.001;0.001];
s=1;
for i=1:length(z)-1
    
    x=[cx(i);cy(i)];
    e=z(i)-h'*x;
    h=h+mu.*e'*x/(x'*x);
    estimativa=h'*[cx(i+1);cy(i+1)];
    
    plot(s,estimativa, 'r+');
    plot(s,z(s), 'k+');
    s=s+1;
    
end