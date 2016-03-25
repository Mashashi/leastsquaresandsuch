%
close all;clear;clc;
% 
a=30;b=10;
%
k = sym('k');j = sym('j');
f(k,j)=k*a+j*b;
%
points=100;
cx=rand(1,points)*100;cy=rand(1,points)*100;
z=f(cx(1,:),cy(1,:))';
cx=cx';cy=cy';
z=addNoise(1, 1, z);%z=double(z);
clearvars -except z k j a b cx cy

tic
s=0;
x=[cx(1,1) cy(1,1)];
for i=2:length(z)
     
    x=[x;cx(i,1) cy(i,1)];
    %x_hat=pinv(x)*z(1:i);
    %x_hat=inv(x'*x)*x'*z(1:i);
    if rank(x)==size(x,2)
        [Q, R] = qr(x);x_hat = R\(Q'*z(1:i)); 
    else
        disp('O sistema não pode ser determinado\r\n'); % Raro acontecer
    end

%   R = triu(qr(x));x_hat = R\(R'\(x'*z(1:i)));
%   [~, R] = qr(x);x_hat = R\(R'\(x'*z(1:i)));

    

    subplot(2,1,1);
    hold on;
    plot(s,x_hat(1),'r.');
    subplot(2,1,2);
    hold on;
    plot(s,x_hat(2),'r.');
    
    s=s+1;
    %pause(0.001);
end
toc

% Com 100 pontos
% QR tictoc=0.481152s
% pinv tictoc=0.617106s
% inv=0.545339s 