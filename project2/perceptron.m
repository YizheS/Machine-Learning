function w=perceptron(x,y);
% function w=perceptron(x,y);
%
% Implementation of a Perceptron classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
%
% Output:
% w : weight vector
%

[d,n]=size(x);
w=zeros(d,1);
counter = 0;
%% fill in code here
while true
    m = 0;
    r = randperm(n);
    for i = 1:n
        if y(r(i))* (w'*x(:,r(i)))<= 0
            w = perceptronUpdate(y(r(i)),x(:,r(i)),w);
            m = m + 1;
        end;
    end;
    counter = counter + 1;
    if m==0 || counter>100
        break;
    end;
end;

