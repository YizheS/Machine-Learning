function ybar=computeybar(xTe)
% function [ybar]=ybar(xTe);
% 
% computes the expected label 'ybar' for a set of inputs x
% generated from two standard Normal distributions (one offset by OFFSET in
% both dimensions.)
%
% INPUT:
% xTe | a 2xn matrix of column input vectors
% 
% OUTPUT:
% ybar | a 1xn vector of the expected label ybare(x)
%

global OFFSET;

[~,n]=size(xTe);
ybar=zeros(1,n);

% Feel free to use the following function to compute p(x|y)
normpdf=@(x,mu,sigma)   exp(-0.5 * ((x - mu)./sigma).^2) ./ (sqrt(2*pi) .* sigma);

% %probability of p(y=1|x)
% 
pxy1 = normpdf(xTe,0,1);
pxy2 = normpdf(xTe,OFFSET,1);
p1 = pxy1(1,:) .* pxy1(2,:) ./ (pxy1(1,:) .* pxy1(2,:) + pxy2(1,:) .* pxy2(2,:));

ybar = p1 + (1-p1)*2;