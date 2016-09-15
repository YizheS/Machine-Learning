function T=prunetree(T,xTe,y)
% function T=prunetree(T,xTe,y)
%
% Prunes a tree to minimal size such that performance on data xTe,y does not
% suffer.
%
% Input:
% T = tree
% xTe = validation data x (dxn matrix)
% y = labels (1xn matrix)
%
% Output:
% T = pruned tree
%

%% fill in code here
[~,n]=size(y);
[~,q]=size(T);

te = analyze('acc',y,evaltree(T,xTe));
   
   
for i=1:n
  k=1;  
  
  while k<=q
    if T(4,k)==0;
      break;
    end
    if xTe(T(2,k),i) <= T(3,k)
      k=T(4,k);
    else  
      k=T(5,k);
    end
  end
  if T(1,k)~=y(i)
    s=int16(T(6,k));
    T(4,s)=0;
    T(5,s)=0;
    T(6,k)=0;
    tr = analyze('acc',y,evaltree(T,xTe));
    if tr<te
      T(4,s)=2*s;
      T(5,s)=2*s+1;
      T(6,k)=s;
    end
  end
end    
