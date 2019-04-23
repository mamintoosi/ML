% M.Amintoosi, HSU, 2018
% Algorithm 2. Newton Descent, Duda, p. 226
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

theta = 0.01;
s = [4;5];
maxIter = 200;
k = 0;
while true
    k = k+1;
    [Fs(k),gf,H] = fun(s);
    plot3(s(1),s(2),Fs(k),'.k','MarkerSize',15);
    if norm(H^-1*gf)< theta || k > maxIter
        break
    end
%     pause(.01)
    s = s - H^-1*gf;
end
plot3(s(1),s(2),Fs(k),'pr','MarkerSize',30)

hold off

figure(2)
plot(Fs)
s
Fs(end)