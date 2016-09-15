function T=id3tree(xTr,yTr,maxdepth,weights)
% function T=id3tree(xTr,yTr,maxdepth,weights)
%
% The maximum tree depth is defined by "maxdepth" (maxdepth=2 means one split).
% Each example can be weighted with "weights".
%
% Builds an id3 tree
%
% Input:
% xTr | dxn input matrix with n column-vectors of dimensionality d
% yTr | 1xn input matrix
% maxdepth = maximum tree depth
% weights = 1xn vector where weights(i) is the weight of example i
%
% Output:
% T = decision tree
%

%% fill in code here
[d,n] = size(xTr);

if nargin==3,
    q = 1+ (maxdepth-1)*maxdepth;
    weights=ones(1,n)/n;
elseif nargin==2
    maxdepth = inf;
    weights=ones(1,n)/n;
    q = (1+n)*n/2;
else 
    q = 1+ (maxdepth-1)*maxdepth;
end

S = cell(2,q); 
T = zeros(6,q);
node = 2; 
S{1,1} = xTr; 
S{2,1} = yTr;

for i = 1:q
    if i==node
        T(:,i:end) = [];
        break;
    end
    x = S{1,i};
    y = S{2,i};
    [feature,k,~] = entropysplit(x,y,weights);
    T(1,i) = mode(y);
    if ~(feature==0 || size(x,2)==1)
        T(2:4,i) = [feature;k;node];
        S{1, node} = x(:,find(x(feature,:)<=k));%left
        S{2, node} = y(:,find(x(feature,:)<=k));%left
        T(6,node) = i;
        T(5,i) = node +1;
        S{1, node+1} = x(:,find(x(feature,:)>k));%right
        S{2, node+1} = y(:,find(x(feature,:)>k));%right
        T(6,node+1) = i;
        if node+2>q
            T(4:5,i)=0;
        else
            node = node+2;
        end
    end

end  

if size(T,2)> q
    T(:, q+1:end) = [];
end;