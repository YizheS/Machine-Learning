function F=forest(x,y,nt)
% function F=forest(x,y,nt)
%
% INPUT:
% x | input vectors dxn
% y | input labels 1xn
%
% OUTPUT:
% F | Forest
%

%% fill in code here

[d,n]=size(x);
[~,n]=size(y);


if nargin<3 
   nt=n;
end


sample=[1:n];


for i = 1:nt
  rsample = randsample(sample,n);
  F{i} = id3tree(x(:,rsample),y(rsample));
end
