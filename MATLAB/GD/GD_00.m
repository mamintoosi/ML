x(1) = 10;
for i=1:200
    x(i+1) = x(i) - .05*6*x(i);
end
xStar = x(end)
yStar = 3*xStar^2+5