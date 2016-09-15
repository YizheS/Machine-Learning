function [loss,gradient]=logistic(w,xTr,yTr)
% function w=logistic(w,xTr,yTr)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% w weight vector (default w=0)
%
% OUTPUTS:
% 
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%n

[d,n]=size(xTr);
gradient = -xTr * (yTr./(1+exp(w'*xTr.*yTr)))';
loss = sum(log(1+exp(-w'*xTr.*yTr)));