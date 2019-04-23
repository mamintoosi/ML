% M.Amintoosi, HSU, 2018
% Gradient Descent
% 
% write your function definition in fun.m
clc
clear
fn =  @(x,y) x-y+2*x^2+2*x*y+y^2
figure(1)
fmesh(fn,[-6 6 -6 6])
hold on
fcontour(fn,[-6 6 -6 6])
view([5,38])
%%
etha = .05;
theta = 0.001;
s = [4;5];
maxIter = 200;
k = 0;
while true
    k = k+1;
    [Fs(k),gf] = fun(s);
    plot3(s(1),s(2),Fs(k),'.k','MarkerSize',15);
    if norm(etha*gf)< theta || k > maxIter
        break
    end
%     pause(.01)
    s = s - etha*gf;
end
plot3(s(1),s(2),Fs(k),'pr','MarkerSize',30)

hold off

figure(2)
plot(Fs)
s
Fs(end)