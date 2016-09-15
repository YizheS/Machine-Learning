function preds = classifyLinear(x,w,b);
% function preds=classifyLinear(x,w,b);
%
% Make predictions with a linear classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% w : weight vector (dx1)
% b : bias (scalar)
%
% Output:
% preds: predictions (1xn)
%

% if no bias is given, set it to zero
if nargin<3
	b=0;
    preds=classifyLinear(x,w,b);
else
    preds=b+sign(w'*x);
end;
% %% fill in code here
% [~,n] = size(x);
% c(1,1:n)=1;
% x = [x;c];
% w = [w;b];
% preds = sign(w'*x);

