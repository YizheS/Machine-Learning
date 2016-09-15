function [ypredict]=evaltree(T,xTe)
% function [ypredict]=evaltree(T,xTe);
%
% input:
% T0  | tree structure
% xTe | Test data (dxn matrix)
%
% output:
%
% ypredict : predictions of labels for xTe
%

%% fill in code here
[a, q] = size(T); %q: total number of nodes
[d,n] = size(xTe);
ypredict = zeros(1,n);
 
for i = 1:n %classify one observation at a time
    k = 1; %starts at root
    while k < q;
        if T(4,k)==0 %&& T(5,k)==0 %if the node is a leaf (no sub-trees)
            break; % then break the while loop
        end;
       
        if xTe(T(2,k), i) <= T(3,k) %if classify to left
            k =T(4,k);
        else
            k = T(5,k);
        end;
    end;
    ypredict(1,i) = T(1, k); % the predicted y is the predication at final node
end;

end

