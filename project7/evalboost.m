function preds=evalboost(BDT,xTe)
% function preds=evalboost(BDT,xTe);
%
% Evaluates a boosted decision tree on a test set xTe.
%
% input:
% BDT | Boosted Decision Trees
% xTe | matrix of m input vectors (matrix size dxm)
%
% output:
%
% preds | predictions of labels for xTe
%

%% fill in code here
preds = 0;
a= 0;
[~,n]=size(BDT);
for i = 1:n
    preds = preds+  BDT{1,i}*evaltree(BDT{2,i}, xTe);
    a = a+ BDT{1,i};
end;
preds = round(preds/a);


