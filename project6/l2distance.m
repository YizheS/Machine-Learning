function D=l2distance(X,Z)
% function D=l2distance(X,Z)
%	
% Computes the Euclidean distance matrix. 
% Syntax:
% D=l2distance(X,Z)
% Input:
% X: dxn data matrix with n vectors (columns) of dimensionality d
% Z: dxm data matrix with m vectors (columns) of dimensionality d
%
% Output:
% Matrix D of size nxm 
% D(i,j) is the Euclidean distance of X(:,i) and Z(:,j)
%
% call with only one input:
% l2distance(X)=l2distance(X,X)
%

[d,n]=size(X);
% YOUR CODE (you can copy it from previous projects)
if(nargin == 1)
    D = l2distance(X,X);
else
    G=X'*Z;   %n*m
    Ss=diag(X'*X); %n*1
    Rr=diag(Z'*Z);  %m*1
    [~,n]=size(X);  
    [~,m]=size(Z);
    S=repmat(Ss,1,m);
    R=repmat(Rr',n,1);
    D=sqrt(S+R-2*G);
end;


