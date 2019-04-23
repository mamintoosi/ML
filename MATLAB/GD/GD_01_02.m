% M,Amintoosi, HSU, 2018
% Gradient Descent

clc
clear
close all
f = [2 3 4];  % 2x^2 +3x + 4
gf = polyder(f);
x = -10:.1:10;
y = polyval(f,x);
figure(1)
plot(x,y,':m');%5,'LineWidth',2)
hold on
%%
maxIter = 20;
alpha = .1;
s = 3;
plot(s,polyval(f,s),'*g')
for k=1:maxIter
    Fs(k) = polyval(f,s);
    plot(s,polyval(f,s),'.b')
    pause(.5)
    s = s - alpha*polyval(gf,s)
end
Fs(maxIter+1) = polyval(f,s);
s
Fs(end)

plot(s,polyval(f,s),'*r')
hold off

figure(2)
plot(Fs)


%%
% fun = @(x) x(1)-x(2)+2*x(1)^2+2*x(1)*x(2)+x(2)^2
% plotobjective(fun,[-20 20; -20 20]);