close all;clear;clc;
a=30;b=10;
k = sym('k');j = sym('j');
f(k,j)=k*a+j*b;
cx=rand(1,100)*100;cy=rand(1,100)*100;
%cx=1:1:100;cy=1:1:100;
z=f(cx(1,:),cy(1,:))';
cx=cx';cy=cy';
%z=addNoise(500, 500, z);
z=double(z);
clearvars -except z k j a b cx cy
figure;
hold on;
mu=12;
h=[0.001;0.001];
s=1;
for i=1:length(z)-1
    x=[cx(i);cy(i)];
    e=z(i)-h'*x;
    h=h+mu.*e'*x;
    
    estimativa=h'*[cx(i+1);cy(i+1)];
    
%     r=toeplitz(autocorr(x));
%     upper_bound=max(r(:));
%     if ~isnan(upper_bound) && upper_bound<mu
%         r=eig(r);
%         mu=2/(max(r)+min(r));
%     end
    
    plot(s,estimativa, 'r+');
    plot(s,z(s), 'k+');
    s=s+1;
    
    pause(0.01);
    
end