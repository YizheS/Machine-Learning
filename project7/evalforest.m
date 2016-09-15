function preds=evalforest(F,xTe)
% function preds=evalforest(F,xTe);
%
% Evaluates a random forest on a test set xTe.
%
% input:
% F   | Forest of decision trees
% xTe | matrix of m input vectors (matrix size dxm)
%
% output:
%
% preds | predictions of labels for xTe
%

%% fill in code here
[~, nt] = size(F);
for t = 1:nt
    ypredict(t,:)=evaltree(F{t},xTe); 
end;
preds = mode(ypredict); % average over all prediction results


