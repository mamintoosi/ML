% M.Amintoosi, HSU, 2018
% Gradient Descent
% Column wise vectors
%% Symbolic Math
clc
clear
x = sym('x',[2 1]);
f = x(1)-x(2)+2*x(1)^2+2*x(1)*x(2)+x(2)^2
for i=1:2
    gf(i,1) = diff(f,x(i))
end
subs(f,x,[0;0])
subs(gf,x,[0;0])
figure(1)
ezmesh(f)
hold on
ezcontour(f)
view([5,38])
%%
alpha = .05;
s = [4 5];
Fs = (subs(f,x,s));
maxIter = 200;
for i=1:maxIter 
    Fs(i) = (subs(f,x,s));
    plot3(s(1),s(2),Fs(i),'.k','MarkerSize',15)
%     pause(.01)
    s = s - alpha*(subs(gf,x,s));
end
Fs(maxIter+1) = (subs(f,x,s));
plot3(s(1),s(2),Fs(maxIter+1),'pr','MarkerSize',30)

hold off

figure(2)
plot(Fs)
double(s)
double(Fs(end))

%%
% fun = @(x) x(1)-x(2)+2*x(1)^2+2*x(1)*x(2)+x(2)^2
% plotobjective(fun,[-20 20; -20 20]);