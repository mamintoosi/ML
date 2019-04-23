% M.Amintoosi, HSU, 2018
% Gradient Descent

clc
clear
% close all
f = [2 3 4];  % 2x^2 +3x + 4
gf = polyder(f);
x = -10:.1:10;
y = polyval(f,x);
figure(1)
plot(x,y,':m','LineWidth',2)
hold on
% z = polyval(gf,x);
% plot(x,z,':g','LineWidth',2)
%%
maxIter = 20;
alpha = .41;%.55;
s(1) = 6;
plot(s,polyval(f,s),'*g')
for k=1:maxIter
    Fs(k) = polyval(f,s(k));
    plot(s(k),Fs(k),'pb','MarkerSize',20)
    pause(.05)
    s(k+1) = s(k) - alpha*polyval(gf,s(k));
end
Fs(maxIter+1) = polyval(f,s(maxIter+1));
s(end)
Fs(end)
%%
plot(s(end),Fs(end),'sr','MarkerSize',30)
plot(s,Fs,'y--','LineWidth',5)
hold off

figure(2)
plot(Fs)


%%
% fun = @(x) x(1)-x(2)+2*x(1)^2+2*x(1)*x(2)+x(2)^2
% plotobjective(fun,[-20 20; -20 20]);