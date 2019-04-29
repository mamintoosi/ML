clear all; close all; clc
x = load('ex2x.dat'); y = load('ex2y.dat');
m = length(y); % number of training examples

%% Gradient descent
x = [ones(m, 1) x]; % Add a column of ones to x
theta =[.65 ;.1];%zeros(size(x(1,:)))'; % initialize fitting parameters rand(2,1);%
MAX_ITR = 50;
alpha = 0.07;
%%
for num_iterations = 1:MAX_ITR
    grad = (1/m)* x' * ((x * theta) - y);
    theta = theta - alpha .* grad;
end
% print theta to screen
theta
