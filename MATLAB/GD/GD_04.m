% M.Amintoosi, HSU, 2018
% Gradient Descent
% Algorithm 1, p.225 Duda
%% Symbolic Math
clc
clear
x = sym('x',[2 1]);
f = x(1)-x(2)+2*x(1)^2+2*x(1)*x(2)+x(2)^2
for k=1:2
    gf(k,1) = diff(f,x(k));
end
% subs(f,x,[0;0])
% subs(gf,x,[0;0])
figure(1)
ezmesh(f)
hold on
ezcontour(f)
view([5,38])
%%
etha = .05;
theta = 0.01;
s = [4;5];
maxIter = 200;
k = 0;
while true
    k = k+1;
    Fs(k) = (subs(f,x,s));
    plot3(s(1),s(2),Fs(k),'.k','MarkerSize',15);
    if norm(etha*subs(gf,x,s))< theta || k > maxIter
        break
    end
%     pause(.01)
    s = s - etha*subs(gf,x,s);
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