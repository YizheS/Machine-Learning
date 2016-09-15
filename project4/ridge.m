function [loss,gradient]=ridge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% w weight vector (default w=0)
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
%
% OUTPUTS:
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%
[d,n]=size(xTr);
% g(w) = 2X(w'X-Y)' + 2lambda * w;
s = w' * xTr - yTr;
loss = s * s' + lambda * (w' * w);
gradient = 2 * xTr * s' + 2 * lambda * w;