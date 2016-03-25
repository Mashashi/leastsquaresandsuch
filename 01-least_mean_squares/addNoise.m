function [ noisy_var ] = addNoise( mu, sigma, var )
%ADDNOISE Summary of this function goes here
%   Detailed explanation goes here
peak=normpdf(mu,mu,sigma);
error=norminv(rand(length(var),1)*peak,mu,sigma);
noisy_var=double(var)+error;
end

