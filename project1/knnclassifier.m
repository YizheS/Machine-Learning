function preds=knnclassifier(xTr,yTr,xTe,k);
% function preds=knnclassifier(xTr,yTr,xTe,k);
%
% k-nn classifier 
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
% k = number of nearest neighbors to be found
%
% Output:
%
% preds = predicted labels, ie preds(i) is the predicted label of xTe(:,i)
%


% output random result as default (you can erase this code)
%[d,n]=size(xTe);
%[d,ntr]=size(xTr);
%if k>ntr,k=ntr;end;

%currently assigning random predictions
%un=unique(yTr);
%preds=un(ceil(rand(1,n)*length(un)));

%% fill in code here

isBad = 0;
[indices,~] = findknn(xTr,xTe,k);

if(k==1)
    preds = yTr(indices);
else
    [preds,~,C] = mode(yTr(indices));
    lengthC = cellfun(@length,C);
    isBad = ~all(lengthC == 1);
end;

while(isBad == 1 && k>1)
    k = k - 1;
    if(k == 1)
        preds = yTr(indices(1,:));
    else
        [preds,~,C] = mode(yTr(indices(1:k,:)));
        lengthC = cellfun(@length,C);
        isBad = ~all(lengthC == 1);
    end;
end;
