function BDT=boosttree(x,y,nt,maxdepth)
% function BDT=boosttree(x,y,nt,maxdepth)
%
% Learns a boosted decision tree on data x with labels y.
% It performs at most nt boosting iterations. Each decision tree has maximum depth "maxdepth".
%
% INPUT:
% x  | input vectors dxn
% y  | input labels 1xn
% nt | number of trees (default = 100)
% maxdepth | depth of each tree (default = 3)
%
% OUTPUT:
% BDT | Boosted DTree
%


%% fill in code here

if nargin<3
    maxdepth = 3; 
    nt = 100;
end;
if nargin<4
    maxdepth = 3; 
end;
n=size(x,2);
weights = ones(1,n)/n; 

BDT = cell(2,nt);
for n = 1:nt
    T = id3tree(x,y,maxdepth, weights); 
    h = evaltree(T,x);
    h = (h-1.5).*2; 
    y = (y-1.5).*2;
    err=weights*(h~=y)';
    if err>0.5
        break
    end
     alpha = 0.5.*log((1-err)/err);


    weights = weights.*exp(-alpha*h.*y)/(2*sqrt(err*(1-err)));
    y = y/2 + 1.5;
    BDT{1,n} = alpha;
    BDT{2,n} = T;
end;   

