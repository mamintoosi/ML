% M.Amintoosi, HSU, 2018
% Gradient Descent
% 3 variables
%% Symbolic Math
clc
x = sym('x',[3,1]);
f = (x(1)-4)^4+(x(2)-3)^2+4*(x(3)+5)^4
for i=1:3
    gf(i,1) = diff(f,x(i))
end
subs(f,x,[0;0;0])
subs(gf,x,[0;0;0])
%%
alpha = 0.004;
s = [4;2;-1];
Fs = double(subs(f,x,s));
for i=1:10
    Fs(i) = double(subs(f,x,s));
    s = s - alpha*double(subs(gf,x,s))
end
Fs(6) = double(subs(f,x,s));

figure(2)
plot(Fs)
s
Fs(end)