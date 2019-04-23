% M.Amintoosi, HSU, 2018
% Algorithm 2. Newton Descent, Duda, p. 226
%% Symbolic Math
clc
clear
x = sym('x',[2 1]);
f = x(1)-x(2)+2*x(1)^2+2*x(1)*x(2)+x(2)^2
for i=1:2
    gf(i,1) = diff(f,x(i));
end
for i=1:2
    for j=1:2
        H(i,j) = diff(gf(i),x(j));
    end
end
% subs(f,x,[0;0])
% subs(gf,x,[0;0])
figure(1)
ezmesh(f)
hold on
ezcontour(f)
view([5,38])
%%
theta = 0.01;
s = [4;5];
maxIter = 200;
k = 0;
while true
    k = k+1;
    Fs(k) = (subs(f,x,s));
    plot3(s(1),s(2),Fs(k),'.k','MarkerSize',15);
    if norm(subs(H,x,s)^-1*subs(gf,x,s))< theta || k > maxIter
        break
    end
%     pause(.01)
    s = s - subs(H,x,s)^-1*subs(gf,x,s);
end
plot3(s(1),s(2),Fs(k),'pr','MarkerSize',30)

hold off

figure(2)
plot(Fs)
double(s)
double(Fs(end))

%%
% fun = @(x) x(1)-x(2)+2*x(1)^2+2*x(1)*x(2)+x(2)^2
% plotobjective(fun,[-20 20; -20 20]);