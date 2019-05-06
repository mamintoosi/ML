% M.Amintoosi
% http://openclassroom.stanford.edu/MainFolder/DocumentPage.php?course=MachineLearning&doc=exercises/ex4/ex4.html

x = load('ex4x.dat');
y = load('ex4y.dat');
m = length(y); % store the number of training examples
x = [ones(m, 1), x]; % Add a column of ones to x
sigma = std(x);
mu = mean(x);
x(:,2) = (x(:,2) - mu(2))./ sigma(2);
x(:,3) = (x(:,3) - mu(3))./ sigma(3);

theta = zeros(size(x(1,:)))'; % initialize fitting parameters

figure(1) % open a new figure window
clf
% find returns the indices of the
% rows meeting the specified condition
pos = find(y == 1); neg = find(y == 0);

% Assume the features are in the 2nd and 3rd
% columns of x
plot(x(pos, 2), x(pos,3), '+'); hold on
plot(x(neg, 2), x(neg, 3), 'o')


%% Linear Regression
MAX_ITR = 15;
alpha = 0.07;
for num_iterations = 1:MAX_ITR
    grad = (1/m).* x' * ((x * theta) - y);
    theta = theta - alpha .* grad;
end
% print theta to screen
thetaLin = theta
%%
% hold on % Plot new data without clearing old plot
drawLine(x,theta,'r:');
exact_theta = (x' * x)\x' * y;
drawLine(x,exact_theta,'k:');

%% Logistic Regression
g = @(z)1.0 ./ (1.0 + exp(-z)); 
% h = inline('g(theta''*x');
% Usage: To find the value of the sigmoid 
% evaluated at 2, call g(2)
theta = zeros(size(x(1,:)))'; % initialize fitting parameters
for num_iterations = 1:MAX_ITR
    grad = (1/m).* x' * (g(x * theta) - y);
    theta = theta - alpha .*grad;
end
% print theta to screen
theta
drawLine(x,theta,'r-.');
%%
theta = zeros(size(x(1,:)))'; % initialize fitting parameters
for num_iterations = 1:MAX_ITR
    H = (1/m).* (x'.* repmat(g(x * theta)',3,1)) * (repmat(1-g(x * theta),1,3).*x);
    grad = (1/m).* x' * (g(x * theta) - y);
    theta = theta - alpha .* H^-1*grad;
end
% print theta to screen
theta
drawLine(x,theta,'k-.');

