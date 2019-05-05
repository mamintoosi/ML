% 
% A Tutorial on Data Reduction
% Aly A. Farag
X1 = [4,2 ; 2,4; 2,3 ; 3,6; 4 ,4];
X2 = [9,10;6,8;9,5;8,7;10,8];
A1 = X1;
A2 = X2;
A = [A1;A2]
mu1 = mean(A1)'
mu2 = mean(A2)'

S1 = cov(X1)
S2 = cov(X2)

SW = S1+S2;

SB = (mu1-mu2)*(mu1-mu2)'

SX = SW^-1*SB

% I = eye(2);
% syms L
% h = SX-L*I
% solve(det(h))

[V,D] = eig(SX)
% [V,D] = svd(SX)
W1 = V(:,1);
W2 = V(:,2);

% m1_m2 = mu1-mu2;
% SB*m1_m2
% SB*m1_m2./m1_m2
% eig(SB)
% m1_m2'*m1_m2
% SW^-1*(m1_m2)
%
% disp('Sx*w1 == L2*w1')
% SX*W1
% L1 = D(1,1);
% L1*W1
%
% disp('Sx*w1 == L2*w1')
% SX*W2
% L2 = D(2,2);
% L2*W2

W = W1;
Y1 = X1*W;
Y2 = X2*W;

plot(X1(:,1),X1(:,2),'rs',X2(:,1),X2(:,2),'bo')
hold on
quiver(W(1),W(2),'k')
quiver(W2(1),W2(2),'m')
hold off
axis square

y = [Y1;Y2];
Jopt = (mean(y(1:5))-mean(y(6:9)))^2/(var(y(1:5))+var(y(6:9)))
JnonOpt = (mean(y([1 3 5 7 9]))-mean(y([2 4 6 8])))^2/(var(y([1 3 5 7 9]))+var(y([2 4 6 8])))
%% Paper Method
% n1 = size(A1,1);
% e1 = ones(n1,1);
% m1 = (mu1*e1')'
% A1_m1 = A1-m1
%
% n2 = size(A2,1);
% e2 = ones(n2,1);
% m2 = (mu2*e2')'
% A2_m2 = A2-m2
%
% Hw = [A1_m1 ; A2_m2]
%
% m = mean(A);
%%
s1 = zeros(2);
for i=1:5
    s1 = s1 + (X1(i,:)'-mu1)*((X1(i,:)'-mu1)');
end
