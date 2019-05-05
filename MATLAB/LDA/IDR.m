X1 = [4,2 ; 2,4; 2,3 ; 3,6; 4 ,4];
X2 = [9,10;6,8;9,5;8,7];
A1 = X1';
A2 = X2';
A = [A1 , A2]
mu1 = mean(A1')'
mu2 = mean(A2')'



%% Paper Method
n1 = size(A1,2);
e1 = ones(n1,1);
m1 = mu1*e1'
A1_m1 = A1-m1

n2 = size(A2,2);
e2 = ones(n2,1);
m2 = mu2*e2';
A2_m2 = A2-m2

Hw = [A1_m1  A2_m2]

m = mean(A')';
Hb = [sqrt(n1)*(mu1-m) , sqrt(n2)*(mu2-m) ]

% Page 2
Sw = Hw*Hw'
Sb = Hb*Hb'

% Page 4, Algorithm 1
C = [mu1 mu2]
[Q,R] = qr(C);
Z = Hw' * Q;
Y = Hb' * Q;
W = Z'*Z;
B = Y'*Y;
mu = .001;
[phi,D] = eig((W+mu*eye(2))'*B);
M = phi;
G = Q*M;

y = G(:,1)'*A

plot(A1(1,:),A1(2,:),'rs',A2(1,:),A2(2,:),'bo')
hold on
quiver(G(1,1),G(2,1))
quiver(G(1,2),G(2,2),'r')
quiver(V(1,1),V(2,1),'g')
hold off
axis square
% axis equal

J = abs(mean(y(1:5))-mean(y(6:9)))/(var(y(1:5))+var(y(6:9)))