function [loss,gradient,preds]=hinge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
% w weight vector (default w=0)
%
% OUTPUTS:
%
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%

[d,n]=size(xTr);

loss = sum(max((ones(1, n) - w' * xTr .* yTr), 0))+ lambda * (w' * w);
v = (sign(ones(1, n) - w' * xTr .* yTr) + ones(1,n)) ./ 2;
gradient = - xTr * (v.* yTr)' + 2 * lambda * w;

preds = sign (w' * xTr);
