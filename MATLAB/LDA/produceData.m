function [X,C] = produceData(N)
% M.Amintoosi
% N should be even
% X: The produced Data
% C: Class of the produced data: -1,1
if nargin == 0
    N = 60;
end
mu1 = [-1 -2];
mu2 = [5 4];
nesf = round(N/2);
x1 = normrnd(mu1(1),5,nesf,1);
y1 = normrnd(mu1(2),1,nesf,1);

x2 = normrnd(mu2(1),5,nesf,1);
y2 = normrnd(mu2(2),1,nesf,1);

X = [x1 y1; x2 y2];
C = ones(nesf,1);
C = [C ; -1*C];

% Shuffle 
rndIdx = randperm(N);
X = X(rndIdx,:);
C = C(rndIdx,:);